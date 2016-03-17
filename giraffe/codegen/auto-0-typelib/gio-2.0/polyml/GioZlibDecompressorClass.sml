structure GioZlibDecompressorClass :>
  GIO_ZLIB_DECOMPRESSOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a zlib_decompressor = unit
    type 'a class = 'a zlib_decompressor GObjectObjectClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
