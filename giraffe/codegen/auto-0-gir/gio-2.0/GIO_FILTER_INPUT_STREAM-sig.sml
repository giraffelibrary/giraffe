signature GIO_FILTER_INPUT_STREAM =
  sig
    type 'a class
    type 'a input_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getBaseStream : 'a class -> base input_stream_class
    val getCloseBaseStream : 'a class -> bool
    val setCloseBaseStream :
      'a class
       -> bool
       -> unit
    val baseStreamProp :
      {
        get : 'a class -> base input_stream_class option,
        new : 'b input_stream_class option -> 'a class Property.t
      }
    val closeBaseStreamProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
