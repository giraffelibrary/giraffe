signature GIO_OUTPUT_STREAM_CLASS =
  sig
    type 'a output_stream
    include
      CLASS
        where type 'a class = 'a output_stream GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
