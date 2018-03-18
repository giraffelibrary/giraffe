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
    val baseStreamProp :
      {
        get : 'a class -> base output_stream_class option,
        new : 'b output_stream_class option -> 'a class Property.t
      }
    val closeBaseStreamProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
  end
