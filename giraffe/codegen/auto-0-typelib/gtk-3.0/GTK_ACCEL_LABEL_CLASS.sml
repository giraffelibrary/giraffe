signature GTK_ACCEL_LABEL_CLASS =
  sig
    type 'a accel_label
    type 'a label_class
    include
      CLASS
        where type 'a class = 'a accel_label label_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
