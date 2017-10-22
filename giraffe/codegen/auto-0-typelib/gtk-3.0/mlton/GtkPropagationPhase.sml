structure GtkPropagationPhase :> GTK_PROPAGATION_PHASE =
  struct
    datatype enum =
      NONE
    | CAPTURE
    | BUBBLE
    | TARGET
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | CAPTURE => 1
          | BUBBLE => 2
          | TARGET => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => CAPTURE
          | 2 => BUBBLE
          | 3 => TARGET
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_propagation_phase_get_type" : unit -> GObjectType.FFI.val_;
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
