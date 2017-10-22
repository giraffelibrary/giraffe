signature GIO_D_BUS_ACTION_GROUP =
  sig
    type 'a class
    type 'a action_group_class
    type 'a remote_action_group_class
    type 'a d_bus_connection_class
    type t = base class
    val asActionGroup : 'a class -> base action_group_class
    val asRemoteActionGroup : 'a class -> base remote_action_group_class
    val getType : unit -> GObject.Type.t
    val get :
      'a d_bus_connection_class
       * string
       * string
       -> base class
  end
