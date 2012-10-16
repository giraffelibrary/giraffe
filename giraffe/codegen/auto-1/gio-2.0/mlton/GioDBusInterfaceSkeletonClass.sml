structure GioDBusInterfaceSkeletonClass :>
  GIO_D_BUS_INTERFACE_SKELETON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a dbusinterfaceskeleton = unit
    type 'a t = 'a dbusinterfaceskeleton GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
