signature GIO_DATA_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a output_stream_class_t
    type 'a cancellable_class_t
    type data_stream_byte_order_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : 'a output_stream_class_t -> base class_t
    val getByteOrder : 'a class_t -> data_stream_byte_order_t
    val putByte :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> bool
    val putInt16 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> bool
    val putInt32 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> bool
    val putInt64 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> bool
    val putString :
      'a class_t
       -> string
       -> 'b cancellable_class_t option
       -> bool
    val putUint16 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> bool
    val putUint32 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> bool
    val putUint64 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> bool
    val setByteOrder :
      'a class_t
       -> data_stream_byte_order_t
       -> unit
    val byteOrderProp : ('a class_t, data_stream_byte_order_t, data_stream_byte_order_t) Property.readwrite
  end
