signature GIO_SOCKET_ADDRESS_ENUMERATOR =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a socket_address_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val next :
      'a class_t
       -> 'b cancellable_class_t option
       -> base socket_address_class_t
    val nextFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base socket_address_class_t
  end
