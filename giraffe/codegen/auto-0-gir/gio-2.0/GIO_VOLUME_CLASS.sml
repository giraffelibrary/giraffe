signature GIO_VOLUME_CLASS =
  sig
    type 'a volume
    include
      CLASS
        where type 'a class = 'a volume GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
