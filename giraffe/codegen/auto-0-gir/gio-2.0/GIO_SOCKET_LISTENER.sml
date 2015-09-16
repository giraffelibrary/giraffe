signature GIO_SOCKET_LISTENER =
  sig
    type 'a class_t
    type 'a socket_connection_class_t
    type 'a cancellable_class_t
    type 'a async_result_class_t
    type socket_protocol_t
    type socket_type_t
    type 'a socket_address_class_t
    type 'a socket_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val accept :
      'a class_t
       -> 'b cancellable_class_t option
       -> base socket_connection_class_t * base GObject.ObjectClass.t
    val acceptFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base socket_connection_class_t * base GObject.ObjectClass.t
    val acceptSocket :
      'a class_t
       -> 'b cancellable_class_t option
       -> base socket_class_t * base GObject.ObjectClass.t
    val acceptSocketFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base socket_class_t * base GObject.ObjectClass.t
    val addAddress :
      'a class_t
       -> 'b socket_address_class_t
       -> socket_type_t
       -> socket_protocol_t
       -> 'c GObject.ObjectClass.t option
       -> base socket_address_class_t option
    val addAnyInetPort :
      'a class_t
       -> 'b GObject.ObjectClass.t option
       -> LargeInt.int
    val addInetPort :
      'a class_t
       -> LargeInt.int
       -> 'b GObject.ObjectClass.t option
       -> bool
    val addSocket :
      'a class_t
       -> 'b socket_class_t
       -> 'c GObject.ObjectClass.t option
       -> bool
    val close : 'a class_t -> unit
    val setBacklog :
      'a class_t
       -> LargeInt.int
       -> unit
    val listenBacklogProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
