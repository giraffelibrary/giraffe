signature GIO_RESOLVER =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a inet_address_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val lookupByAddress :
      'a class
       -> 'b inet_address_class
       -> 'c cancellable_class option
       -> string
    val lookupByAddressFinish :
      'a class
       -> 'b async_result_class
       -> string
    val setDefault : 'a class -> unit
    val reloadSig : (unit -> unit) -> 'a class Signal.signal
  end
