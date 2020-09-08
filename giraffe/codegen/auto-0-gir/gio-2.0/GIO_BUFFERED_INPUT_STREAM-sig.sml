signature GIO_BUFFERED_INPUT_STREAM =
  sig
    type 'a class
    type 'a seekable_class
    type 'a input_stream_class
    type 'a async_result_class
    type 'a cancellable_class
    type t = base class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val new : 'a input_stream_class -> base class
    val newSized : 'a input_stream_class * int -> base class
    val fill :
      'a class
       -> int * 'b cancellable_class option
       -> int
    val fillFinish :
      'a class
       -> 'b async_result_class
       -> int
    val getAvailable : 'a class -> int
    val getBufferSize : 'a class -> int
    val peek :
      'a class
       -> GUInt8CArrayN.t * int
       -> int
    val peekBuffer : 'a class -> GUInt8CArrayN.t
    val readByte :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val setBufferSize :
      'a class
       -> int
       -> unit
    val bufferSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
