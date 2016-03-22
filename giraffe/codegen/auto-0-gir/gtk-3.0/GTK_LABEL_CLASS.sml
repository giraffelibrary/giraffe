signature GTK_LABEL_CLASS =
  sig
    type 'a label
    type 'a misc_class
    include
      CLASS
        where type 'a class = 'a label misc_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
