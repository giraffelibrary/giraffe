signature GIO_D_BUS_OBJECT_MANAGER_SERVER =
  sig
    type 'a class
    type 'a d_bus_object_manager_class
    type 'a d_bus_object_skeleton_class
    type 'a d_bus_connection_class
    type t = base class
    val asDBusObjectManager : 'a class -> base d_bus_object_manager_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val export :
      'a class
       -> 'b d_bus_object_skeleton_class
       -> unit
    val exportUniquely :
      'a class
       -> 'b d_bus_object_skeleton_class
       -> unit
    val getConnection : 'a class -> base d_bus_connection_class
    val isExported :
      'a class
       -> 'b d_bus_object_skeleton_class
       -> bool
    val setConnection :
      'a class
       -> 'b d_bus_connection_class option
       -> unit
    val unexport :
      'a class
       -> string
       -> bool
    val connectionProp : ('a class, unit -> base d_bus_connection_class option, 'b d_bus_connection_class option -> unit, 'b d_bus_connection_class option -> unit) Property.t
    val objectPathProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
  end
