structure GtkBorderStyle :> GTK_BORDER_STYLE =
  struct
    datatype enum =
      NONE
    | SOLID
    | INSET
    | OUTSET
    | HIDDEN
    | DOTTED
    | DASHED
    | DOUBLE
    | GROOVE
    | RIDGE
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
          | HIDDEN => 4
          | DOTTED => 5
          | DASHED => 6
          | DOUBLE => 7
          | GROOVE => 8
          | RIDGE => 9
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => SOLID
          | 2 => INSET
          | 3 => OUTSET
          | 4 => HIDDEN
          | 5 => DOTTED
          | 6 => DASHED
          | 7 => DOUBLE
          | 8 => GROOVE
          | 9 => RIDGE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_border_style_get_type" : unit -> GObjectType.FFI.val_;
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
