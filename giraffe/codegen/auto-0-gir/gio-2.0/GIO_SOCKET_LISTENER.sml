signature GIO_SOCKET_LISTENER =
  sig
    type 'a class_t
    type 'a socketconnectionclass_t
    type 'a cancellableclass_t
    type 'a asyncresultclass_t
    type socketprotocol_t
    type sockettype_t
    type 'a socketaddressclass_t
    type 'a socketclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val accept :
      'a class_t
       -> 'b cancellableclass_t option
       -> base socketconnectionclass_t * base GObject.ObjectClass.t
    val acceptFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base socketconnectionclass_t * base GObject.ObjectClass.t
    val acceptSocket :
      'a class_t
       -> 'b cancellableclass_t option
       -> base socketclass_t * base GObject.ObjectClass.t
    val acceptSocketFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base socketclass_t * base GObject.ObjectClass.t
    val addAddress :
      'a class_t
       -> 'b socketaddressclass_t
       -> sockettype_t
       -> socketprotocol_t
       -> 'c GObject.ObjectClass.t option
       -> base socketaddressclass_t option
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
       -> 'b socketclass_t
       -> 'c GObject.ObjectClass.t option
       -> bool
    val close : 'a class_t -> unit
    val setBacklog :
      'a class_t
       -> LargeInt.int
       -> unit
    val listenBacklogProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
