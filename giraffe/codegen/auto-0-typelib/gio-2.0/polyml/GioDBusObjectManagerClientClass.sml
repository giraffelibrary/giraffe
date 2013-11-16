structure GioDBusObjectManagerClientClass :>
  GIO_D_BUS_OBJECT_MANAGER_CLIENT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a dbusobjectmanagerclient = unit
    type 'a t = 'a dbusobjectmanagerclient GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
