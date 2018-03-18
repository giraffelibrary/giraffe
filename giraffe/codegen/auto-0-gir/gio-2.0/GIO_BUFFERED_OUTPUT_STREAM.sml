signature GIO_BUFFERED_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a seekable_class
    type 'a output_stream_class
    type t = base class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val new : 'a output_stream_class -> base class
    val newSized : 'a output_stream_class * LargeInt.int -> base class
    val getAutoGrow : 'a class -> bool
    val getBufferSize : 'a class -> LargeInt.int
    val setAutoGrow :
      'a class
       -> bool
       -> unit
    val setBufferSize :
      'a class
       -> LargeInt.int
       -> unit
    val autoGrowProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val bufferSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
