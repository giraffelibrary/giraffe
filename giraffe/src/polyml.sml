(* Copyright (C) 2012, 2016, 2019 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * Modify the behaviour of `use` in the top level environment so that when
 * used in a file it interprets a relative path relative to the directory
 * containing the file.
 *)

fun use file =
  PolyML.use (
    if OS.Path.isRelative file
    then
      case PolyML.getUseFileName () of
        SOME name => OS.Path.concat (OS.Path.dir name, file)
      | NONE      => file
    else
      file
  )


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
