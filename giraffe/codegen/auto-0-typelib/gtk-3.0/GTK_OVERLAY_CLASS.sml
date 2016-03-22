signature GTK_OVERLAY_CLASS =
  sig
    type 'a overlay
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a overlay bin_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
