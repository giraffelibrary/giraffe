(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
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
        type t
        val v1 : t    (* len v1 = 1 *)
        val v2 : t    (* len v2 = 2 *)
        val v3 : t    (* len v3 = 3 *)

        exception NoSMLValue

        val len : t -> int
        val sub : t -> int -> elem

        (* `free ~1` must be applied to the pointer returned by
         * `toPointer t` once it is not required. *)
        val fromPointer : (C.notnull C.p -> t) C.from_p
        val toPointer   : t -> C.notnull C.p
        val fromVector  : vector -> t
        val toVector    : t -> vector
      end
  end
