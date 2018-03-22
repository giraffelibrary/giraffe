signature GIO_INPUT_STREAM_CLASS =
  sig
    type 'a input_stream
    include
      CLASS
        where type 'a class = 'a input_stream GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
