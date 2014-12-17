signature GIO_SOCKET_ADDRESS_ENUMERATOR =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    type 'a socketaddressclass_t
    type 'a asyncresultclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val next :
      'a class_t
       -> 'b cancellableclass_t option
       -> base socketaddressclass_t
    val nextFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base socketaddressclass_t
  end
