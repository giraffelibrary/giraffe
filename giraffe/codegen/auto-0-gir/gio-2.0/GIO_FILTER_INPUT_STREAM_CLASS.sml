signature GIO_FILTER_INPUT_STREAM_CLASS =
  sig
    type 'a filter_input_stream
    type 'a input_stream_class
    include
      CLASS
        where type 'a class = 'a filter_input_stream input_stream_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
