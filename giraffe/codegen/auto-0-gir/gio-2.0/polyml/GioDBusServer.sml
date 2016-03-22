structure GioDBusServer :>
  GIO_D_BUS_SERVER
    where type 'a class = 'a GioDBusServerClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    where type d_bus_server_flags_t = GioDBusServerFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_server_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val newSync_ =
        call (load_sym libgio "g_dbus_server_new_sync")
          (
            Utf8.PolyML.cInPtr
             &&> GioDBusServerFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GioDBusAuthObserverClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusServerClass.PolyML.cPtr
          )
      val getClientAddress_ = call (load_sym libgio "g_dbus_server_get_client_address") (GioDBusServerClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (load_sym libgio "g_dbus_server_get_flags") (GioDBusServerClass.PolyML.cPtr --> GioDBusServerFlags.PolyML.cVal)
      val getGuid_ = call (load_sym libgio "g_dbus_server_get_guid") (GioDBusServerClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isActive_ = call (load_sym libgio "g_dbus_server_is_active") (GioDBusServerClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val start_ = call (load_sym libgio "g_dbus_server_start") (GioDBusServerClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val stop_ = call (load_sym libgio "g_dbus_server_stop") (GioDBusServerClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioDBusServerClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    type d_bus_server_flags_t = GioDBusServerFlags.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newSync address flags guid observer cancellable =
      (
        Utf8.C.withPtr
         &&&> GioDBusServerFlags.C.withVal
         &&&> Utf8.C.withPtr
         &&&> GioDBusAuthObserverClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
    fun getClientAddress self = (GioDBusServerClass.C.withPtr ---> Utf8.C.fromPtr false) getClientAddress_ self
    fun getFlags self = (GioDBusServerClass.C.withPtr ---> GioDBusServerFlags.C.fromVal) getFlags_ self
    fun getGuid self = (GioDBusServerClass.C.withPtr ---> Utf8.C.fromPtr false) getGuid_ self
    fun isActive self = (GioDBusServerClass.C.withPtr ---> FFI.Bool.C.fromVal) isActive_ self
    fun start self = (GioDBusServerClass.C.withPtr ---> I) start_ self
    fun stop self = (GioDBusServerClass.C.withPtr ---> I) stop_ self
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
