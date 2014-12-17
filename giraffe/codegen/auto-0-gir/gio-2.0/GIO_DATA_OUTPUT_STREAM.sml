signature GIO_DATA_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a outputstreamclass_t
    type 'a cancellableclass_t
    type datastreambyteorder_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : 'a outputstreamclass_t -> base class_t
    val getByteOrder : 'a class_t -> datastreambyteorder_t
    val putByte :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
    val putInt16 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
    val putInt32 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
    val putInt64 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
    val putString :
      'a class_t
       -> string
       -> 'b cancellableclass_t option
       -> bool
    val putUint16 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
    val putUint32 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
    val putUint64 :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> bool
    val setByteOrder :
      'a class_t
       -> datastreambyteorder_t
       -> unit
    val byteOrderProp : ('a class_t, datastreambyteorder_t, datastreambyteorder_t) Property.readwrite
  end
