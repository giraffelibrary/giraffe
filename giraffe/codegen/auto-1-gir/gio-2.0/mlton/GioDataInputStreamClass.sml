structure GioDataInputStreamClass :>
  GIO_DATA_INPUT_STREAM_CLASS
    where type 'a bufferedinputstreamclass_t = 'a GioBufferedInputStreamClass.t
    where type C.notnull = GioBufferedInputStreamClass.C.notnull
    where type 'a C.p = 'a GioBufferedInputStreamClass.C.p =
  struct
    type 'a datainputstream = unit
    type 'a bufferedinputstreamclass_t = 'a GioBufferedInputStreamClass.t
    type 'a t = 'a datainputstream bufferedinputstreamclass_t
    fun toBase obj = obj
    val t = GioBufferedInputStreamClass.t
    val tOpt = GioBufferedInputStreamClass.tOpt
    structure C = GioBufferedInputStreamClass.C
  end
