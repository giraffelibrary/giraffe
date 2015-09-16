structure GioDataOutputStreamClass :>
  GIO_DATA_OUTPUT_STREAM_CLASS
    where type 'a filter_output_stream_class_t = 'a GioFilterOutputStreamClass.t
    where type C.notnull = GioFilterOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioFilterOutputStreamClass.C.p =
  struct
    type 'a data_output_stream = unit
    type 'a filter_output_stream_class_t = 'a GioFilterOutputStreamClass.t
    type 'a t = 'a data_output_stream filter_output_stream_class_t
    fun toBase obj = obj
    val t = GioFilterOutputStreamClass.t
    val tOpt = GioFilterOutputStreamClass.tOpt
    structure C = GioFilterOutputStreamClass.C
  end
