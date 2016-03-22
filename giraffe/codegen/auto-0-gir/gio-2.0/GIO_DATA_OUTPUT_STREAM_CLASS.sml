signature GIO_DATA_OUTPUT_STREAM_CLASS =
  sig
    type 'a data_output_stream
    type 'a filter_output_stream_class
    include
      CLASS
        where type 'a class = 'a data_output_stream filter_output_stream_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
