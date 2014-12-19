(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * Structure `CString` provides null-terminated strings.  Null-terminated
 * strings are required in SML because MLton does not null-terminate strings
 * passed over the FFI.
 *)
structure CString :>
  sig
    (**
     * The type `cstring` represents null-terminated strings.
     *)
    type cstring

    (**
     * Conversion between `string` and `cstring`.
     *
     * `fromString s` appends a null terminator, if required.
     * `toString s` removes the null terminator.
     *)
    val fromString : string -> cstring
    val toString : cstring -> string

    (**
     * `size s` returns the number of characters in `s` excluding the null
     * terminator.
     *)
    val size : cstring -> int

    (**
     * `sub (s, i)` returns the character in `s` at zero-based index `i`.
     * The exception `Subscript` is raised when `i < 0` or `size s <= i`.  
     * Note that `Subscript` is raised when `i` indexes the null terminator.
     *)
    val sub : cstring * int -> char
  end = struct
    type cstring = string  (* last character, and no other, is null *)

    (**
     * `fromString s` creates a null-terminated string from `s` as follows:
     * if `s` already contains a null character then extract the substring up
     * to and including the first null character, otherwise append a null
     * character.
     *)
    fun fromString s =
      case CharVector.findi (fn (_, c) => c = #"\000") s of
        SOME (i, _) => String.substring (s, 0, i + 1)
      | NONE        => s ^ "\000"

    fun toString s = substring (s, 0, String.size s - 1)  (* drop null *)

    fun size s = String.size s - 1  (* don't count null *)

    fun sub (s, i) =
      if i < String.size s  (* check for index to null *)
      then String.sub (s, i)
      else raise Subscript
  end

type cstring = CString.cstring
