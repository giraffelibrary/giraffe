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
      val getType_ = call (getSymbol "g_dbus_server_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newSync_ =
        call (getSymbol "g_dbus_server_new_sync")
          (
            Utf8.PolyML.cInPtr
             &&> GioDBusServerFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GioDBusAuthObserverClass.PolyML.cOptPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusServerClass.PolyML.cPtr
          )
      val getClientAddress_ = call (getSymbol "g_dbus_server_get_client_address") (GioDBusServerClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (getSymbol "g_dbus_server_get_flags") (GioDBusServerClass.PolyML.cPtr --> GioDBusServerFlags.PolyML.cVal)
      val getGuid_ = call (getSymbol "g_dbus_server_get_guid") (GioDBusServerClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isActive_ = call (getSymbol "g_dbus_server_is_active") (GioDBusServerClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val start_ = call (getSymbol "g_dbus_server_start") (GioDBusServerClass.PolyML.cPtr --> cVoid)
      val stop_ = call (getSymbol "g_dbus_server_stop") (GioDBusServerClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioDBusServerClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    type d_bus_server_flags_t = GioDBusServerFlags.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newSync
      (
        address,
        flags,
        guid,
        observer,
        cancellable
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GioDBusServerFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GioDBusAuthObserverClass.FFI.withOptPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioDBusServerClass.FFI.fromPtr true
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
    fun getClientAddress self = (GioDBusServerClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getClientAddress_ self
    fun getFlags self = (GioDBusServerClass.FFI.withPtr false ---> GioDBusServerFlags.FFI.fromVal) getFlags_ self
    fun getGuid self = (GioDBusServerClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getGuid_ self
    fun isActive self = (GioDBusServerClass.FFI.withPtr false ---> GBool.FFI.fromVal) isActive_ self
    fun start self = (GioDBusServerClass.FFI.withPtr false ---> I) start_ self
    fun stop self = (GioDBusServerClass.FFI.withPtr false ---> I) stop_ self
    local
      open ClosureMarshal Signal
    in
      fun newConnectionSig f = signal "new-connection" (get 0w1 GioDBusConnectionClass.t ---> ret boolean) f
    end
    local
      open ValueAccessor
    in
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val addressProp =
        {
          name = "address",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val authenticationObserverProp =
        {
          name = "authentication-observer",
          gtype = fn () => C.gtype GioDBusAuthObserverClass.tOpt (),
          get = fn x => fn () => C.get GioDBusAuthObserverClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioDBusAuthObserverClass.tOpt x
        }
      val clientAddressProp =
        {
          name = "client-address",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GioDBusServerFlags.t (),
          get = fn x => fn () => C.get GioDBusServerFlags.t x,
          set = ignore,
          init = fn x => C.set GioDBusServerFlags.t x
        }
      val guidProp =
        {
          name = "guid",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
