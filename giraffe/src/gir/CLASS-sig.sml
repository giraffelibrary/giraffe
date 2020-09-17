(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CLASS =
  sig
    type 'a class
    type t = base class
    val toBase : 'a class -> base class

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

        val withPtr    : bool -> (non_opt p -> 'a) -> 'b class        -> 'a
        val withOptPtr : bool -> (opt     p -> 'a) -> 'b class option -> 'a

        val withRefPtr    : bool -> ((non_opt, 'a) r -> 'b) -> 'c class        -> ('a p, 'b) pair
        val withRefOptPtr : bool -> ((opt,     'a) r -> 'b) -> 'c class option -> ('a p, 'b) pair

        val fromPtr    : bool -> non_opt p -> base class
        val fromOptPtr : bool -> opt     p -> base class option

        val touchPtr    : 'a class        -> unit
        val touchOptPtr : 'a class option -> unit
      end
  end
