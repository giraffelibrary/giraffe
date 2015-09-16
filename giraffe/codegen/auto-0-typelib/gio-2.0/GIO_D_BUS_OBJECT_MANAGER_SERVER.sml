signature GIO_D_BUS_OBJECT_MANAGER_SERVER =
  sig
    type 'a class_t
    type 'a d_bus_object_manager_class_t
    type 'a d_bus_object_skeleton_class_t
    type 'a d_bus_connection_class_t
    type t = base class_t
    val asDBusObjectManager : 'a class_t -> base d_bus_object_manager_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val export :
      'a class_t
       -> 'b d_bus_object_skeleton_class_t
       -> unit
    val exportUniquely :
      'a class_t
       -> 'b d_bus_object_skeleton_class_t
       -> unit
    val getConnection : 'a class_t -> base d_bus_connection_class_t
    val setConnection :
      'a class_t
       -> 'b d_bus_connection_class_t option
       -> unit
    val unexport :
      'a class_t
       -> string
       -> bool
    val connectionProp : ('a class_t, base d_bus_connection_class_t option, 'b d_bus_connection_class_t option) Property.readwrite
    val objectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
