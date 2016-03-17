signature GIO_D_BUS_INTERFACE =
  sig
    type 'a class
    type d_bus_interface_info_t
    type 'a d_bus_object_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getInfo : 'a class -> d_bus_interface_info_t
    val getObject : 'a class -> base d_bus_object_class
    val setObject :
      'a class
       -> 'b d_bus_object_class
       -> unit
  end
