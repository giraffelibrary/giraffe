signature GTK_MOUNT_OPERATION_CLASS =
  sig
    type 'a mount_operation
    include
      CLASS
        where type 'a class = 'a mount_operation Gio.MountOperationClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
