signature GIO_VFS_CLASS =
  sig
    type 'a vfs
    include
      CLASS
        where type 'a class = 'a vfs GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
