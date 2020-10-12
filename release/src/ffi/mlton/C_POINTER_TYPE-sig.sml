(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_POINTER_TYPE =
  sig
    include C_POINTER_TYPE

    structure CVector :
      sig
        type cvector
        val v : cvector  (* dummy value, never read *)

        (* `free c` frees data referenced by C pointers in `c`, if any exist.
         * For data that is reference-counted, freeing decrements the
         * reference count and deallocates memory iff the count reaches zero. *)
        val free : cvector -> unit

        (* `fromPointer p` copies data referenced by the C pointer `p` and
         * `toPointer c` copies data referenced by C pointers in `c`, if any
         * exist.  For data that is reference-counted, copying increments the
         * reference count.  `C.free ~1` must be applied to the C pointer
         * returned by `toPointer c` once it is not required.
         *
         * `fromVal t` and `toVal c` also copy data referenced by C pointers
         * in `t` and `c`, if any exist, because freeing of data referenced
         * by C pointers may differ between types `t` and `cvector`.  In type
         * `t`, freeing can be performed by finalization of finalizable
         * values.  The type `cvector` cannot contain finalizable values and
         * freeing is performed by explicitly applying the function `free`. *)
        val fromPointer : (non_opt p -> cvector) from_p
        val toPointer : (cvector -> non_opt p) from_p
        val fromVal : t -> cvector
        val toVal : cvector -> t
      end
  end
