structure GioBufferedOutputStreamClass :>
  GIO_BUFFERED_OUTPUT_STREAM_CLASS
    where type 'a filter_output_stream_class = 'a GioFilterOutputStreamClass.class
    where type C.notnull = GioFilterOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioFilterOutputStreamClass.C.p =
  struct
    type 'a buffered_output_stream = unit
    type 'a filter_output_stream_class = 'a GioFilterOutputStreamClass.class
    type 'a class = 'a buffered_output_stream filter_output_stream_class
    type t = base class
    fun toBase obj = obj
    val t = GioFilterOutputStreamClass.t
    val tOpt = GioFilterOutputStreamClass.tOpt
    structure C = GioFilterOutputStreamClass.C
  end
