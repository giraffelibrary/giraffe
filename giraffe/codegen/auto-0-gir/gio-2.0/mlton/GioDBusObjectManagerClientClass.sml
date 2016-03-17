structure GioDBusObjectManagerClientClass :>
  GIO_D_BUS_OBJECT_MANAGER_CLIENT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a d_bus_object_manager_client = unit
    type 'a class = 'a d_bus_object_manager_client GObjectObjectClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
