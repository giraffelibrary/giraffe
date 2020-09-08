signature GIO_D_BUS_INTERFACE_SKELETON =
  sig
    type 'a class
    type 'a d_bus_interface_class
    type d_bus_interface_info_t
    type 'a d_bus_connection_class
    type 'a d_bus_method_invocation_class
    type d_bus_interface_skeleton_flags_t
    type t = base class
    val asDBusInterface : 'a class -> base d_bus_interface_class
    val getType : unit -> GObject.Type.t
    val export :
      'a class
       -> 'b d_bus_connection_class * string
       -> unit
    val flush : 'a class -> unit
    val getConnection : 'a class -> base d_bus_connection_class
    val getFlags : 'a class -> d_bus_interface_skeleton_flags_t
    val getInfo : 'a class -> d_bus_interface_info_t
    val getObjectPath : 'a class -> string
    val getProperties : 'a class -> GLib.VariantRecord.t
    val hasConnection :
      'a class
       -> 'b d_bus_connection_class
       -> bool
    val setFlags :
      'a class
       -> d_bus_interface_skeleton_flags_t
       -> unit
    val unexport : 'a class -> unit
    val unexportFromConnection :
      'a class
       -> 'b d_bus_connection_class
       -> unit
    val gAuthorizeMethodSig : (base d_bus_method_invocation_class -> bool) -> 'a class Signal.t
    val gFlagsProp : ('a class, unit -> d_bus_interface_skeleton_flags_t, d_bus_interface_skeleton_flags_t -> unit, d_bus_interface_skeleton_flags_t -> unit) Property.t
  end
