(* Copyright (C) 2017-2021 Phil Clayton <phil.clayton@veonix.com>
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

        type 'a from_p = 'a

        structure PointerType :
          C_POINTER_TYPE
            where type t = t
            where type opt = opt
            where type non_opt = non_opt
            where type 'a p = 'a p
            where type 'a from_p = 'a from_p

        val takePtr : non_opt p -> t
        val withPtr : (non_opt p -> 'a) -> t -> 'a
        val giveDupPtr : (non_opt p -> 'a) -> t -> 'a
        val touchPtr : t -> unit
      end

    structure FFI :
      sig
        type opt = C.opt
        type non_opt = C.non_opt
        type 'a p = 'a C.p
        type ('a, 'b) r

        val withPtr    : bool -> (non_opt p -> 'a) -> base union        -> 'a
        val withOptPtr : bool -> (opt     p -> 'a) -> base union option -> 'a

        val withRefPtr    : bool -> ((non_opt, 'a) r -> 'b) -> base union        -> ('a p, 'b) pair
        val withRefOptPtr : bool -> ((opt,     'a) r -> 'b) -> base union option -> ('a p, 'b) pair

        val fromPtr : bool -> non_opt p -> base union
        val fromOptPtr : bool -> opt p -> base union option

        val touchPtr    : 'a union        -> unit
        val touchOptPtr : 'a union option -> unit
      end
  end
