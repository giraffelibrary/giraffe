signature GIO_POLLABLE_INPUT_STREAM_CLASS =
  sig
    type 'a pollable_input_stream
    include
      CLASS
        where type 'a class = 'a pollable_input_stream GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
