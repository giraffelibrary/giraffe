signature GIO_VFS_CLASS =
  sig
    type 'a vfs
    include
      CLASS
        where type 'a class = 'a vfs GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
