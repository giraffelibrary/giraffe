structure GioDBusServer :>
  GIO_D_BUS_SERVER
    where type 'a class = 'a GioDBusServerClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    where type d_bus_server_flags_t = GioDBusServerFlags.t =
  struct
    val getType_ = _import "g_dbus_server_get_type" : unit -> GObjectType.C.val_;
    val newSync_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_dbus_server_new_sync" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioDBusServerFlags.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioDBusAuthObserverClass.C.notnull GioDBusAuthObserverClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioDBusServerClass.C.notnull GioDBusServerClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val getClientAddress_ = _import "g_dbus_server_get_client_address" : GioDBusServerClass.C.notnull GioDBusServerClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFlags_ = _import "g_dbus_server_get_flags" : GioDBusServerClass.C.notnull GioDBusServerClass.C.p -> GioDBusServerFlags.C.val_;
    val getGuid_ = _import "g_dbus_server_get_guid" : GioDBusServerClass.C.notnull GioDBusServerClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val isActive_ = _import "g_dbus_server_is_active" : GioDBusServerClass.C.notnull GioDBusServerClass.C.p -> FFI.Bool.C.val_;
    val start_ = _import "g_dbus_server_start" : GioDBusServerClass.C.notnull GioDBusServerClass.C.p -> unit;
    val stop_ = _import "g_dbus_server_stop" : GioDBusServerClass.C.notnull GioDBusServerClass.C.p -> unit;
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
