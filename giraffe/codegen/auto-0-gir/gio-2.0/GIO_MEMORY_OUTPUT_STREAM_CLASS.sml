signature GIO_MEMORY_OUTPUT_STREAM_CLASS =
  sig
    type 'a memory_output_stream
    type 'a output_stream_class
    include
      CLASS
        where type 'a class = 'a memory_output_stream output_stream_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
