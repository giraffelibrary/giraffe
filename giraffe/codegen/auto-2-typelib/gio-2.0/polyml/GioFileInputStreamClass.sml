structure GioFileInputStreamClass :>
  GIO_FILE_INPUT_STREAM_CLASS
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type C.notnull = GioInputStreamClass.C.notnull
    where type 'a C.p = 'a GioInputStreamClass.C.p =
  struct
    type 'a fileinputstream = unit
    type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    type 'a t = 'a fileinputstream inputstreamclass_t
    fun toBase obj = obj
    val t = GioInputStreamClass.t
    val tOpt = GioInputStreamClass.tOpt
    structure C = GioInputStreamClass.C
  end
