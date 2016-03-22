signature GTK_H_SCALE_CLASS =
  sig
    type 'a h_scale
    type 'a scale_class
    include
      CLASS
        where type 'a class = 'a h_scale scale_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
