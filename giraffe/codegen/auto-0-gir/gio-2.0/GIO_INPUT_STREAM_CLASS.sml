signature GIO_INPUT_STREAM_CLASS =
  sig
    type 'a input_stream
    include
      CLASS
        where type 'a class = 'a input_stream GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
