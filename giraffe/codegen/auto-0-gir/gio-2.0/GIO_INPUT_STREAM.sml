signature GIO_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val clearPending : 'a class_t -> unit
    val close :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val closeFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val readFinish :
      'a class_t
       -> 'b async_result_class_t
       -> LargeInt.int
    val setPending : 'a class_t -> bool
    val skip :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> LargeInt.int
    val skipFinish :
      'a class_t
       -> 'b async_result_class_t
       -> LargeInt.int
  end
