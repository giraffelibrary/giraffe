signature GIO_ZLIB_COMPRESSOR_CLASS =
  sig
    type 'a zlib_compressor
    include
      CLASS
        where type 'a class = 'a zlib_compressor GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
