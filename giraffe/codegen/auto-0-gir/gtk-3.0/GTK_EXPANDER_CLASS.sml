signature GTK_EXPANDER_CLASS =
  sig
    type 'a expander
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a expander bin_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
