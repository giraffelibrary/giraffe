signature GIO_DATA_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a output_stream_class
    type 'a cancellable_class
    type data_stream_byte_order_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a output_stream_class -> base class
    val getByteOrder : 'a class -> data_stream_byte_order_t
    val putByte :
      'a class
       -> LargeInt.int
       -> 'b cancellable_class option
       -> bool
    val putInt16 :
      'a class
       -> LargeInt.int
       -> 'b cancellable_class option
       -> bool
    val putInt32 :
      'a class
       -> LargeInt.int
       -> 'b cancellable_class option
       -> bool
    val putInt64 :
      'a class
       -> LargeInt.int
       -> 'b cancellable_class option
       -> bool
    val putString :
      'a class
       -> string
       -> 'b cancellable_class option
       -> bool
    val putUint16 :
      'a class
       -> LargeInt.int
       -> 'b cancellable_class option
       -> bool
    val putUint32 :
      'a class
       -> LargeInt.int
       -> 'b cancellable_class option
       -> bool
    val putUint64 :
      'a class
       -> LargeInt.int
       -> 'b cancellable_class option
       -> bool
    val setByteOrder :
      'a class
       -> data_stream_byte_order_t
       -> unit
    val byteOrderProp : ('a class, data_stream_byte_order_t, data_stream_byte_order_t) Property.readwrite
  end
