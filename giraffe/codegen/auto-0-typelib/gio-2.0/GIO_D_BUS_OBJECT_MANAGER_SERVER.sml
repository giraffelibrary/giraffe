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
    val connectionProp :
      {
        get : 'a class -> base d_bus_connection_class option,
        set :
          'b d_bus_connection_class option
           -> 'a class
           -> unit,
        new : 'b d_bus_connection_class option -> 'a class Property.t
      }
    val objectPathProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
