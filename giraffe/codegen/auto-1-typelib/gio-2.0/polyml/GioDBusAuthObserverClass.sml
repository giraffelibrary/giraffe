structure GioDBusAuthObserverClass :>
  GIO_D_BUS_AUTH_OBSERVER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a dbusauthobserver = unit
    type 'a t = 'a dbusauthobserver GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
