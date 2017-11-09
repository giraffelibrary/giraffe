structure GdkInputSource :> GDK_INPUT_SOURCE =
  struct
    datatype enum =
      MOUSE
    | PEN
    | ERASER
    | CURSOR
    | KEYBOARD
    structure Enum =
      Enum(
        type enum = enum
        val null = MOUSE
        val toInt =
          fn
            MOUSE => 0
          | PEN => 1
          | ERASER => 2
          | CURSOR => 3
          | KEYBOARD => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => MOUSE
          | 1 => PEN
          | 2 => ERASER
          | 3 => CURSOR
          | 4 => KEYBOARD
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_input_source_get_type" : unit -> GObjectType.FFI.val_;
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
