(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_ARRAY_TYPE =
  sig
    include C_ARRAY_TYPE

    structure CVector :
      sig
        type cvector
        val v : cvector
        val v1 : cvector    (* len v1 = 1 *)
        val v2 : cvector    (* len v2 = 2 *)
        val v3 : cvector    (* len v3 = 3 *)

        val free : cvector -> unit

        exception NoSMLValue

        val clen : cvector -> int
        val cget : cvector -> int -> elem
        val cset : cvector -> int * elem -> cvector

        (* `free ~1` must be applied to the pointer returned by
         * `toPointer c` once it is not required. *)
        val fromPointer : (non_opt p -> cvector) from_p
        val toPointer   : (cvector -> non_opt p) from_p
        val fromVal     : t -> cvector
        val toVal       : cvector -> t
      end
  end
