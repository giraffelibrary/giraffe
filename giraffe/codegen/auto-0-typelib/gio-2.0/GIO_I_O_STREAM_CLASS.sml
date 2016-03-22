signature GIO_I_O_STREAM_CLASS =
  sig
    type 'a i_o_stream
    include
      CLASS
        where type 'a class = 'a i_o_stream GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
