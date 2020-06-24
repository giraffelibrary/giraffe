structure GtkPackDirection :> GTK_PACK_DIRECTION =
  struct
    datatype enum =
      LTR
    | RTL
    | TTB
    | BTT
    structure Enum =
      Enum(
        type enum = enum
        val null = LTR
        val toInt =
          fn
            LTR => 0
          | RTL => 1
          | TTB => 2
          | BTT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LTR
          | 1 => RTL
          | 2 => TTB
          | 3 => BTT
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_pack_direction_get_type" : unit -> GObjectType.FFI.val_;
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
