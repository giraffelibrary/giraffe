structure GtkToolbarStyle :> GTK_TOOLBAR_STYLE =
  struct
    datatype enum =
      ICONS
    | TEXT
    | BOTH
    | BOTH_HORIZ
    structure Enum =
      Enum(
        type enum = enum
        val null = ICONS
        val toInt =
          fn
            ICONS => 0
          | TEXT => 1
          | BOTH => 2
          | BOTH_HORIZ => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ICONS
          | 1 => TEXT
          | 2 => BOTH
          | 3 => BOTH_HORIZ
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_toolbar_style_get_type" : unit -> GObjectType.FFI.val_;
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
