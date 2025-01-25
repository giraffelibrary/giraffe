(* Copyright (C) 2012-2013, 2015-2017, 2020-2021, 2025 Phil Clayton <phil.clayton@veonix.com>
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
    val getType_ = _import "g_value_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = fn x1 & x2 => (_import "g_value_copy" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val fitsPointer_ = _import "g_value_fits_pointer" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GBool.FFI.val_;
    val init_ = fn x1 & x2 => (_import "g_value_init" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * GObjectType.FFI.val_ -> GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p;) (x1, x2)
    val reset_ = _import "g_value_reset" reentrant : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p;
    val transform_ = fn x1 & x2 => (_import "g_value_transform" reentrant : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val unset_ = _import "g_value_unset" reentrant : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> unit;
    val typeCompatible_ = fn x1 & x2 => (_import "g_value_type_compatible" : GObjectType.FFI.val_ * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val typeTransformable_ = fn x1 & x2 => (_import "g_value_type_transformable" : GObjectType.FFI.val_ * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)

    val holds_ =
      fn x1 & x2 =>
        (_import "giraffe_g_value_holds" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * GObjectType.FFI.val_ -> GBool.FFI.val_;)
        (x1, x2)

    val gtypeOf_ =
      _import "giraffe_g_value_type" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GObjectType.FFI.val_;

    val isValue_ =
      _import "giraffe_g_is_value" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GBool.FFI.val_;

    type t = GObjectValueRecord.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call = GObjectValueRecord.FFI.withNewPtr ---> GObjectValueRecord.FFI.fromPtr true && I
    in
      fun new () =
        let
          val new & () = call ignore ()
        in
          new
        end
    end
    local
      val call = GObjectValueRecord.FFI.withPtr false &&&> GObjectValueRecord.FFI.withPtr false ---> I
    in
      fun copy self destValue = call copy_ (self & destValue)
    end
    local
      val call = GObjectValueRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun fitsPointer self = call fitsPointer_ self
    end
    local
      val call = GObjectValueRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> I
    in
      fun init self gType = call (ignore o init_) (self & gType)
    end
    local
      val call = GObjectValueRecord.FFI.withPtr false ---> I
    in
      fun reset self = call (ignore o reset_) self
    end
    local
      val call = GObjectValueRecord.FFI.withPtr false &&&> GObjectValueRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun transform self destValue = call transform_ (self & destValue)
    end
    local
      val call = GObjectValueRecord.FFI.withPtr false ---> I
    in
      fun unset self = call unset_ self
    end
    local
      val call = GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeCompatible (srcType, destType) = call typeCompatible_ (srcType & destType)
    end
    local
      val call = GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeTransformable (srcType, destType) = call typeTransformable_ (srcType & destType)
    end

    local
      val call = GObjectValueRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
    fun holds gtype value = call holds_ (value & gtype)
    end

    local
      val call = GObjectValueRecord.FFI.withPtr false ---> GObjectType.FFI.fromVal
    in
      fun gTypeOf value = call gtypeOf_ value
    end

    local
      val call = GObjectValueRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isValue value = call isValue_ value
    end
  end
