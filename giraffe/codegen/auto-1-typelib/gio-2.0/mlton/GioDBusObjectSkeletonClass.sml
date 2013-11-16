structure GioDBusObjectSkeletonClass :>
  GIO_D_BUS_OBJECT_SKELETON_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a dbusobjectskeleton = unit
    type 'a t = 'a dbusobjectskeleton GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
