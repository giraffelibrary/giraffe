signature GIO_OUTPUT_STREAM_CLASS =
  sig
    type 'a output_stream
    include
      CLASS
        where type 'a class = 'a output_stream GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
