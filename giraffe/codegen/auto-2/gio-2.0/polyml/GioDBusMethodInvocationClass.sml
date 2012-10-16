structure GioDBusMethodInvocationClass :>
  GIO_D_BUS_METHOD_INVOCATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a dbusmethodinvocation = unit
    type 'a t = 'a dbusmethodinvocation GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
