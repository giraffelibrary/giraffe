signature GIO_BUFFERED_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a input_stream_class_t
    type 'a async_result_class_t
    type 'a cancellable_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : 'a input_stream_class_t -> base class_t
    val newSized :
      'a input_stream_class_t
       -> LargeInt.int
       -> base class_t
    val fill :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val fillFinish :
      'a class_t
       -> 'b async_result_class_t
       -> LargeInt.int
    val getAvailable : 'a class_t -> LargeInt.int
    val getBufferSize : 'a class_t -> LargeInt.int
    val readByte :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val setBufferSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val bufferSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
