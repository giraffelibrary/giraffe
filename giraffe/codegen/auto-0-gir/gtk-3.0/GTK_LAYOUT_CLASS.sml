signature GTK_LAYOUT_CLASS =
  sig
    type 'a layout
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a layout container_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
