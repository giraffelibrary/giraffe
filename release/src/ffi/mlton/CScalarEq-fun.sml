(* Copyright (C) 2016-2017, 2019-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CScalarEq(
  structure CValueType : C_VALUE_EQ_TYPE
  val null : CValueType.t
) :>
  C_SCALAR_EQ
    where type C.ValueType.t = CValueType.t
    where type C.ValueType.v = CValueType.v
    where type C.ValueType.p = CValueType.p =
  struct
    type t = CValueType.t
    val null = null

    structure CRefValue = CRef(CValueType)

    structure C =
      struct
        open CRefValue
        structure ValueType = CValueType
      end

    structure FFI =
      struct
        open CRefValue
        type val_ = v
        type ref_ = r
        fun withVal f = f o CValueType.toC
        fun withRefVal f = withVal (withRef f)
        val fromVal = CValueType.fromC
      end
  end
