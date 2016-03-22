signature GTK_ALIGNMENT_CLASS =
  sig
    type 'a alignment
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a alignment bin_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
