signature GIO_DATA_INPUT_STREAM =
  sig
    type 'a class
    type 'a seekable_class
    type 'a input_stream_class
    type 'a cancellable_class
    type 'a async_result_class
    type data_stream_byte_order_t
    type data_stream_newline_type_t
    type t = base class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val new : 'a input_stream_class -> base class
    val getByteOrder : 'a class -> data_stream_byte_order_t
    val getNewlineType : 'a class -> data_stream_newline_type_t
    val readByte :
      'a class
       -> 'b cancellable_class option
       -> Word8.word
    val readInt16 :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val readInt32 :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val readInt64 :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val readLine :
      'a class
       -> 'b cancellable_class option
       -> GUInt8CArray.t option * int
    val readLineFinish :
      'a class
       -> 'b async_result_class
       -> GUInt8CArray.t option * int
    val readLineFinishUtf8 :
      'a class
       -> 'b async_result_class
       -> string option * int
    val readLineUtf8 :
      'a class
       -> 'b cancellable_class option
       -> string option * int
    val readUint16 :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val readUint32 :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val readUint64 :
      'a class
       -> 'b cancellable_class option
       -> LargeInt.int
    val readUntil :
      'a class
       -> string * 'b cancellable_class option
       -> string * int
    val readUntilFinish :
      'a class
       -> 'b async_result_class
       -> string * int
    val readUpto :
      'a class
       -> string
           * int
           * 'b cancellable_class option
       -> string * int
    val readUptoFinish :
      'a class
       -> 'b async_result_class
       -> string * int
    val setByteOrder :
      'a class
       -> data_stream_byte_order_t
       -> unit
    val setNewlineType :
      'a class
       -> data_stream_newline_type_t
       -> unit
    val byteOrderProp :
      {
        get : 'a class -> data_stream_byte_order_t,
        set :
          data_stream_byte_order_t
           -> 'a class
           -> unit,
        new : data_stream_byte_order_t -> 'a class Property.t
      }
    val newlineTypeProp :
      {
        get : 'a class -> data_stream_newline_type_t,
        set :
          data_stream_newline_type_t
           -> 'a class
           -> unit,
        new : data_stream_newline_type_t -> 'a class Property.t
      }
  end
