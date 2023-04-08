(* Copyright (C) 2017-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CLASS =
  sig
    type 'a class
    type t = base class
    type 'a value_accessor_t
    val toBase : 'a class -> base class
    val toDerived : 'a class value_accessor_t -> base class -> 'a class

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

        val withPtr    : bool -> (non_opt p -> 'a) -> base class        -> 'a
        val withOptPtr : bool -> (opt     p -> 'a) -> base class option -> 'a

        val withRefPtr    : bool -> ((non_opt, 'a) r -> 'b) -> base class        -> ('a p, 'b) pair
        val withRefOptPtr : bool -> ((opt,     'a) r -> 'b) -> base class option -> ('a p, 'b) pair

        val fromPtr    : bool -> non_opt p -> base class
        val fromOptPtr : bool -> opt     p -> base class option

        val touchPtr    : 'a class        -> unit
        val touchOptPtr : 'a class option -> unit
      end
  end
