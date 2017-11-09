signature GIO_DATA_INPUT_STREAM_CLASS =
  sig
    type 'a data_input_stream
    type 'a buffered_input_stream_class
    include
      CLASS
        where type 'a class = 'a data_input_stream buffered_input_stream_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
