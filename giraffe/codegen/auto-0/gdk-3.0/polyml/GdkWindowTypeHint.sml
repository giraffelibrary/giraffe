structure GdkWindowTypeHint :>
  sig
    include GDK_WINDOW_TYPE_HINT
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
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
    | DROPDOWNMENU
    | POPUPMENU
    | TOOLTIP
    | NOTIFICATION
    | COMBO
    | DND
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
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
          | DROPDOWNMENU => f 8
          | POPUPMENU => f 9
          | TOOLTIP => f 10
          | NOTIFICATION => f 11
          | COMBO => f 12
          | DND => f 13
        fun withRefVal f = withVal (FFI.Enum.withRef f)
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
          | 8 => DROPDOWNMENU
          | 9 => POPUPMENU
          | 10 => TOOLTIP
          | 11 => NOTIFICATION
          | 12 => COMBO
          | 13 => DND
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_window_type_hint_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
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
