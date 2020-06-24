structure GtkResponseType :> GTK_RESPONSE_TYPE =
  struct
    datatype enum =
      NONE
    | REJECT
    | ACCEPT
    | DELETE_EVENT
    | OK
    | CANCEL
    | CLOSE
    | YES
    | NO
    | APPLY
    | HELP
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => ~1
          | REJECT => ~2
          | ACCEPT => ~3
          | DELETE_EVENT => ~4
          | OK => ~5
          | CANCEL => ~6
          | CLOSE => ~7
          | YES => ~8
          | NO => ~9
          | APPLY => ~10
          | HELP => ~11
        exception Value of GInt32.t
        val fromInt =
          fn
            ~1 => NONE
          | ~2 => REJECT
          | ~3 => ACCEPT
          | ~4 => DELETE_EVENT
          | ~5 => OK
          | ~6 => CANCEL
          | ~7 => CLOSE
          | ~8 => YES
          | ~9 => NO
          | ~10 => APPLY
          | ~11 => HELP
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_response_type_get_type" : unit -> GObjectType.FFI.val_;
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
