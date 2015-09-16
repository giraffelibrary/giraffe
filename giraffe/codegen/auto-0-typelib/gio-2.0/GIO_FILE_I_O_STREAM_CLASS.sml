signature GIO_FILE_I_O_STREAM_CLASS =
  sig
    type 'a file_i_o_stream
    type 'a i_o_stream_class_t
    type 'a t = 'a file_i_o_stream i_o_stream_class_t
    val toBase : 'a t -> base t
    val t : (base t, 'a t) GObject.Value.accessor
    val tOpt : (base t option, 'a t option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a t
        val fromOptPtr :
          bool
           -> unit p
           -> 'a t option
      end
  end
