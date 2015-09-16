structure GtkUIManagerItemType :>
  sig
    include GTK_U_I_MANAGER_ITEM_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val AUTO = 0w0
    val MENUBAR = 0w1
    val MENU = 0w2
    val TOOLBAR = 0w4
    val PLACEHOLDER = 0w8
    val POPUP = 0w16
    val MENUITEM = 0w32
    val TOOLITEM = 0w64
    val SEPARATOR = 0w128
    val ACCELERATOR = 0w256
    val POPUP_WITH_ACCELS = 0w512
    val allFlags =
      [
        AUTO,
        MENUBAR,
        MENU,
        TOOLBAR,
        PLACEHOLDER,
        POPUP,
        MENUITEM,
        TOOLITEM,
        SEPARATOR,
        ACCELERATOR,
        POPUP_WITH_ACCELS
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val VAL = FFI.Flags.PolyML.VAL
        val REF = FFI.Flags.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_ui_manager_item_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
