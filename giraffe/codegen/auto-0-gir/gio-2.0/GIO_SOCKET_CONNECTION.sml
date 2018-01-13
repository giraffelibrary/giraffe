signature GIO_SOCKET_CONNECTION =
  sig
    type 'a class
    type socket_type_t
    type socket_family_t
    type 'a cancellable_class
    type 'a async_result_class
    type 'a socket_address_class
    type 'a socket_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val factoryLookupType :
      socket_family_t
       * socket_type_t
       * LargeInt.int
       -> GObject.Type.t
    val factoryRegisterType :
      GObject.Type.t
       * socket_family_t
       * socket_type_t
       * LargeInt.int
       -> unit
    val connect :
      'a class
       -> 'b socket_address_class * 'c cancellable_class option
       -> unit
    val connectFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val getLocalAddress : 'a class -> base socket_address_class
    val getRemoteAddress : 'a class -> base socket_address_class
    val getSocket : 'a class -> base socket_class
    val isConnected : 'a class -> bool
    val socketProp : ('a class, base socket_class option, 'b socket_class option) Property.readwrite
  end
