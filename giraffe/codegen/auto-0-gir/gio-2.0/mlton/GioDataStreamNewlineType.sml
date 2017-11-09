structure GioDataStreamNewlineType :> GIO_DATA_STREAM_NEWLINE_TYPE =
  struct
    datatype enum =
      LF
    | CR
    | CR_LF
    | ANY
    structure Enum =
      Enum(
        type enum = enum
        val null = LF
        val toInt =
          fn
            LF => 0
          | CR => 1
          | CR_LF => 2
          | ANY => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LF
          | 1 => CR
          | 2 => CR_LF
          | 3 => ANY
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_data_stream_newline_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
