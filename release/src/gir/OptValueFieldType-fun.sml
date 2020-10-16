(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor OptValueFieldType(
  type t
  structure C :
    sig
      type v

      structure ValueType :
        C_VALUE_NULL_TYPE
          where type t = t
          where type v = v
    end
) :>
  FIELD_TYPE
    where type t = t option
    where type p = C.ValueType.p
    where type 'a from_p = 'a =
  struct
    type t = t option
    type p = C.ValueType.p

    structure Memory = C.ValueType.Memory

    type 'a from_p = 'a

    fun toOpt v =
      if not (C.ValueType.isNull v)
      then SOME v
      else NONE

    fun free p = Option.app C.ValueType.clear (toOpt (C.ValueType.get p))
    fun get p = Option.map C.ValueType.fromC (toOpt (C.ValueType.get p))
    fun set () p t =
      case t of
        SOME t =>
          if C.ValueType.isRef
          then C.ValueType.updateC t (C.ValueType.get p)
          else C.ValueType.set (p, C.ValueType.toC t)
      | NONE   => 
          C.ValueType.set (p, C.ValueType.null ())
  end
