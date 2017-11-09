signature GIO_DRIVE_CLASS =
  sig
    type 'a drive
    include
      CLASS
        where type 'a class = 'a drive GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
