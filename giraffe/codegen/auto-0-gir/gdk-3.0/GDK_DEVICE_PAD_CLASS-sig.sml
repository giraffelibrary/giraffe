signature GDK_DEVICE_PAD_CLASS =
  sig
    type 'a device_pad
    include
      CLASS
        where type 'a class = 'a device_pad GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
