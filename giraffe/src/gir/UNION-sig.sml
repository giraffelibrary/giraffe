(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature UNION =
  sig
    type 'a union
    type t = base union
    val toBase : 'a union -> base union

    structure C :
      sig
        structure Pointer : C_POINTER
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

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

        val withPtr : (non_opt p -> 'a) -> 'b union -> 'a
        val withDupPtr : (non_opt p -> 'a) -> 'b union -> 'a
        val withOptPtr : (opt p -> 'a) -> 'b union option -> 'a
        val withDupOptPtr : (opt p -> 'a) -> 'b union option -> 'a

        val withRefPtr : ((non_opt, 'a) r -> 'b) -> 'c union -> ('a p, 'b) pair
        val withRefDupPtr : ((non_opt, 'a) r -> 'b) -> 'c union -> ('a p, 'b) pair
        val withRefOptPtr : ((opt, 'a) r -> 'b) -> 'c union option -> ('a p, 'b) pair
        val withRefDupOptPtr : ((opt, 'a) r -> 'b) -> 'c union option -> ('a p, 'b) pair

        val fromPtr : bool -> non_opt p -> base union
        val fromOptPtr : bool -> opt p -> base union option
      end
  end
