structure GioFilterOutputStreamClass :>
  GIO_FILTER_OUTPUT_STREAM_CLASS
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type C.notnull = GioOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioOutputStreamClass.C.p =
  struct
    type 'a filter_output_stream = unit
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a class = 'a filter_output_stream output_stream_class
    type t = base class
    fun toBase obj = obj
    val t = GioOutputStreamClass.t
    val tOpt = GioOutputStreamClass.tOpt
    structure C = GioOutputStreamClass.C
  end
