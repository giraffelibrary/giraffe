signature GIO_D_BUS_INTERFACE =
  sig
    type 'a class_t
    type d_bus_interface_info_record_t
    type 'a d_bus_object_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getInfo : 'a class_t -> d_bus_interface_info_record_t
    val getObject : 'a class_t -> base d_bus_object_class_t
    val setObject :
      'a class_t
       -> 'b d_bus_object_class_t
       -> unit
  end
