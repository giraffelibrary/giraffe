signature GIO_ZLIB_DECOMPRESSOR_CLASS =
  sig
    type 'a zlib_decompressor
    include
      CLASS
        where type 'a class = 'a zlib_decompressor GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
