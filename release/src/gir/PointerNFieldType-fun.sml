(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor PointerNFieldType(
  type t
  structure C :
    sig
      structure Pointer : C_POINTER
      type opt = Pointer.opt
      type non_opt = Pointer.non_opt
      type 'a p = 'a Pointer.p

      type 'a from_p = int -> 'a

      structure PointerType :
        C_POINTER_TYPE
          where type opt = opt
          where type non_opt = non_opt
          where type 'a p = 'a p
          where type 'a from_p = 'a from_p

      val takePtr : non_opt p -> t from_p
      val giveDupPtr : (non_opt p -> 'a) from_p -> t -> 'a
    end
) :>
  FIELD_TYPE
    where type t = t
    where type p = C.Pointer.ValueType.p
    where type 'a from_p = int -> 'a =
  struct
    type t = t
    type p = C.Pointer.ValueType.p

    structure Memory = C.Pointer.ValueType.Memory

    type 'a from_p = int -> 'a

    fun getPtr pp    = C.Pointer.ValueType.get pp
    fun setPtr pp p  = C.Pointer.ValueType.set (pp, p)

    fun free n pp = C.PointerType.free ~1 n (getPtr pp)
    fun get n pp = C.takePtr (C.PointerType.dup ~1 n (getPtr pp)) n
    fun set withN pp t = C.giveDupPtr (fn n => (withN n; setPtr pp)) t
  end
