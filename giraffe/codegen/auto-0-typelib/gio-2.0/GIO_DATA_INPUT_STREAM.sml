signature GIO_DATA_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a input_stream_class_t
    type 'a cancellable_class_t
    type 'a async_result_class_t
    type data_stream_byte_order_t
    type data_stream_newline_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : 'a input_stream_class_t -> base class_t
    val getByteOrder : 'a class_t -> data_stream_byte_order_t
    val getNewlineType : 'a class_t -> data_stream_newline_type_t
    val readByte :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val readInt16 :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val readInt32 :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val readInt64 :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val readLineFinishUtf8 :
      'a class_t
       -> 'b async_result_class_t
       -> string * LargeInt.int
    val readLineUtf8 :
      'a class_t
       -> 'b cancellable_class_t option
       -> string * LargeInt.int
    val readUint16 :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val readUint32 :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val readUint64 :
      'a class_t
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val readUntil :
      'a class_t
       -> string
       -> 'b cancellable_class_t option
       -> string * LargeInt.int
    val readUntilFinish :
      'a class_t
       -> 'b async_result_class_t
       -> string * LargeInt.int
    val readUpto :
      'a class_t
       -> string
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> string * LargeInt.int
    val readUptoFinish :
      'a class_t
       -> 'b async_result_class_t
       -> string * LargeInt.int
    val setByteOrder :
      'a class_t
       -> data_stream_byte_order_t
       -> unit
    val setNewlineType :
      'a class_t
       -> data_stream_newline_type_t
       -> unit
    val byteOrderProp : ('a class_t, data_stream_byte_order_t, data_stream_byte_order_t) Property.readwrite
    val newlineTypeProp : ('a class_t, data_stream_newline_type_t, data_stream_newline_type_t) Property.readwrite
  end
