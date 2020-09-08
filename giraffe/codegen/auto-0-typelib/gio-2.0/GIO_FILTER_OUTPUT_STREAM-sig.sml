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
    val baseStreamProp : ('a class, unit -> base output_stream_class option, unit, 'b output_stream_class option -> unit) Property.t
    val closeBaseStreamProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
  end
