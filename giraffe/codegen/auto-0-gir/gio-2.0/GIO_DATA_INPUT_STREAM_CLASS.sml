signature GIO_DATA_INPUT_STREAM_CLASS =
  sig
    type 'a data_input_stream
    type 'a buffered_input_stream_class
    type 'a class = 'a data_input_stream buffered_input_stream_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
