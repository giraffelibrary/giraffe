signature GIO_POLLABLE_OUTPUT_STREAM_CLASS =
  sig
    type 'a pollable_output_stream
    include
      CLASS
        where type 'a class = 'a pollable_output_stream GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
