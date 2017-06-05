structure GdkPixbufPixdataDumpType :> GDK_PIXBUF_PIXDATA_DUMP_TYPE =
  struct
    val PIXDATA_STREAM = 0w0
    val PIXDATA_STRUCT = 0w1
    val MACROS = 0w2
    val GTYPES = 0w0
    val CTYPES = 0w256
    val STATIC = 0w512
    val CONST = 0w1024
    val RLE_DECODER = 0w65536
    val allFlags =
      [
        PIXDATA_STREAM,
        PIXDATA_STRUCT,
        MACROS,
        GTYPES,
        CTYPES,
        STATIC,
        CONST,
        RLE_DECODER
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
