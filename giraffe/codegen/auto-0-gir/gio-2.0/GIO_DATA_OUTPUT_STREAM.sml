signature GIO_DATA_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a seekable_class
    type 'a output_stream_class
    type 'a cancellable_class
    type data_stream_byte_order_t
    type t = base class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val new : 'a output_stream_class -> base class
    val getByteOrder : 'a class -> data_stream_byte_order_t
    val putByte :
      'a class
       -> Word8.word * 'b cancellable_class option
       -> unit
    val putInt16 :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> unit
    val putInt32 :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> unit
    val putInt64 :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> unit
    val putString :
      'a class
       -> string * 'b cancellable_class option
       -> unit
    val putUint16 :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> unit
    val putUint32 :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> unit
    val putUint64 :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> unit
    val setByteOrder :
      'a class
       -> data_stream_byte_order_t
       -> unit
    val byteOrderProp : ('a class, data_stream_byte_order_t, data_stream_byte_order_t) Property.readwrite
  end
