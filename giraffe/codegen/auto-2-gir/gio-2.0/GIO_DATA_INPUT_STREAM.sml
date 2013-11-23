signature GIO_DATA_INPUT_STREAM =
  sig
    type 'a class_t
    type datastreamnewlinetype_t
    type datastreambyteorder_t
    type 'a asyncresultclass_t
    type 'a cancellableclass_t
    type 'a inputstreamclass_t
    val getType : unit -> GObject.Type.t
    val new : 'a inputstreamclass_t -> base class_t
    val getByteOrder : 'a class_t -> datastreambyteorder_t
    val getNewlineType : 'a class_t -> datastreamnewlinetype_t
    val readByte :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val readInt16 :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val readInt32 :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val readInt64 :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val readLineFinishUtf8 :
      'a class_t
       -> 'b asyncresultclass_t
       -> string * LargeInt.int
    val readLineUtf8 :
      'a class_t
       -> 'b cancellableclass_t option
       -> string * LargeInt.int
    val readUint16 :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val readUint32 :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val readUint64 :
      'a class_t
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val readUntil :
      'a class_t
       -> string
       -> 'b cancellableclass_t option
       -> string * LargeInt.int
    val readUntilFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> string * LargeInt.int
    val readUpto :
      'a class_t
       -> string
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> string * LargeInt.int
    val readUptoFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> string * LargeInt.int
    val setByteOrder :
      'a class_t
       -> datastreambyteorder_t
       -> unit
    val setNewlineType :
      'a class_t
       -> datastreamnewlinetype_t
       -> unit
    val byteOrderProp : ('a class_t, datastreambyteorder_t, datastreambyteorder_t) Property.readwrite
    val newlineTypeProp : ('a class_t, datastreamnewlinetype_t, datastreamnewlinetype_t) Property.readwrite
  end
