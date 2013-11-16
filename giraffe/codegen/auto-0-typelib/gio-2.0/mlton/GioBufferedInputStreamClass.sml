structure GioBufferedInputStreamClass :>
  GIO_BUFFERED_INPUT_STREAM_CLASS
    where type 'a filterinputstreamclass_t = 'a GioFilterInputStreamClass.t
    where type C.notnull = GioFilterInputStreamClass.C.notnull
    where type 'a C.p = 'a GioFilterInputStreamClass.C.p =
  struct
    type 'a bufferedinputstream = unit
    type 'a filterinputstreamclass_t = 'a GioFilterInputStreamClass.t
    type 'a t = 'a bufferedinputstream filterinputstreamclass_t
    fun toBase obj = obj
    val t = GioFilterInputStreamClass.t
    val tOpt = GioFilterInputStreamClass.tOpt
    structure C = GioFilterInputStreamClass.C
  end
