structure GtkResizeMode :> GTK_RESIZE_MODE =
  struct
    datatype enum =
      PARENT
    | QUEUE
    | IMMEDIATE
    structure Enum =
      Enum(
        type enum = enum
        val null = PARENT
        val toInt =
          fn
            PARENT => 0
          | QUEUE => 1
          | IMMEDIATE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PARENT
          | 1 => QUEUE
          | 2 => IMMEDIATE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_resize_mode_get_type" : unit -> GObjectType.FFI.val_;
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
