signature GTK_U_I_MANAGER_ITEM_TYPE =
  sig
    include FLAGS
    val AUTO : t
    val MENUBAR : t
    val MENU : t
    val TOOLBAR : t
    val PLACEHOLDER : t
    val POPUP : t
    val MENUITEM : t
    val TOOLITEM : t
    val SEPARATOR : t
    val ACCELERATOR : t
    val POPUP_WITH_ACCELS : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
