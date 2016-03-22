signature GDK_DEVICE_MANAGER_CLASS =
  sig
    type 'a device_manager
    include
      CLASS
        where type 'a class = 'a device_manager GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
