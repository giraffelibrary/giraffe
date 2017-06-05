structure GtkMessageType :> GTK_MESSAGE_TYPE =
  struct
    datatype enum =
      INFO
    | WARNING
    | QUESTION
    | ERROR
    | OTHER
    structure Enum =
      Enum(
        type enum = enum
        val null = INFO
        val toInt =
          fn
            INFO => 0
          | WARNING => 1
          | QUESTION => 2
          | ERROR => 3
          | OTHER => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INFO
          | 1 => WARNING
          | 2 => QUESTION
          | 3 => ERROR
          | 4 => OTHER
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_message_type_get_type" : unit -> GObjectType.FFI.val_;
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
