(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor ValueFieldType(
  type t
  structure C :
    sig
      type v

      structure ValueType :
        C_VALUE_TYPE
          where type t = t
          where type v = v
    end
) :>
  FIELD_TYPE
    where type t = t
    where type p = C.ValueType.p
    where type 'a from_p = 'a =
  struct
    type t = C.ValueType.t
    type p = C.ValueType.p

    structure Memory = C.ValueType.Memory

    type 'a from_p = 'a

    fun free p = C.ValueType.clear (C.ValueType.get p)
    fun get p = C.ValueType.fromC (C.ValueType.get p)
    fun set () p t =
      if C.ValueType.isRef
      then C.ValueType.updateC t (C.ValueType.get p)
      else C.ValueType.set (p, C.ValueType.toC t)
  end
