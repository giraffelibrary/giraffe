structure GioZlibDecompressorClass :>
  GIO_ZLIB_DECOMPRESSOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a zlibdecompressor = unit
    type 'a t = 'a zlibdecompressor GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
