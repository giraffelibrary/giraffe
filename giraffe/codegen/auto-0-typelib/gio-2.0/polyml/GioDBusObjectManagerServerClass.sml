structure GioDBusObjectManagerServerClass :>
  GIO_D_BUS_OBJECT_MANAGER_SERVER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a dbusobjectmanagerserver = unit
    type 'a t = 'a dbusobjectmanagerserver GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
