(* Copyright (C) 2012, 2016, 2019-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * Modify the behaviour of `use` in the top level environment as follows:
 *
 *  1. Environment variable expansion
 *
 *     In the `file` argument, occurrences of '$(<var>)' where <var> does not
 *     contain a ')' character are replaced by the contents of the environment
 *     variable '<var>' if defined and otherwise by the empty string.  A '$'
 *     character in a file name must be escaped as '$$'.  An error occurs in
 *     the following cases:
 *       - '$' is not followed by a '(' or '$'
 *       - after '$(', '(' occurs before the next ')'
 *       - after '$(', there is no subsequent ')'
 *
 *  2. Relative paths
 *
 *     If `use file` is evaluated in a file, then a relative path in `file`
 *     is relative to the directory containing the file.  Otherwise, if
 *     `use file` is not evaluated in a file, then a relative path in `file`
 *     is relative to the current working directory.
 *)

local
  fun expand (file : string) : string =
    let
      datatype state = Normal | Escape | Name

      val dollarSlice = Substring.full "$"
      fun slice (i, j) = CharVectorSlice.slice (file, i, SOME (j - i))
      fun readChar (j, c, acc as (i, state, slices)) =
        case (state, c) of
          (Normal, #"$") => (j + 1, Escape, slice (i, j) :: slices)
        | (Normal, _)    => acc
        | (Escape, #"(") => (j + 1, Name, slices)
        | (Escape, #"$") => (j + 1, Normal, dollarSlice :: slices)
        | (Escape, c)    => raise Fail (concat ["found '", str c, "' following '$'"])
        | (Name,   #")") => (
            j + 1,
            Normal,
            Substring.full (
              case OS.Process.getEnv (Substring.string (slice (i, j))) of
                SOME s => s
              | NONE   => ""
            ) :: slices
          )
        | (Name,   #"(") => raise Fail "found '(' in variable name"
        | (Name,   _)    => acc
    in
      case CharVector.foldli readChar (0, Normal, []) file of
        (0, Normal, [])     => file
      | (i, Normal, slices) => Substring.concat (rev (slice (i, size file) :: slices))
      | _                   => raise Fail "incomplete"
    end
      handle
        Fail msg => raise Fail (concat ["invalid escape (", msg, ")"])
in
  fun use file =
    let
      val expandedFile = expand file
    in
      PolyML.use (
        if OS.Path.isRelative expandedFile
        then
          case PolyML.getUseFileName () of
            SOME name => OS.Path.concat (OS.Path.dir name, expandedFile)
          | NONE      => expandedFile
        else
          expandedFile
      )
    end
end


(**
 * Use a file for an external module if the module has not already been used.
 * The module name is encoded in the base of the file name.  `useExt path`
 * uses `path` if the base of the file of `path` has the form
 *   - <name>-fun and there is no functor called name,
 *   - <name>-sig and there is no signature called name,
 *   - <name> that is neither <name>-fun or <name>-sig   
 *                and there is no structure called name.
 * This encoding of module names requires a file system to be case preserving
 * but not case sensitive.
 *)

fun useExt path =
  let
    fun fromBase base =
      let
        open String
        fun dropSuffix suffix = substring (base, 0, size base - size suffix)
      in
        if isSuffix "-fun" base
        then (PolyML.Compiler.functorNames (),   dropSuffix "-fun")
        else if isSuffix "-sig" base
        then (PolyML.Compiler.signatureNames (), dropSuffix "-sig")
        else (PolyML.Compiler.structureNames (), base)
      end

    val (existingNames, name) = fromBase (OS.Path.base (OS.Path.file path))
  in
    if List.exists (fn x => x = name) existingNames
    then ()
    else use path
  end
