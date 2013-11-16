structure GtkRecentChooserMenuClass :>
  GTK_RECENT_CHOOSER_MENU_CLASS
    where type 'a menuclass_t = 'a GtkMenuClass.t
    where type C.notnull = GtkMenuClass.C.notnull
    where type 'a C.p = 'a GtkMenuClass.C.p =
  struct
    type 'a recentchoosermenu = unit
    type 'a menuclass_t = 'a GtkMenuClass.t
    type 'a t = 'a recentchoosermenu menuclass_t
    fun toBase obj = obj
    val t = GtkMenuClass.t
    val tOpt = GtkMenuClass.tOpt
    structure C = GtkMenuClass.C
  end
