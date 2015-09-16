signature GIO_RESOLVER =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a inet_address_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val lookupByAddress :
      'a class_t
       -> 'b inet_address_class_t
       -> 'c cancellable_class_t option
       -> string
    val lookupByAddressFinish :
      'a class_t
       -> 'b async_result_class_t
       -> string
    val setDefault : 'a class_t -> unit
    val reloadSig : (unit -> unit) -> 'a class_t Signal.signal
  end
