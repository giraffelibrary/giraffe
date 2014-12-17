signature GIO_RESOLVER =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    type 'a inetaddressclass_t
    type 'a asyncresultclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val lookupByAddress :
      'a class_t
       -> 'b inetaddressclass_t
       -> 'c cancellableclass_t option
       -> string
    val lookupByAddressFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> string
    val setDefault : 'a class_t -> unit
    val reloadSig : (unit -> unit) -> 'a class_t Signal.signal
  end
