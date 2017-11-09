(* Copyright (C) 2012-2013, 2015-2017 Phil Clayton <phil.clayton@veonix.com>
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
      val init_ =
        call
          (getSymbol "g_value_init")
          (GObjectValueRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GObjectValueRecord.PolyML.cPtr);

      val reset_ =
        call
          (getSymbol "g_value_reset")
          (GObjectValueRecord.PolyML.cPtr --> GObjectValueRecord.PolyML.cPtr);

      val getType_ =
        call
          (getSymbol "g_value_get_type")
          (cVoid --> GObjectType.PolyML.cVal);

      val holds_ =
        call
          (getSymbol "giraffe_g_value_holds")
          (GObjectValueRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GBool.PolyML.cVal);

      val gtypeOf_ =
        call
          (getSymbol "giraffe_g_value_type")
          (GObjectValueRecord.PolyML.cPtr --> GObjectType.PolyML.cVal);

      val isValue_ =
        call
          (getSymbol "giraffe_g_is_value")
          (GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal);
    end

    type t = GObjectValueRecord.t
    type type_t = GObjectType.t

    fun init gtype =
      let
        val value & () =
          (GObjectValueRecord.FFI.withNewPtr
            &&&> GObjectType.FFI.withVal
            ---> GObjectValueRecord.FFI.fromPtr true && I)
            (ignore o init_)
            (() & gtype)
      in
        value
      end

    fun reset value =
      (GObjectValueRecord.FFI.withPtr ---> I) (ignore o reset_) value

    fun getType () = (I ---> GObjectType.FFI.fromVal) getType_ ()

    fun holds gtype value =
      (GObjectValueRecord.FFI.withPtr &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal)
        holds_
        (value & gtype)

    fun gTypeOf value =
      (GObjectValueRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) gtypeOf_ value

    fun isValue value =
      (GObjectValueRecord.FFI.withPtr ---> GBool.FFI.fromVal) isValue_ value
  end
