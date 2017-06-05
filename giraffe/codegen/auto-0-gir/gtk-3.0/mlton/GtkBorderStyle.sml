structure GtkBorderStyle :> GTK_BORDER_STYLE =
  struct
    datatype enum =
      NONE
    | SOLID
    | INSET
    | OUTSET
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | SOLID => 1
          | INSET => 2
          | OUTSET => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => SOLID
          | 2 => INSET
          | 3 => OUTSET
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_border_style_get_type" : unit -> GObjectType.FFI.val_;
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
