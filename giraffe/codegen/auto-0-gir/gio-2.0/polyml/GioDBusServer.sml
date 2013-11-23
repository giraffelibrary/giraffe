structure GioDBusServer :>
  GIO_D_BUS_SERVER
    where type 'a class_t = 'a GioDBusServerClass.t
    where type 'a initableclass_t = 'a GioInitableClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    where type 'a dbusauthobserverclass_t = 'a GioDBusAuthObserverClass.t
    where type dbusserverflags_t = GioDBusServerFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_server_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newSync_ =
        call (load_sym libgio "g_dbus_server_new_sync")
          (
            FFI.String.PolyML.INPTR
             &&> GioDBusServerFlags.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getClientAddress_ = call (load_sym libgio "g_dbus_server_get_client_address") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getFlags_ = call (load_sym libgio "g_dbus_server_get_flags") (GObjectObjectClass.PolyML.PTR --> GioDBusServerFlags.PolyML.VAL)
      val getGuid_ = call (load_sym libgio "g_dbus_server_get_guid") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val isActive_ = call (load_sym libgio "g_dbus_server_is_active") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val start_ = call (load_sym libgio "g_dbus_server_start") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val stop_ = call (load_sym libgio "g_dbus_server_stop") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioDBusServerClass.t
    type 'a initableclass_t = 'a GioInitableClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    type 'a dbusauthobserverclass_t = 'a GioDBusAuthObserverClass.t
    type dbusserverflags_t = GioDBusServerFlags.t
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newSync address flags guid observer cancellable =
      (
        FFI.String.C.withConstPtr
         &&&> GioDBusServerFlags.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioDBusServerClass.C.fromPtr true
      )
        newSync_
        (
          address
           & flags
           & guid
           & observer
           & cancellable
           & []
        )
    fun getClientAddress self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getClientAddress_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioDBusServerFlags.C.fromVal) getFlags_ self
    fun getGuid self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getGuid_ self
    fun isActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun start self = (GObjectObjectClass.C.withPtr ---> I) start_ self
    fun stop self = (GObjectObjectClass.C.withPtr ---> I) stop_ self
    local
      open ClosureMarshal Signal
    in
      fun newConnectionSig f = signal "new-connection" (get 0w1 GioDBusConnectionClass.t ---> ret boolean) f
    end
    local
      open Property
    in
      val activeProp = {get = fn x => get "active" boolean x}
      val addressProp =
        {
          get = fn x => get "address" stringOpt x,
          set = fn x => set "address" stringOpt x
        }
      val authenticationObserverProp =
        {
          get = fn x => get "authentication-observer" GioDBusAuthObserverClass.tOpt x,
          set = fn x => set "authentication-observer" GioDBusAuthObserverClass.tOpt x
        }
      val clientAddressProp = {get = fn x => get "client-address" stringOpt x}
      val flagsProp =
        {
          get = fn x => get "flags" GioDBusServerFlags.t x,
          set = fn x => set "flags" GioDBusServerFlags.t x
        }
      val guidProp =
        {
          get = fn x => get "guid" stringOpt x,
          set = fn x => set "guid" stringOpt x
        }
    end
  end
