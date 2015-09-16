structure GdkWindowTypeHint :>
  sig
    include GDK_WINDOW_TYPE_HINT
  end =
  struct
    datatype t =
      NORMAL
    | DIALOG
    | MENU
    | TOOLBAR
    | SPLASHSCREEN
    | UTILITY
    | DOCK
    | DESKTOP
    | DROPDOWN_MENU
    | POPUP_MENU
    | TOOLTIP
    | NOTIFICATION
    | COMBO
    | DND
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NORMAL => f 0
          | DIALOG => f 1
          | MENU => f 2
          | TOOLBAR => f 3
          | SPLASHSCREEN => f 4
          | UTILITY => f 5
          | DOCK => f 6
          | DESKTOP => f 7
          | DROPDOWN_MENU => f 8
          | POPUP_MENU => f 9
          | TOOLTIP => f 10
          | NOTIFICATION => f 11
          | COMBO => f 12
          | DND => f 13
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NORMAL
          | 1 => DIALOG
          | 2 => MENU
          | 3 => TOOLBAR
          | 4 => SPLASHSCREEN
          | 5 => UTILITY
          | 6 => DOCK
          | 7 => DESKTOP
          | 8 => DROPDOWN_MENU
          | 9 => POPUP_MENU
          | 10 => TOOLTIP
          | 11 => NOTIFICATION
          | 12 => COMBO
          | 13 => DND
          | n => raise Value n
      end
    val getType_ = _import "gdk_window_type_hint_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NORMAL
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
