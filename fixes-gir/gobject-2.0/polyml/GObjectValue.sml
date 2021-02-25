(* Copyright (C) 2012-2013, 2015-2017, 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValue :>
  G_OBJECT_VALUE
    where type t = GObjectValueRecord.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "g_value_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (externalFunctionSymbol "g_value_copy") (GObjectValueRecord.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> cVoid)
      val fitsPointer_ = call (externalFunctionSymbol "g_value_fits_pointer") (GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val init_ = call (externalFunctionSymbol "g_value_init") (GObjectValueRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GObjectValueRecord.PolyML.cPtr)
      val reset_ = call (externalFunctionSymbol "g_value_reset") (GObjectValueRecord.PolyML.cPtr --> GObjectValueRecord.PolyML.cPtr)
      val transform_ = call (externalFunctionSymbol "g_value_transform") (GObjectValueRecord.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val unset_ = call (externalFunctionSymbol "g_value_unset") (GObjectValueRecord.PolyML.cPtr --> cVoid)
      val typeCompatible_ = call (externalFunctionSymbol "g_value_type_compatible") (GObjectType.PolyML.cVal &&> GObjectType.PolyML.cVal --> GBool.PolyML.cVal)
      val typeTransformable_ = call (externalFunctionSymbol "g_value_type_transformable") (GObjectType.PolyML.cVal &&> GObjectType.PolyML.cVal --> GBool.PolyML.cVal)

      val holds_ =
        call
          (externalFunctionSymbol "giraffe_g_value_holds")
          (GObjectValueRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GBool.PolyML.cVal);

      val gtypeOf_ =
        call
          (externalFunctionSymbol "giraffe_g_value_type")
          (GObjectValueRecord.PolyML.cPtr --> GObjectType.PolyML.cVal);

      val isValue_ =
        call
          (externalFunctionSymbol "giraffe_g_is_value")
          (GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal);
    end
    type t = GObjectValueRecord.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () =
      let
        val new & () =
          (GObjectValueRecord.FFI.withNewPtr ---> GObjectValueRecord.FFI.fromPtr true && I)
            ignore
            ()
      in
        new
      end
    fun copy self destValue = (GObjectValueRecord.FFI.withPtr false &&&> GObjectValueRecord.FFI.withPtr false ---> I) copy_ (self & destValue)
    fun fitsPointer self = (GObjectValueRecord.FFI.withPtr false ---> GBool.FFI.fromVal) fitsPointer_ self
    fun init self gType = (GObjectValueRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> I) (ignore o init_) (self & gType)
    fun reset self = (GObjectValueRecord.FFI.withPtr false ---> I) (ignore o reset_) self
    fun transform self destValue = (GObjectValueRecord.FFI.withPtr false &&&> GObjectValueRecord.FFI.withPtr false ---> GBool.FFI.fromVal) transform_ (self & destValue)
    fun unset self = (GObjectValueRecord.FFI.withPtr false ---> I) unset_ self
    fun typeCompatible (srcType, destType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeCompatible_ (srcType & destType)
    fun typeTransformable (srcType, destType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeTransformable_ (srcType & destType)

    fun holds gtype value =
      (GObjectValueRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal)
        holds_
        (value & gtype)

    fun gTypeOf value =
      (GObjectValueRecord.FFI.withPtr false ---> GObjectType.FFI.fromVal) gtypeOf_ value

    fun isValue value =
      (GObjectValueRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isValue_ value
  end
