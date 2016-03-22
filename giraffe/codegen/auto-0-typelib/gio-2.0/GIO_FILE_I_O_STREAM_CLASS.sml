signature GIO_FILE_I_O_STREAM_CLASS =
  sig
    type 'a file_i_o_stream
    type 'a i_o_stream_class
    include
      CLASS
        where type 'a class = 'a file_i_o_stream i_o_stream_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
