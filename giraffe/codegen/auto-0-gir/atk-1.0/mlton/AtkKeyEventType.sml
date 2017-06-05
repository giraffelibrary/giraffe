structure AtkKeyEventType :> ATK_KEY_EVENT_TYPE =
  struct
    datatype enum =
      PRESS
    | RELEASE
    | LAST_DEFINED
    structure Enum =
      Enum(
        type enum = enum
        val null = PRESS
        val toInt =
          fn
            PRESS => 0
          | RELEASE => 1
          | LAST_DEFINED => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => PRESS
          | 1 => RELEASE
          | 2 => LAST_DEFINED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "atk_key_event_type_get_type" : unit -> GObjectType.FFI.val_;
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
