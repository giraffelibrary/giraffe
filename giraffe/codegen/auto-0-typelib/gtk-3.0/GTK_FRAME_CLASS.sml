signature GTK_FRAME_CLASS =
  sig
    type 'a frame
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a frame bin_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
