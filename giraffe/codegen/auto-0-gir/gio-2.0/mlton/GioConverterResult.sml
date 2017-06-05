structure GioConverterResult :> GIO_CONVERTER_RESULT =
  struct
    datatype enum =
      ERROR
    | CONVERTED
    | FINISHED
    | FLUSHED
    structure Enum =
      Enum(
        type enum = enum
        val null = ERROR
        val toInt =
          fn
            ERROR => 0
          | CONVERTED => 1
          | FINISHED => 2
          | FLUSHED => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ERROR
          | 1 => CONVERTED
          | 2 => FINISHED
          | 3 => FLUSHED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_converter_result_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
