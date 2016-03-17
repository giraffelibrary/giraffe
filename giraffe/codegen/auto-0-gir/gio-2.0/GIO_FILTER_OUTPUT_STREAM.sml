signature GIO_FILTER_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a output_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getBaseStream : 'a class -> base output_stream_class
    val getCloseBaseStream : 'a class -> bool
    val setCloseBaseStream :
      'a class
       -> bool
       -> unit
    val baseStreamProp : ('a class, base output_stream_class option, 'b output_stream_class option) Property.readwrite
    val closeBaseStreamProp : ('a class, bool, bool) Property.readwrite
  end
