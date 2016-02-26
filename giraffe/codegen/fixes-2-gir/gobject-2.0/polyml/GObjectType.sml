(* Copyright (C) 2013 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectType :>
  sig
    include G_OBJECT_TYPE

    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    local
      open PolyMLFFI
    in
      val isValueType_ =
        call
          (load_sym libgiraffegobject "giraffe_g_type_is_value_type")
          (FFI.Size.PolyML.cVal --> FFI.Bool.PolyML.cVal);

      val name_ =
        call
          (load_sym libgiraffegobject "giraffe_g_type_name")
          (FFI.Size.PolyML.cVal --> Utf8.PolyML.cOutPtr);

      val fromName_ =
        call
          (load_sym libgobject "g_type_from_name")
          (Utf8.PolyML.cInPtr --> FFI.Size.PolyML.cVal);

      val boolean_ =
        call
          (load_sym libgiraffegobject "giraffe_g_boolean_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val int_ =
        call
          (load_sym libgiraffegobject "giraffe_g_int_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val uint_ =
        call
          (load_sym libgiraffegobject "giraffe_g_uint_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val long_ =
        call
          (load_sym libgiraffegobject "giraffe_g_long_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val ulong_ =
        call
          (load_sym libgiraffegobject "giraffe_g_ulong_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val int64_ =
        call
          (load_sym libgiraffegobject "giraffe_g_int64_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val uint64_ =
        call
          (load_sym libgiraffegobject "giraffe_g_uint64_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val float_ =
        call
          (load_sym libgiraffegobject "giraffe_g_float_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val double_ =
        call
          (load_sym libgiraffegobject "giraffe_g_double_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val char_ =
        call
          (load_sym libgiraffegobject "giraffe_g_char_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);

      val string_ =
        call
          (load_sym libgiraffegobject "giraffe_g_string_get_type")
          (FFI.PolyML.cVoid --> FFI.Size.PolyML.cVal);
    end


    open FFI.Size


    val isValueType =
      fn gtype =>
        (C.withVal ---> FFI.Bool.C.fromVal) isValueType_ gtype

    val name =
      fn gtype =>
        (C.withVal ---> Utf8.C.fromPtr false) name_ gtype

    val fromName =
      fn name =>
        (Utf8.C.withPtr ---> (fn 0 => NONE | n => SOME n) o FFI.Size.C.fromVal)
          fromName_
          name

    val boolean = fn () => (I ---> C.fromVal) boolean_ ()

    val int = fn () => (I ---> C.fromVal) int_ ()

    val uint = fn () => (I ---> C.fromVal) uint_ ()

    val long = fn () => (I ---> C.fromVal) long_ ()

    val ulong = fn () => (I ---> C.fromVal) ulong_ ()

    val int64 = fn () => (I ---> C.fromVal) int64_ ()

    val uint64 = fn () => (I ---> C.fromVal) uint64_ ()

    val float = fn () => (I ---> C.fromVal) float_ ()

    val double = fn () => (I ---> C.fromVal) double_ ()

    val char = fn () => (I ---> C.fromVal) char_ ()

    val string = fn () => (I ---> C.fromVal) string_ ()
  end
