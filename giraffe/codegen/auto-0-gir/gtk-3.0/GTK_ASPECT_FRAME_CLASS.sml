signature GTK_ASPECT_FRAME_CLASS =
  sig
    type 'a aspect_frame
    type 'a frame_class
    include
      CLASS
        where type 'a class = 'a aspect_frame frame_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
