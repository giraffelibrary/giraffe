structure GdkWindowTypeHint :> GDK_WINDOW_TYPE_HINT =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = NORMAL
        val toInt =
          fn
            NORMAL => 0
          | DIALOG => 1
          | MENU => 2
          | TOOLBAR => 3
          | SPLASHSCREEN => 4
          | UTILITY => 5
          | DOCK => 6
          | DESKTOP => 7
          | DROPDOWN_MENU => 8
          | POPUP_MENU => 9
          | TOOLTIP => 10
          | NOTIFICATION => 11
          | COMBO => 12
          | DND => 13
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_window_type_hint_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
