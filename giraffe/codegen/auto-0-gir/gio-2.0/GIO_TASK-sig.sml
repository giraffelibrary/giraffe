signature GIO_TASK =
  sig
    type 'a class
    type 'a async_result_class
    type 'a cancellable_class
    type t = base class
    val asAsyncResult : 'a class -> base async_result_class
    val getType : unit -> GObject.Type.t
    val isValid : 'a async_result_class * 'b GObject.ObjectClass.class option -> bool
    val getCancellable : 'a class -> base cancellable_class
    val getCheckCancellable : 'a class -> bool
    val getCompleted : 'a class -> bool
    val getContext : 'a class -> GLib.MainContextRecord.t
    val getPriority : 'a class -> LargeInt.int
    val getReturnOnCancel : 'a class -> bool
    val getSourceObject : 'a class -> base GObject.ObjectClass.class
    val hadError : 'a class -> bool
    val propagateBoolean : 'a class -> unit
    val propagateInt : 'a class -> int
    val returnBoolean :
      'a class
       -> bool
       -> unit
    val returnErrorIfCancelled : 'a class -> bool
    val returnInt :
      'a class
       -> int
       -> unit
    val setCheckCancellable :
      'a class
       -> bool
       -> unit
    val setPriority :
      'a class
       -> LargeInt.int
       -> unit
    val setReturnOnCancel :
      'a class
       -> bool
       -> bool
    val completedProp : {get : 'a class -> bool}
  end
