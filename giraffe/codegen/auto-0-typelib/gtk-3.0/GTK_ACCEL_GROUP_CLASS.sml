signature GTK_ACCEL_GROUP_CLASS =
  sig
    type 'a accel_group
    include
      CLASS
        where type 'a class = 'a accel_group GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
