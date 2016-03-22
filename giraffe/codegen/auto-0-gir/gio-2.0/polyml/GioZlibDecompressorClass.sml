structure GioZlibDecompressorClass :>
  GIO_ZLIB_DECOMPRESSOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a zlib_decompressor = unit
    type 'a class = 'a zlib_decompressor class
  end
