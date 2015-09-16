signature GIO_SIMPLE_ASYNC_RESULT =
  sig
    type 'a class_t
    type 'a async_result_class_t
    type t = base class_t
    val asAsyncResult : 'a class_t -> base async_result_class_t
    val getType : unit -> GObject.Type.t
    val complete : 'a class_t -> unit
    val completeInIdle : 'a class_t -> unit
    val getOpResGboolean : 'a class_t -> bool
    val getOpResGssize : 'a class_t -> LargeInt.int
    val propagateError : 'a class_t -> bool
    val setHandleCancellation :
      'a class_t
       -> bool
       -> unit
    val setOpResGboolean :
      'a class_t
       -> bool
       -> unit
    val setOpResGssize :
      'a class_t
       -> LargeInt.int
       -> unit
  end
