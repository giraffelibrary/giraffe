signature GTK_H_BOX_CLASS =
  sig
    type 'a h_box
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a h_box box_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
