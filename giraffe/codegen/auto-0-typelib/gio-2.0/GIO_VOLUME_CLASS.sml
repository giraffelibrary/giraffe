signature GIO_VOLUME_CLASS =
  sig
    type 'a volume
    include
      CLASS
        where type 'a class = 'a volume GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
