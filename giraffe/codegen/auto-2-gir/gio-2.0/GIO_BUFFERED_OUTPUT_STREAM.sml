signature GIO_BUFFERED_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a outputstreamclass_t
    val getType : unit -> GObject.Type.t
    val new : 'a outputstreamclass_t -> base class_t
    val newSized :
      'a outputstreamclass_t
       -> LargeInt.int
       -> base class_t
    val getAutoGrow : 'a class_t -> bool
    val getBufferSize : 'a class_t -> LargeInt.int
    val setAutoGrow :
      'a class_t
       -> bool
       -> unit
    val setBufferSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val autoGrowProp : ('a class_t, bool, bool) Property.readwrite
    val bufferSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
