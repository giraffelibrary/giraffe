signature GTK_BOX_CLASS =
  sig
    type 'a box
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a box container_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
