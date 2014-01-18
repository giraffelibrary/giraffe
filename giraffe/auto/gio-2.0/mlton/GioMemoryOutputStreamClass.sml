structure GioMemoryOutputStreamClass :>
  GIO_MEMORY_OUTPUT_STREAM_CLASS
    where type 'a outputstreamclass_t = 'a GioOutputStreamClass.t
    where type C.notnull = GioOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioOutputStreamClass.C.p =
  struct
    type 'a memoryoutputstream = unit
    type 'a outputstreamclass_t = 'a GioOutputStreamClass.t
    type 'a t = 'a memoryoutputstream outputstreamclass_t
    fun toBase obj = obj
    val t = GioOutputStreamClass.t
    val tOpt = GioOutputStreamClass.tOpt
    structure C = GioOutputStreamClass.C
  end