structure GtkReliefStyle :> GTK_RELIEF_STYLE =
  struct
    datatype enum =
      NORMAL
    | HALF
    | NONE
    structure Enum =
      Enum(
        type enum = enum
        val null = NORMAL
        val toInt =
          fn
            NORMAL => 0
          | HALF => 1
          | NONE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NORMAL
          | 1 => HALF
          | 2 => NONE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_relief_style_get_type" : unit -> GObjectType.FFI.val_;
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
