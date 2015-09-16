structure GioUnixOutputStreamClass :>
  GIO_UNIX_OUTPUT_STREAM_CLASS
    where type 'a output_stream_class_t = 'a GioOutputStreamClass.t
    where type C.notnull = GioOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioOutputStreamClass.C.p =
  struct
    type 'a unix_output_stream = unit
    type 'a output_stream_class_t = 'a GioOutputStreamClass.t
    type 'a t = 'a unix_output_stream output_stream_class_t
    fun toBase obj = obj
    val t = GioOutputStreamClass.t
    val tOpt = GioOutputStreamClass.tOpt
    structure C = GioOutputStreamClass.C
  end
