signature GTK_H_SEPARATOR_CLASS =
  sig
    type 'a h_separator
    type 'a separator_class
    include
      CLASS
        where type 'a class = 'a h_separator separator_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
