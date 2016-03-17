signature GIO_BUFFERED_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a output_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a output_stream_class -> base class
    val newSized :
      'a output_stream_class
       -> LargeInt.int
       -> base class
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
    val autoGrowProp : ('a class, bool, bool) Property.readwrite
    val bufferSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
