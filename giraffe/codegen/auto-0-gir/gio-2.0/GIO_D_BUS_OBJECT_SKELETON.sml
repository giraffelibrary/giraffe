signature GIO_D_BUS_OBJECT_SKELETON =
  sig
    type 'a class
    type 'a d_bus_object_class
    type 'a d_bus_method_invocation_class
    type 'a d_bus_interface_skeleton_class
    type t = base class
    val asDBusObject : 'a class -> base d_bus_object_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val addInterface :
      'a class
       -> 'b d_bus_interface_skeleton_class
       -> unit
    val flush : 'a class -> unit
    val removeInterface :
      'a class
       -> 'b d_bus_interface_skeleton_class
       -> unit
    val removeInterfaceByName :
      'a class
       -> string
       -> unit
    val setObjectPath :
      'a class
       -> string
       -> unit
    val authorizeMethodSig : (base d_bus_interface_skeleton_class * base d_bus_method_invocation_class -> bool) -> 'a class Signal.t
    val gObjectPathProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
