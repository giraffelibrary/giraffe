structure GioFileIOStreamClass :>
  GIO_FILE_I_O_STREAM_CLASS
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t
    where type C.notnull = GioIOStreamClass.C.notnull
    where type 'a C.p = 'a GioIOStreamClass.C.p =
  struct
    type 'a fileiostream = unit
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
    type 'a t = 'a fileiostream iostreamclass_t
    fun toBase obj = obj
    val t = GioIOStreamClass.t
    val tOpt = GioIOStreamClass.tOpt
    structure C = GioIOStreamClass.C
  end
