structure GioDBusServer :>
  GIO_D_BUS_SERVER
    where type 'a class_t = 'a GioDBusServerClass.t
    where type 'a initableclass_t = 'a GioInitableClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    where type 'a dbusauthobserverclass_t = 'a GioDBusAuthObserverClass.t
    where type dbusserverflags_t = GioDBusServerFlags.t =
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
              cstring
               * unit CPointer.t
               * GioDBusServerFlags.C.val_
               * cstring
               * unit CPointer.t
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
    val getClientAddress_ = _import "g_dbus_server_get_client_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getFlags_ = _import "g_dbus_server_get_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDBusServerFlags.C.val_;
    val getGuid_ = _import "g_dbus_server_get_guid" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val isActive_ = _import "g_dbus_server_is_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val start_ = _import "g_dbus_server_start" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val stop_ = _import "g_dbus_server_stop" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
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
