structure GtkUIManagerItemType :> GTK_U_I_MANAGER_ITEM_TYPE =
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
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gtk_ui_manager_item_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
