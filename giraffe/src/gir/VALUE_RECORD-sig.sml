(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature VALUE_RECORD =
  sig
    type t

    structure C :
      sig
        structure Pointer : C_POINTER
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ValueType :
          C_VALUE_TYPE
            where type t = t
            where type v = non_opt p

        structure PointerType :
          C_POINTER_TYPE
            where type t = t
            where type opt = opt
            where type non_opt = non_opt
            where type 'a p = 'a p
      end

    structure FFI :
      sig
        type opt = C.opt
        type non_opt = C.non_opt
        type 'a p = 'a C.p
        type ('a, 'b) r = ('a, 'b) C.r

        val withPtr : (non_opt p -> 'a) -> t -> 'a
        val withOptPtr : (opt p -> 'a) -> t option -> 'a

        val withNewPtr : (non_opt p -> 'a) -> unit -> (non_opt p, 'a) pair

        val withRefPtr : ((non_opt, 'a) r -> 'b) -> t -> ('a p, 'b) pair
        val withRefOptPtr : ((opt, 'a) r -> 'b) -> t option -> ('a p, 'b) pair

        val fromPtr : bool -> non_opt p -> t
        val fromOptPtr : bool -> opt p -> t option
      end
  end
