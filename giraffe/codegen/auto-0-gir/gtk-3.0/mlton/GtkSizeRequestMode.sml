structure GtkSizeRequestMode :> GTK_SIZE_REQUEST_MODE =
  struct
    datatype enum =
      HEIGHT_FOR_WIDTH
    | WIDTH_FOR_HEIGHT
    | CONSTANT_SIZE
    structure Enum =
      Enum(
        type enum = enum
        val null = HEIGHT_FOR_WIDTH
        val toInt =
          fn
            HEIGHT_FOR_WIDTH => 0
          | WIDTH_FOR_HEIGHT => 1
          | CONSTANT_SIZE => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => HEIGHT_FOR_WIDTH
          | 1 => WIDTH_FOR_HEIGHT
          | 2 => CONSTANT_SIZE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_size_request_mode_get_type" : unit -> GObjectType.FFI.val_;
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
