signature GIO_FILE_INPUT_STREAM_CLASS =
  sig
    type 'a file_input_stream
    type 'a input_stream_class
    include
      CLASS
        where type 'a class = 'a file_input_stream input_stream_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
