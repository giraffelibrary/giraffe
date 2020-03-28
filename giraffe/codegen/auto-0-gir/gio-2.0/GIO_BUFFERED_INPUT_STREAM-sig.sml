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
    val newSized : 'a input_stream_class * LargeInt.int -> base class
    val fill :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> LargeInt.int
    val fillFinish :
      'a class
       -> 'b async_result_class
       -> LargeInt.int
    val getAvailable : 'a class -> LargeInt.int
    val getBufferSize : 'a class -> LargeInt.int
    val peek :
      'a class
       -> GUInt8CArrayN.t * LargeInt.int
       -> LargeInt.int
    val peekBuffer : 'a class -> GUInt8CArrayN.t
    val readByte :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val setBufferSize :
      'a class
       -> LargeInt.int
       -> unit
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
