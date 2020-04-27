signature GIO_PROXY_RESOLVER =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val isSupported : 'a class -> bool
    val lookup :
      'a class
       -> string * 'b cancellable_class option
       -> Utf8CPtrArray.t
    val lookupFinish :
      'a class
       -> 'b async_result_class
       -> Utf8CPtrArray.t
  end
