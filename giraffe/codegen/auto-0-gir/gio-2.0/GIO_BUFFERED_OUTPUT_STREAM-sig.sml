signature GIO_BUFFERED_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a seekable_class
    type 'a output_stream_class
    type t = base class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val new : 'a output_stream_class -> base class
    val newSized : 'a output_stream_class * int -> base class
    val getAutoGrow : 'a class -> bool
    val getBufferSize : 'a class -> int
    val setAutoGrow :
      'a class
       -> bool
       -> unit
    val setBufferSize :
      'a class
       -> int
       -> unit
    val autoGrowProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val bufferSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
