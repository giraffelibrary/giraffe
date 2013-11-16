structure GtkUIManagerItemType :>
  sig
    include GTK_U_I_MANAGER_ITEM_TYPE
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
    val POPUPWITHACCELS = 0w512
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
        POPUPWITHACCELS
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
    val getType_ = _import "gtk_ui_manager_item_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
