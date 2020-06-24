structure GtkEventSequenceState :> GTK_EVENT_SEQUENCE_STATE =
  struct
    datatype enum =
      NONE
    | CLAIMED
    | DENIED
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | CLAIMED => 1
          | DENIED => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => CLAIMED
          | 2 => DENIED
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_event_sequence_state_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
