signature GDK_DEVICE_CLASS =
  sig
    type 'a device
    include
      CLASS
        where type 'a class = 'a device GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
