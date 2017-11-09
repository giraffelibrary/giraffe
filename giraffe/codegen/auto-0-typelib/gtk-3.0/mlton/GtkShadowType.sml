structure GtkShadowType :> GTK_SHADOW_TYPE =
  struct
    datatype enum =
      NONE
    | IN
    | OUT
    | ETCHED_IN
    | ETCHED_OUT
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | IN => 1
          | OUT => 2
          | ETCHED_IN => 3
          | ETCHED_OUT => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => IN
          | 2 => OUT
          | 3 => ETCHED_IN
          | 4 => ETCHED_OUT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_shadow_type_get_type" : unit -> GObjectType.FFI.val_;
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
