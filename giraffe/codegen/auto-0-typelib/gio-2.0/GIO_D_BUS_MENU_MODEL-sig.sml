signature GIO_D_BUS_MENU_MODEL =
  sig
    type 'a class
    type 'a d_bus_connection_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val get :
      'a d_bus_connection_class
       * string
       * string
       -> base class
  end
