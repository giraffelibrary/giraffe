signature GIO_BUFFERED_OUTPUT_STREAM_CLASS =
  sig
    type 'a buffered_output_stream
    type 'a filter_output_stream_class
    include
      CLASS
        where type 'a class = 'a buffered_output_stream filter_output_stream_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
