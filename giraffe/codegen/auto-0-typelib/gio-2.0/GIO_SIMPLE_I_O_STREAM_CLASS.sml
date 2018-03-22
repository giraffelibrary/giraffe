signature GIO_SIMPLE_I_O_STREAM_CLASS =
  sig
    type 'a simple_i_o_stream
    type 'a i_o_stream_class
    include
      CLASS
        where type 'a class = 'a simple_i_o_stream i_o_stream_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
