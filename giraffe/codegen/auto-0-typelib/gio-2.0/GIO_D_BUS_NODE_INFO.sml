signature GIO_D_BUS_NODE_INFO =
  sig
    type t
    type d_bus_interface_info_t
    val getType : unit -> GObject.Type.t
    val newForXml : string -> t
    val lookupInterface :
      t
       -> string
       -> d_bus_interface_info_t
  end
