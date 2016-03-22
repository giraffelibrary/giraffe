signature GTK_RECENT_CHOOSER_MENU_CLASS =
  sig
    type 'a recent_chooser_menu
    type 'a menu_class
    include
      CLASS
        where type 'a class = 'a recent_chooser_menu menu_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
