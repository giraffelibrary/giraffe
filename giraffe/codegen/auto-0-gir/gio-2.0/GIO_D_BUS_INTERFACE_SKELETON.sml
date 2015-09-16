signature GIO_D_BUS_INTERFACE_SKELETON =
  sig
    type 'a class_t
    type 'a d_bus_interface_class_t
    type 'a d_bus_connection_class_t
    type d_bus_interface_info_record_t
    type 'a d_bus_method_invocation_class_t
    type d_bus_interface_skeleton_flags_t
    type t = base class_t
    val asDBusInterface : 'a class_t -> base d_bus_interface_class_t
    val getType : unit -> GObject.Type.t
    val export :
      'a class_t
       -> 'b d_bus_connection_class_t
       -> string
       -> bool
    val flush : 'a class_t -> unit
    val getConnection : 'a class_t -> base d_bus_connection_class_t
    val getFlags : 'a class_t -> d_bus_interface_skeleton_flags_t
    val getInfo : 'a class_t -> d_bus_interface_info_record_t
    val getObjectPath : 'a class_t -> string
    val getProperties : 'a class_t -> GLib.VariantRecord.t
    val setFlags :
      'a class_t
       -> d_bus_interface_skeleton_flags_t
       -> unit
    val unexport : 'a class_t -> unit
    val gAuthorizeMethodSig : (base d_bus_method_invocation_class_t -> bool) -> 'a class_t Signal.signal
    val gFlagsProp : ('a class_t, d_bus_interface_skeleton_flags_t, d_bus_interface_skeleton_flags_t) Property.readwrite
  end
