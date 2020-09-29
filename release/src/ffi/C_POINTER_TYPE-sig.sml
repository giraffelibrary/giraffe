(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_POINTER_TYPE =
  sig
    type t

    structure Pointer : C_POINTER
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p

    (**
     * `dup d p` and `free d p` duplicate and free, respectively, the
     * data referenced by the C pointer `p` where `d` indicates the depth
     * to duplicate and free, respectively, to.  `d = 0` effects no
     * operation, `d = 1` duplicates and frees, respectively, only the
     * top-level structure, `d = 2` the top two levels, etc.  `d = ~1`
     * duplicates and frees, respectively, all levels.  For data that is
     * reference-counted, duplicating increments the reference count and
     * freeing decrements the reference count and deallocates memory iff
     * the count reaches zero.
     *)
    val dup  : int -> non_opt p -> non_opt p
    val free : int -> non_opt p -> unit

    (**
     * Conversion to and from the C representation is provided by `toC`
     * and `fromC`.  `fromC p` copies data referenced by the C pointer
     * `p` and `toC t` copies data referenced by C pointers in `t`, if
     * any exist.  For data that is reference-counted, copying increments
     * the reference count.
     *
     * `free ~1` must be applied to the pointer returned by `toC t` once
     * it is not required.
     *)
    val toC : t -> non_opt p
    val fromC : non_opt p -> t
  end
