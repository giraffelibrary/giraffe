structure GObjectType :>
  sig
    include G_OBJECT_TYPE
  end =
  struct
    type val_ = SysWord.word


    val isValueType_ = _import "giraffe_g_type_is_value_type" : val_ -> FFI.Bool.val_;

    val name_ = _import "giraffe_g_type_name" : val_ -> FFI.String.notnull FFI.String.out_p;

    val fromName_ = _import "g_type_from_name" : FFI.String.notnull FFI.String.in_p -> val_;

    val boolean_ = _import "giraffe_g_boolean_get_type" : unit -> val_;

    val int_ = _import "giraffe_g_int_get_type" : unit -> val_;

    val uint_ = _import "giraffe_g_uint_get_type" : unit -> val_;

    val long_ = _import "giraffe_g_long_get_type" : unit -> val_;

    val ulong_ = _import "giraffe_g_ulong_get_type" : unit -> val_;

    val int64_ = _import "giraffe_g_int64_get_type" : unit -> val_;

    val uint64_ = _import "giraffe_g_uint64_get_type" : unit -> val_;

    val float_ = _import "giraffe_g_float_get_type" : unit -> val_;

    val double_ = _import "giraffe_g_double_get_type" : unit -> val_;

    val char_ = _import "giraffe_g_char_get_type" : unit -> val_;

    val string_ = _import "giraffe_g_string_get_type" : unit -> val_;



    type t = SysWord.word

    structure C =
      struct
        type val_ = val_
        val withVal = FFI.withVal
        fun fromVal w = w
      end


    val isValueType = isValueType_

    val name =
      fn gtype =>
        (C.withVal ---> FFI.String.fromPtr false) name_ gtype

    val fromName =
      fn name =>
        (FFI.String.withConstPtr ---> (fn 0w0 => NONE | n => SOME n))
          fromName_
          name


    val boolean = boolean_

    val int = int_

    val uint = uint_

    val long = long_

    val ulong = ulong_

    val int64 = int64_

    val uint64 = uint64_

    val float = float_

    val double = double_

    val char = char_

    val string = string_
  end
