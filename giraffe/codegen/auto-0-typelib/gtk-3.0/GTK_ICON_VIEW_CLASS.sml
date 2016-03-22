signature GTK_ICON_VIEW_CLASS =
  sig
    type 'a icon_view
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a icon_view container_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
