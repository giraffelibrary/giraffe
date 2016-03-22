structure GioZlibCompressorClass :>
  GIO_ZLIB_COMPRESSOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a zlib_compressor = unit
    type 'a class = 'a zlib_compressor class
  end
