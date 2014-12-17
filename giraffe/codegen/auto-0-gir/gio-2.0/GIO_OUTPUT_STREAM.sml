signature GIO_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    type outputstreamspliceflags_t
    type 'a inputstreamclass_t
    type 'a asyncresultclass_t
    type t = base class_t
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
    val flush :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val flushFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val isClosing : 'a class_t -> bool
    val setPending : 'a class_t -> bool
    val splice :
      'a class_t
       -> 'b inputstreamclass_t
       -> outputstreamspliceflags_t
       -> 'c cancellableclass_t option
       -> LargeInt.int
    val spliceFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> LargeInt.int
    val writeFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> LargeInt.int
  end
