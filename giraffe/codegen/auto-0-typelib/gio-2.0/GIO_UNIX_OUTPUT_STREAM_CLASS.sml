signature GIO_UNIX_OUTPUT_STREAM_CLASS =
  sig
    type 'a unix_output_stream
    type 'a output_stream_class
    include
      CLASS
        where type 'a class = 'a unix_output_stream output_stream_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
