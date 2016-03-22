signature GDK_DEVICE_CLASS =
  sig
    type 'a device
    include
      CLASS
        where type 'a class = 'a device GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
