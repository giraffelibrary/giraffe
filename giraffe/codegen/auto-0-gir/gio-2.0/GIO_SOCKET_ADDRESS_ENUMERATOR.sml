signature GIO_SOCKET_ADDRESS_ENUMERATOR =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a socket_address_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val next :
      'a class
       -> 'b cancellable_class option
       -> base socket_address_class
    val nextFinish :
      'a class
       -> 'b async_result_class
       -> base socket_address_class
  end
