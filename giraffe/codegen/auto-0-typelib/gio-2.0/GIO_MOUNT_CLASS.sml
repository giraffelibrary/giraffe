signature GIO_MOUNT_CLASS =
  sig
    type 'a mount
    include
      CLASS
        where type 'a class = 'a mount GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
