signature GIO_SIMPLE_ASYNC_RESULT =
  sig
    type 'a class
    type 'a async_result_class
    type 'a cancellable_class
    type t = base class
    val asAsyncResult : 'a class -> base async_result_class
    val getType : unit -> GObject.Type.t
    val complete : 'a class -> unit
    val completeInIdle : 'a class -> unit
    val getOpResGboolean : 'a class -> bool
    val getOpResGssize : 'a class -> int
    val propagateError : 'a class -> unit
    val setCheckCancellable :
      'a class
       -> 'b cancellable_class option
       -> unit
    val setHandleCancellation :
      'a class
       -> bool
       -> unit
    val setOpResGboolean :
      'a class
       -> bool
       -> unit
    val setOpResGssize :
      'a class
       -> int
       -> unit
  end
