signature GIO_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    type 'a cancellableclass_t
    val getType : unit -> GObject.Type.t
    val clearPending : 'a class_t -> unit
    val close :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val closeFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val readFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> LargeInt.int
    val setPending : 'a class_t -> bool
    val skip :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val skipFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> LargeInt.int
  end
