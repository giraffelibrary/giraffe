(* Copyright (C) 2013, 2016-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectType :> G_OBJECT_TYPE =
  struct
    open GULong


    local
      open PolyMLFFI
    in
      val isValueType_ =
        call
          (externalFunctionSymbol "giraffe_g_type_is_value_type")
          (PolyML.cVal --> GBool.PolyML.cVal);

      val isA_ =
        call
          (externalFunctionSymbol "g_type_is_a")
          (PolyML.cVal &&> PolyML.cVal --> GBool.PolyML.cVal);

      val name_ =
        call
          (externalFunctionSymbol "giraffe_g_type_name")
          (PolyML.cVal --> Utf8.PolyML.cOutPtr);

      val fromName_ =
        call
          (externalFunctionSymbol "g_type_from_name")
          (Utf8.PolyML.cInPtr --> PolyML.cVal);

      val invalid_ =
        call
          (externalFunctionSymbol "giraffe_g_invalid_get_type")
          (cVoid --> PolyML.cVal);

      val none_ =
        call
          (externalFunctionSymbol "giraffe_g_none_get_type")
          (cVoid --> PolyML.cVal);

      val interface_ =
        call
          (externalFunctionSymbol "giraffe_g_interface_get_type")
          (cVoid --> PolyML.cVal);

      val char_ =
        call
          (externalFunctionSymbol "giraffe_g_char_get_type")
          (cVoid --> PolyML.cVal);

      val uchar_ =
        call
          (externalFunctionSymbol "giraffe_g_uchar_get_type")
          (cVoid --> PolyML.cVal);

      val boolean_ =
        call
          (externalFunctionSymbol "giraffe_g_boolean_get_type")
          (cVoid --> PolyML.cVal);

      val int_ =
        call
          (externalFunctionSymbol "giraffe_g_int_get_type")
          (cVoid --> PolyML.cVal);

      val uint_ =
        call
          (externalFunctionSymbol "giraffe_g_uint_get_type")
          (cVoid --> PolyML.cVal);

      val long_ =
        call
          (externalFunctionSymbol "giraffe_g_long_get_type")
          (cVoid --> PolyML.cVal);

      val ulong_ =
        call
          (externalFunctionSymbol "giraffe_g_ulong_get_type")
          (cVoid --> PolyML.cVal);

      val int64_ =
        call
          (externalFunctionSymbol "giraffe_g_int64_get_type")
          (cVoid --> PolyML.cVal);

      val uint64_ =
        call
          (externalFunctionSymbol "giraffe_g_uint64_get_type")
          (cVoid --> PolyML.cVal);

      val enum_ =
        call
          (externalFunctionSymbol "giraffe_g_enum_get_type")
          (cVoid --> PolyML.cVal);

      val flags_ =
        call
          (externalFunctionSymbol "giraffe_g_flags_get_type")
          (cVoid --> PolyML.cVal);

      val float_ =
        call
          (externalFunctionSymbol "giraffe_g_float_get_type")
          (cVoid --> PolyML.cVal);

      val double_ =
        call
          (externalFunctionSymbol "giraffe_g_double_get_type")
          (cVoid --> PolyML.cVal);

      val string_ =
        call
          (externalFunctionSymbol "giraffe_g_string_get_type")
          (cVoid --> PolyML.cVal);

      val pointer_ =
        call
          (externalFunctionSymbol "giraffe_g_pointer_get_type")
          (cVoid --> PolyML.cVal);

      val boxed_ =
        call
          (externalFunctionSymbol "giraffe_g_boxed_get_type")
          (cVoid --> PolyML.cVal);

      val param_ =
        call
          (externalFunctionSymbol "giraffe_g_param_get_type")
          (cVoid --> PolyML.cVal);

      val object_ =
        call
          (externalFunctionSymbol "giraffe_g_object_get_type")
          (cVoid --> PolyML.cVal);

      val gtype_ =
        call
          (externalFunctionSymbol "g_gtype_get_type")
          (cVoid --> PolyML.cVal);

      val variant_ =
        call
          (externalFunctionSymbol "giraffe_g_variant_get_type")
          (cVoid --> PolyML.cVal);

      val paramChar_ =
        call
          (externalFunctionSymbol "giraffe_g_param_char_get_type")
          (cVoid --> PolyML.cVal);

      val paramUChar_ =
        call
          (externalFunctionSymbol "giraffe_g_param_uchar_get_type")
          (cVoid --> PolyML.cVal);

      val paramBoolean_ =
        call
          (externalFunctionSymbol "giraffe_g_param_boolean_get_type")
          (cVoid --> PolyML.cVal);

      val paramInt_ =
        call
          (externalFunctionSymbol "giraffe_g_param_int_get_type")
          (cVoid --> PolyML.cVal);

      val paramUInt_ =
        call
          (externalFunctionSymbol "giraffe_g_param_uint_get_type")
          (cVoid --> PolyML.cVal);

      val paramLong_ =
        call
          (externalFunctionSymbol "giraffe_g_param_long_get_type")
          (cVoid --> PolyML.cVal);

      val paramULong_ =
        call
          (externalFunctionSymbol "giraffe_g_param_ulong_get_type")
          (cVoid --> PolyML.cVal);

      val paramInt64_ =
        call
          (externalFunctionSymbol "giraffe_g_param_int64_get_type")
          (cVoid --> PolyML.cVal);

      val paramUInt64_ =
        call
          (externalFunctionSymbol "giraffe_g_param_uint64_get_type")
          (cVoid --> PolyML.cVal);

      val paramUnichar_ =
        call
          (externalFunctionSymbol "giraffe_g_param_unichar_get_type")
          (cVoid --> PolyML.cVal);

      val paramEnum_ =
        call
          (externalFunctionSymbol "giraffe_g_param_enum_get_type")
          (cVoid --> PolyML.cVal);

      val paramFlags_ =
        call
          (externalFunctionSymbol "giraffe_g_param_flags_get_type")
          (cVoid --> PolyML.cVal);

      val paramFloat_ =
        call
          (externalFunctionSymbol "giraffe_g_param_float_get_type")
          (cVoid --> PolyML.cVal);

      val paramDouble_ =
        call
          (externalFunctionSymbol "giraffe_g_param_double_get_type")
          (cVoid --> PolyML.cVal);

      val paramString_ =
        call
          (externalFunctionSymbol "giraffe_g_param_string_get_type")
          (cVoid --> PolyML.cVal);

      val paramParam_ =
        call
          (externalFunctionSymbol "giraffe_g_param_param_get_type")
          (cVoid --> PolyML.cVal);

      val paramBoxed_ =
        call
          (externalFunctionSymbol "giraffe_g_param_boxed_get_type")
          (cVoid --> PolyML.cVal);

      val paramPointer_ =
        call
          (externalFunctionSymbol "giraffe_g_param_pointer_get_type")
          (cVoid --> PolyML.cVal);

      val paramValueArray_ =
        call
          (externalFunctionSymbol "giraffe_g_param_value_array_get_type")
          (cVoid --> PolyML.cVal);

      val paramObject_ =
        call
          (externalFunctionSymbol "giraffe_g_param_object_get_type")
          (cVoid --> PolyML.cVal);

      val paramOverride_ =
        call
          (externalFunctionSymbol "giraffe_g_param_override_get_type")
          (cVoid --> PolyML.cVal);

      val paramGType_ =
        call
          (externalFunctionSymbol "giraffe_g_param_gtype_get_type")
          (cVoid --> PolyML.cVal);

      val paramVariant_ =
        call
          (externalFunctionSymbol "giraffe_g_param_variant_get_type")
          (cVoid --> PolyML.cVal);
    end


    val isValueType =
      fn gtype =>
        (FFI.withVal ---> GBool.FFI.fromVal) isValueType_ gtype

    val isA =
      fn (type', isAType) =>
        (FFI.withVal &&&> FFI.withVal ---> GBool.FFI.fromVal) isA_ (type' & isAType)

    val name =
      fn gtype =>
        (FFI.withVal ---> Utf8.FFI.fromPtr 0) name_ gtype

    val fromName =
      fn name =>
        (Utf8.FFI.withPtr 0 ---> (fn 0 => NONE | n => SOME n) o FFI.fromVal)
          fromName_
          name

    val invalid = fn () => (I ---> FFI.fromVal) invalid_ ()

    val none = fn () => (I ---> FFI.fromVal) none_ ()

    val interface = fn () => (I ---> FFI.fromVal) interface_ ()

    val char = fn () => (I ---> FFI.fromVal) char_ ()

    val uchar = fn () => (I ---> FFI.fromVal) uchar_ ()

    val boolean = fn () => (I ---> FFI.fromVal) boolean_ ()

    val int = fn () => (I ---> FFI.fromVal) int_ ()

    val uint = fn () => (I ---> FFI.fromVal) uint_ ()

    val long = fn () => (I ---> FFI.fromVal) long_ ()

    val ulong = fn () => (I ---> FFI.fromVal) ulong_ ()

    val int64 = fn () => (I ---> FFI.fromVal) int64_ ()

    val uint64 = fn () => (I ---> FFI.fromVal) uint64_ ()

    val enum = fn () => (I ---> FFI.fromVal) enum_ ()

    val flags = fn () => (I ---> FFI.fromVal) flags_ ()

    val float = fn () => (I ---> FFI.fromVal) float_ ()

    val double = fn () => (I ---> FFI.fromVal) double_ ()

    val string = fn () => (I ---> FFI.fromVal) string_ ()

    val pointer = fn () => (I ---> FFI.fromVal) pointer_ ()

    val boxed = fn () => (I ---> FFI.fromVal) boxed_ ()

    val param = fn () => (I ---> FFI.fromVal) param_ ()

    val object = fn () => (I ---> FFI.fromVal) object_ ()

    val gtype = fn () => (I ---> FFI.fromVal) gtype_ ()

    val variant = fn () => (I ---> FFI.fromVal) variant_ ()

    val paramChar = fn () => (I ---> FFI.fromVal) paramChar_ ()

    val paramUChar = fn () => (I ---> FFI.fromVal) paramUChar_ ()

    val paramBoolean = fn () => (I ---> FFI.fromVal) paramBoolean_ ()

    val paramInt = fn () => (I ---> FFI.fromVal) paramInt_ ()

    val paramUInt = fn () => (I ---> FFI.fromVal) paramUInt_ ()

    val paramLong = fn () => (I ---> FFI.fromVal) paramLong_ ()

    val paramULong = fn () => (I ---> FFI.fromVal) paramULong_ ()

    val paramInt64 = fn () => (I ---> FFI.fromVal) paramInt64_ ()

    val paramUInt64 = fn () => (I ---> FFI.fromVal) paramUInt64_ ()

    val paramUnichar = fn () => (I ---> FFI.fromVal) paramUnichar_ ()

    val paramEnum = fn () => (I ---> FFI.fromVal) paramEnum_ ()

    val paramFlags = fn () => (I ---> FFI.fromVal) paramFlags_ ()

    val paramFloat = fn () => (I ---> FFI.fromVal) paramFloat_ ()

    val paramDouble = fn () => (I ---> FFI.fromVal) paramDouble_ ()

    val paramString = fn () => (I ---> FFI.fromVal) paramString_ ()

    val paramParam = fn () => (I ---> FFI.fromVal) paramParam_ ()

    val paramBoxed = fn () => (I ---> FFI.fromVal) paramBoxed_ ()

    val paramPointer = fn () => (I ---> FFI.fromVal) paramPointer_ ()

    val paramValueArray = fn () => (I ---> FFI.fromVal) paramValueArray_ ()

    val paramObject = fn () => (I ---> FFI.fromVal) paramObject_ ()

    val paramOverride = fn () => (I ---> FFI.fromVal) paramOverride_ ()

    val paramGType = fn () => (I ---> FFI.fromVal) paramGType_ ()

    val paramVariant = fn () => (I ---> FFI.fromVal) paramVariant_ ()
  end
