signature GTK_V_SEPARATOR_CLASS =
  sig
    type 'a v_separator
    type 'a separator_class
    include
      CLASS
        where type 'a class = 'a v_separator separator_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
