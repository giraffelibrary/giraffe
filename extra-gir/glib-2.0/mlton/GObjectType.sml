(* Copyright (C) 2013, 2016-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectType :> G_OBJECT_TYPE =
  struct
    open GULong


    val isValueType_ = _import "giraffe_g_type_is_value_type" : FFI.val_ -> GBool.FFI.val_;

    val isA_ = fn x1 & x2 => (_import "g_type_is_a" : FFI.val_ * FFI.val_ -> GBool.FFI.val_;) (x1, x2)

    val name_ = _import "giraffe_g_type_name" : FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;

    val fromName_ = _import "g_type_from_name" : Utf8.FFI.non_opt Utf8.FFI.in_p -> FFI.val_;

    val invalid_ = _import "giraffe_g_invalid_get_type" : unit -> FFI.val_;

    val none_ = _import "giraffe_g_none_get_type" : unit -> FFI.val_;

    val interface_ = _import "giraffe_g_interface_get_type" : unit -> FFI.val_;

    val char_ = _import "giraffe_g_char_get_type" : unit -> FFI.val_;

    val uchar_ = _import "giraffe_g_uchar_get_type" : unit -> FFI.val_;

    val boolean_ = _import "giraffe_g_boolean_get_type" : unit -> FFI.val_;

    val int_ = _import "giraffe_g_int_get_type" : unit -> FFI.val_;

    val uint_ = _import "giraffe_g_uint_get_type" : unit -> FFI.val_;

    val long_ = _import "giraffe_g_long_get_type" : unit -> FFI.val_;

    val ulong_ = _import "giraffe_g_ulong_get_type" : unit -> FFI.val_;

    val int64_ = _import "giraffe_g_int64_get_type" : unit -> FFI.val_;

    val uint64_ = _import "giraffe_g_uint64_get_type" : unit -> FFI.val_;

    val enum_ = _import "giraffe_g_enum_get_type" : unit -> FFI.val_;

    val flags_ = _import "giraffe_g_flags_get_type" : unit -> FFI.val_;

    val float_ = _import "giraffe_g_float_get_type" : unit -> FFI.val_;

    val double_ = _import "giraffe_g_double_get_type" : unit -> FFI.val_;

    val string_ = _import "giraffe_g_string_get_type" : unit -> FFI.val_;

    val pointer_ = _import "giraffe_g_pointer_get_type" : unit -> FFI.val_;

    val boxed_ = _import "giraffe_g_boxed_get_type" : unit -> FFI.val_;

    val param_ = _import "giraffe_g_param_get_type" : unit -> FFI.val_;

    val object_ = _import "giraffe_g_object_get_type" : unit -> FFI.val_;

    val gtype_ = _import "g_gtype_get_type" : unit -> FFI.val_;

    val variant_ = _import "giraffe_g_variant_get_type" : unit -> FFI.val_;

    val paramChar_ = _import "giraffe_g_param_char_get_type" : unit -> FFI.val_;

    val paramUChar_ = _import "giraffe_g_param_uchar_get_type" : unit -> FFI.val_;

    val paramBoolean_ = _import "giraffe_g_param_boolean_get_type" : unit -> FFI.val_;

    val paramInt_ = _import "giraffe_g_param_int_get_type" : unit -> FFI.val_;

    val paramUInt_ = _import "giraffe_g_param_uint_get_type" : unit -> FFI.val_;

    val paramLong_ = _import "giraffe_g_param_long_get_type" : unit -> FFI.val_;

    val paramULong_ = _import "giraffe_g_param_ulong_get_type" : unit -> FFI.val_;

    val paramInt64_ = _import "giraffe_g_param_int64_get_type" : unit -> FFI.val_;

    val paramUInt64_ = _import "giraffe_g_param_uint64_get_type" : unit -> FFI.val_;

    val paramUnichar_ = _import "giraffe_g_param_unichar_get_type" : unit -> FFI.val_;

    val paramEnum_ = _import "giraffe_g_param_enum_get_type" : unit -> FFI.val_;

    val paramFlags_ = _import "giraffe_g_param_flags_get_type" : unit -> FFI.val_;

    val paramFloat_ = _import "giraffe_g_param_float_get_type" : unit -> FFI.val_;

    val paramDouble_ = _import "giraffe_g_param_double_get_type" : unit -> FFI.val_;

    val paramString_ = _import "giraffe_g_param_string_get_type" : unit -> FFI.val_;

    val paramParam_ = _import "giraffe_g_param_param_get_type" : unit -> FFI.val_;

    val paramBoxed_ = _import "giraffe_g_param_boxed_get_type" : unit -> FFI.val_;

    val paramPointer_ = _import "giraffe_g_param_pointer_get_type" : unit -> FFI.val_;

    val paramValueArray_ = _import "giraffe_g_param_value_array_get_type" : unit -> FFI.val_;

    val paramObject_ = _import "giraffe_g_param_object_get_type" : unit -> FFI.val_;

    val paramOverride_ = _import "giraffe_g_param_override_get_type" : unit -> FFI.val_;

    val paramGType_ = _import "giraffe_g_param_gtype_get_type" : unit -> FFI.val_;

    val paramVariant_ = _import "giraffe_g_param_variant_get_type" : unit -> FFI.val_;


    local
      val call = FFI.withVal ---> GBool.FFI.fromVal
    in
      fun isValueType gtype = call isValueType_ gtype
    end

    local
      val call = FFI.withVal &&&> FFI.withVal ---> GBool.FFI.fromVal
    in
      fun isA (type', isAType) = call isA_ (type' & isAType)
    end

    local
      val call = FFI.withVal ---> Utf8.FFI.fromPtr 0
    in
      fun name gtype = call name_ gtype
    end

    local
      val call = Utf8.FFI.withPtr 0 ---> (fn 0 => NONE | n => SOME n) o FFI.fromVal
    in
      fun fromName name = call fromName_ name
    end

    val invalid = (I ---> FFI.fromVal) invalid_

    val none = (I ---> FFI.fromVal) none_

    val interface = (I ---> FFI.fromVal) interface_

    val char = (I ---> FFI.fromVal) char_

    val uchar = (I ---> FFI.fromVal) uchar_

    val boolean = (I ---> FFI.fromVal) boolean_

    val int = (I ---> FFI.fromVal) int_

    val uint = (I ---> FFI.fromVal) uint_

    val long = (I ---> FFI.fromVal) long_

    val ulong = (I ---> FFI.fromVal) ulong_

    val int64 = (I ---> FFI.fromVal) int64_

    val uint64 = (I ---> FFI.fromVal) uint64_

    val enum = (I ---> FFI.fromVal) enum_

    val flags = (I ---> FFI.fromVal) flags_

    val float = (I ---> FFI.fromVal) float_

    val double = (I ---> FFI.fromVal) double_

    val string = (I ---> FFI.fromVal) string_

    val pointer = (I ---> FFI.fromVal) pointer_

    val boxed = (I ---> FFI.fromVal) boxed_

    val param = (I ---> FFI.fromVal) param_

    val object = (I ---> FFI.fromVal) object_

    val gtype = (I ---> FFI.fromVal) gtype_

    val variant = (I ---> FFI.fromVal) variant_

    val paramChar = (I ---> FFI.fromVal) paramChar_

    val paramUChar = (I ---> FFI.fromVal) paramUChar_

    val paramBoolean = (I ---> FFI.fromVal) paramBoolean_

    val paramInt = (I ---> FFI.fromVal) paramInt_

    val paramUInt = (I ---> FFI.fromVal) paramUInt_

    val paramLong = (I ---> FFI.fromVal) paramLong_

    val paramULong = (I ---> FFI.fromVal) paramULong_

    val paramInt64 = (I ---> FFI.fromVal) paramInt64_

    val paramUInt64 = (I ---> FFI.fromVal) paramUInt64_

    val paramUnichar = (I ---> FFI.fromVal) paramUnichar_

    val paramEnum = (I ---> FFI.fromVal) paramEnum_

    val paramFlags = (I ---> FFI.fromVal) paramFlags_

    val paramFloat = (I ---> FFI.fromVal) paramFloat_

    val paramDouble = (I ---> FFI.fromVal) paramDouble_

    val paramString = (I ---> FFI.fromVal) paramString_

    val paramParam = (I ---> FFI.fromVal) paramParam_

    val paramBoxed = (I ---> FFI.fromVal) paramBoxed_

    val paramPointer = (I ---> FFI.fromVal) paramPointer_

    val paramValueArray = (I ---> FFI.fromVal) paramValueArray_

    val paramObject = (I ---> FFI.fromVal) paramObject_

    val paramOverride = (I ---> FFI.fromVal) paramOverride_

    val paramGType = (I ---> FFI.fromVal) paramGType_

    val paramVariant = (I ---> FFI.fromVal) paramVariant_
  end
