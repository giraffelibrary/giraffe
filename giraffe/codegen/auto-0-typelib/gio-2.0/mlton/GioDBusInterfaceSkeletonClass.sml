structure GioDBusInterfaceSkeletonClass :>
  GIO_D_BUS_INTERFACE_SKELETON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a d_bus_interface_skeleton = unit
    type 'a class = 'a d_bus_interface_skeleton GObjectObjectClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
