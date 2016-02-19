(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_ARRAY_TYPE =
  sig
    type elem
    type vector

    structure Vector :
      MONO_VECTOR
        where type elem = elem
        where type vector = vector

    structure C :
      sig
        type 'a from_p
        structure Pointer : C_POINTER
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type e

        (* In `dup d ...` and `free d ...`, `d` indicates the depth to
         * duplicate and free, respectively, to.  `d = 0` effects no
         * operation, `d = 1` duplicates and frees, respectively, only the
         * top-level array, `d = 2` the top two array levels, etc.
         * `d = ~1` duplicates and frees, respectively, all levels. *)
        val dup  : int -> (notnull p -> notnull p) from_p
        val free : int -> (notnull p -> unit) from_p
        val len  : (notnull p -> int) from_p
        val sub  : (notnull p -> int -> e) from_p

        val toElem : e -> elem

        (* `free ~1` must be applied to the pointer returned by
         * `fromVector v` once it is not required. *)
        val fromVector : vector -> notnull p
        val toVector : (notnull p -> vector) from_p
      end
  end
