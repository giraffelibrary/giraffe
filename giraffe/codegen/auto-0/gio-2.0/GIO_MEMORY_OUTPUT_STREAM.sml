signature GIO_MEMORY_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a seekableclass_t
    val asSeekable : 'a class_t -> base seekableclass_t
    val getType : unit -> GObject.Type.t
    val getData : 'a class_t -> unit
    val getDataSize : 'a class_t -> LargeInt.int
    val getSize : 'a class_t -> LargeInt.int
    val stealData : 'a class_t -> unit
    val dataSizeProp : ('a class_t, LargeInt.int) Property.readonly
    val sizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
