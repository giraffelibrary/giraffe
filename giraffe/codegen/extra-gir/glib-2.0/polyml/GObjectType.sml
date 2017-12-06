(* Copyright (C) 2013, 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectType :> G_OBJECT_TYPE =
  struct
    structure C =
      struct
        structure ValueType = GSizeType
      end

    open GSize


    local
      open PolyMLFFI
    in
      val isValueType_ =
        call
          (getSymbol "giraffe_g_type_is_value_type")
          (PolyML.cVal --> GBool.PolyML.cVal);

      val name_ =
        call
          (getSymbol "giraffe_g_type_name")
          (PolyML.cVal --> Utf8.PolyML.cOutPtr);

      val fromName_ =
        call
          (getSymbol "g_type_from_name")
          (Utf8.PolyML.cInPtr --> PolyML.cVal);

      val invalid_ =
        call
          (getSymbol "giraffe_g_invalid_get_type")
          (cVoid --> PolyML.cVal);

      val none_ =
        call
          (getSymbol "giraffe_g_none_get_type")
          (cVoid --> PolyML.cVal);

      val interface_ =
        call
          (getSymbol "giraffe_g_interface_get_type")
          (cVoid --> PolyML.cVal);

      val char_ =
        call
          (getSymbol "giraffe_g_char_get_type")
          (cVoid --> PolyML.cVal);

      val uchar_ =
        call
          (getSymbol "giraffe_g_uchar_get_type")
          (cVoid --> PolyML.cVal);

      val boolean_ =
        call
          (getSymbol "giraffe_g_boolean_get_type")
          (cVoid --> PolyML.cVal);

      val int_ =
        call
          (getSymbol "giraffe_g_int_get_type")
          (cVoid --> PolyML.cVal);

      val uint_ =
        call
          (getSymbol "giraffe_g_uint_get_type")
          (cVoid --> PolyML.cVal);

      val long_ =
        call
          (getSymbol "giraffe_g_long_get_type")
          (cVoid --> PolyML.cVal);

      val ulong_ =
        call
          (getSymbol "giraffe_g_ulong_get_type")
          (cVoid --> PolyML.cVal);

      val int64_ =
        call
          (getSymbol "giraffe_g_int64_get_type")
          (cVoid --> PolyML.cVal);

      val uint64_ =
        call
          (getSymbol "giraffe_g_uint64_get_type")
          (cVoid --> PolyML.cVal);

      val enum_ =
        call
          (getSymbol "giraffe_g_enum_get_type")
          (cVoid --> PolyML.cVal);

      val flags_ =
        call
          (getSymbol "giraffe_g_flags_get_type")
          (cVoid --> PolyML.cVal);

      val float_ =
        call
          (getSymbol "giraffe_g_float_get_type")
          (cVoid --> PolyML.cVal);

      val double_ =
        call
          (getSymbol "giraffe_g_double_get_type")
          (cVoid --> PolyML.cVal);

      val string_ =
        call
          (getSymbol "giraffe_g_string_get_type")
          (cVoid --> PolyML.cVal);

      val pointer_ =
        call
          (getSymbol "giraffe_g_pointer_get_type")
          (cVoid --> PolyML.cVal);

      val boxed_ =
        call
          (getSymbol "giraffe_g_boxed_get_type")
          (cVoid --> PolyML.cVal);

      val param_ =
        call
          (getSymbol "giraffe_g_param_get_type")
          (cVoid --> PolyML.cVal);

      val object_ =
        call
          (getSymbol "giraffe_g_object_get_type")
          (cVoid --> PolyML.cVal);

      val gtype_ =
        call
          (getSymbol "g_gtype_get_type")
          (cVoid --> PolyML.cVal);

      val variant_ =
        call
          (getSymbol "giraffe_g_variant_get_type")
          (cVoid --> PolyML.cVal);
    end


    val isValueType =
      fn gtype =>
        (FFI.withVal ---> GBool.FFI.fromVal) isValueType_ gtype

    val name =
      fn gtype =>
        (FFI.withVal ---> Utf8.FFI.fromPtr 0) name_ gtype

    val fromName =
      fn name =>
        (Utf8.FFI.withPtr ---> (fn 0 => NONE | n => SOME n) o FFI.fromVal)
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
  end
