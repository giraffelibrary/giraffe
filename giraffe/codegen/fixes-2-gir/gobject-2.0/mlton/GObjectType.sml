(* Copyright (C) 2013, 2016 Phil Clayton <phil.clayton@veonix.com>
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


    val isValueType_ = _import "giraffe_g_type_is_value_type" : FFI.val_ -> GBool.FFI.val_;

    val name_ = _import "giraffe_g_type_name" : FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;

    val fromName_ = _import "g_type_from_name" : Utf8.FFI.notnull Utf8.FFI.in_p -> FFI.val_;

    val boolean_ = _import "giraffe_g_boolean_get_type" : unit -> FFI.val_;

    val int_ = _import "giraffe_g_int_get_type" : unit -> FFI.val_;

    val uint_ = _import "giraffe_g_uint_get_type" : unit -> FFI.val_;

    val long_ = _import "giraffe_g_long_get_type" : unit -> FFI.val_;

    val ulong_ = _import "giraffe_g_ulong_get_type" : unit -> FFI.val_;

    val int64_ = _import "giraffe_g_int64_get_type" : unit -> FFI.val_;

    val uint64_ = _import "giraffe_g_uint64_get_type" : unit -> FFI.val_;

    val float_ = _import "giraffe_g_float_get_type" : unit -> FFI.val_;

    val double_ = _import "giraffe_g_double_get_type" : unit -> FFI.val_;

    val char_ = _import "giraffe_g_char_get_type" : unit -> FFI.val_;

    val string_ = _import "giraffe_g_string_get_type" : unit -> FFI.val_;

    val pointer_ = _import "giraffe_g_pointer_get_type" : unit -> FFI.val_;


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

    val boolean = fn () => (I ---> FFI.fromVal) boolean_ ()

    val int = fn () => (I ---> FFI.fromVal) int_ ()

    val uint = fn () => (I ---> FFI.fromVal) uint_ ()

    val long = fn () => (I ---> FFI.fromVal) long_ ()

    val ulong = fn () => (I ---> FFI.fromVal) ulong_ ()

    val int64 = fn () => (I ---> FFI.fromVal) int64_ ()

    val uint64 = fn () => (I ---> FFI.fromVal) uint64_ ()

    val float = fn () => (I ---> FFI.fromVal) float_ ()

    val double = fn () => (I ---> FFI.fromVal) double_ ()

    val char = fn () => (I ---> FFI.fromVal) char_ ()

    val string = fn () => (I ---> FFI.fromVal) string_ ()

    val pointer = fn () => (I ---> FFI.fromVal) pointer_ ()
  end
