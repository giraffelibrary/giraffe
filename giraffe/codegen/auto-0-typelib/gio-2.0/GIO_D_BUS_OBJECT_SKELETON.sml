signature GIO_D_BUS_OBJECT_SKELETON =
  sig
    type 'a class_t
    type 'a d_bus_object_class_t
    type 'a d_bus_method_invocation_class_t
    type 'a d_bus_interface_skeleton_class_t
    type t = base class_t
    val asDBusObject : 'a class_t -> base d_bus_object_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val addInterface :
      'a class_t
       -> 'b d_bus_interface_skeleton_class_t
       -> unit
    val flush : 'a class_t -> unit
    val removeInterface :
      'a class_t
       -> 'b d_bus_interface_skeleton_class_t
       -> unit
    val removeInterfaceByName :
      'a class_t
       -> string
       -> unit
    val setObjectPath :
      'a class_t
       -> string
       -> unit
    val authorizeMethodSig :
      (base d_bus_interface_skeleton_class_t
        -> base d_bus_method_invocation_class_t
        -> bool)
       -> 'a class_t Signal.signal
    val objectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
