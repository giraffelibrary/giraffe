signature GIO_SOCKET_LISTENER =
  sig
    type 'a class
    type 'a socket_connection_class
    type 'a cancellable_class
    type 'a async_result_class
    type socket_protocol_t
    type socket_type_t
    type 'a socket_address_class
    type 'a socket_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val accept :
      'a class
       -> 'b cancellable_class option
       -> base socket_connection_class * base GObject.ObjectClass.class
    val acceptFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class * base GObject.ObjectClass.class
    val acceptSocket :
      'a class
       -> 'b cancellable_class option
       -> base socket_class * base GObject.ObjectClass.class
    val acceptSocketFinish :
      'a class
       -> 'b async_result_class
       -> base socket_class * base GObject.ObjectClass.class
    val addAddress :
      'a class
       -> 'b socket_address_class
           * socket_type_t
           * socket_protocol_t
           * 'c GObject.ObjectClass.class option
       -> base socket_address_class option
    val addAnyInetPort :
      'a class
       -> 'b GObject.ObjectClass.class option
       -> LargeInt.int
    val addInetPort :
      'a class
       -> LargeInt.int * 'b GObject.ObjectClass.class option
       -> bool
    val addSocket :
      'a class
       -> 'b socket_class * 'c GObject.ObjectClass.class option
       -> bool
    val close : 'a class -> unit
    val setBacklog :
      'a class
       -> LargeInt.int
       -> unit
    val listenBacklogProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
