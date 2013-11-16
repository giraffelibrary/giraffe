signature GIO_BUFFERED_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    type 'a asyncresultclass_t
    type 'a inputstreamclass_t
    val getType : unit -> GObject.Type.t
    val new : 'a inputstreamclass_t -> base class_t
    val newSized :
      'a inputstreamclass_t
       -> LargeInt.int
       -> base class_t
    val fill :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val fillFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> LargeInt.int
    val getAvailable : 'a class_t -> LargeInt.int
    val getBufferSize : 'a class_t -> LargeInt.int
    val readByte :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val setBufferSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val bufferSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
