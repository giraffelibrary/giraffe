signature GIO_CONVERTER_INPUT_STREAM_CLASS =
  sig
    type 'a converter_input_stream
    type 'a filter_input_stream_class
    include
      CLASS
        where type 'a class = 'a converter_input_stream filter_input_stream_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
