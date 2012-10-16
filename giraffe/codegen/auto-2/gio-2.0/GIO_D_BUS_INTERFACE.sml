signature GIO_D_BUS_INTERFACE =
  sig
    type 'a class_t
    type 'a dbusobjectclass_t
    type dbusinterfaceinforecord_t
    val getType : unit -> GObject.Type.t
    val getInfo : 'a class_t -> dbusinterfaceinforecord_t
    val getObject : 'a class_t -> base dbusobjectclass_t
    val setObject :
      'a class_t
       -> 'b dbusobjectclass_t
       -> unit
  end
