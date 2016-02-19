(* Copyright (C) 2013 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectType :>
  sig
    include G_OBJECT_TYPE
  end =
  struct
    val isValueType_ = _import "giraffe_g_type_is_value_type" : FFI.Size.C.val_ -> FFI.Bool.C.val_;

    val name_ = _import "giraffe_g_type_name" : FFI.Size.C.val_ -> Utf8.C.notnull Utf8.C.out_p;

    val fromName_ = _import "g_type_from_name" : Utf8.C.notnull Utf8.C.in_p -> FFI.Size.C.val_;

    val boolean_ = _import "giraffe_g_boolean_get_type" : unit -> FFI.Size.C.val_;

    val int_ = _import "giraffe_g_int_get_type" : unit -> FFI.Size.C.val_;

    val uint_ = _import "giraffe_g_uint_get_type" : unit -> FFI.Size.C.val_;

    val long_ = _import "giraffe_g_long_get_type" : unit -> FFI.Size.C.val_;

    val ulong_ = _import "giraffe_g_ulong_get_type" : unit -> FFI.Size.C.val_;

    val int64_ = _import "giraffe_g_int64_get_type" : unit -> FFI.Size.C.val_;

    val uint64_ = _import "giraffe_g_uint64_get_type" : unit -> FFI.Size.C.val_;

    val float_ = _import "giraffe_g_float_get_type" : unit -> FFI.Size.C.val_;

    val double_ = _import "giraffe_g_double_get_type" : unit -> FFI.Size.C.val_;

    val char_ = _import "giraffe_g_char_get_type" : unit -> FFI.Size.C.val_;

    val string_ = _import "giraffe_g_string_get_type" : unit -> FFI.Size.C.val_;


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
