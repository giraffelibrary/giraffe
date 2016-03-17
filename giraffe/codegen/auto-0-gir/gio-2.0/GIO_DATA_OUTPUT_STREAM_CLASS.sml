signature GIO_DATA_OUTPUT_STREAM_CLASS =
  sig
    type 'a data_output_stream
    type 'a filter_output_stream_class
    type 'a class = 'a data_output_stream filter_output_stream_class
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
