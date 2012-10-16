structure GioDBusAuthObserver :>
  GIO_D_BUS_AUTH_OBSERVER
    where type 'a class_t = 'a GioDBusAuthObserverClass.t
    where type 'a credentialsclass_t = 'a GioCredentialsClass.t
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t =
  struct
    val getType_ = _import "g_dbus_auth_observer_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_dbus_auth_observer_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val authorizeAuthenticatedPeer_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_auth_observer_authorize_authenticated_peer" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioDBusAuthObserverClass.t
    type 'a credentialsclass_t = 'a GioCredentialsClass.t
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioDBusAuthObserverClass.C.fromPtr true) new_ ()
    fun authorizeAuthenticatedPeer self stream credentials =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> FFI.Bool.fromVal
      )
        authorizeAuthenticatedPeer_
        (
          self
           & stream
           & credentials
        )
    local
      open ClosureMarshal Signal
    in
      fun authorizeAuthenticatedPeerSig f = signal "authorize-authenticated-peer" (get 0w1 GioIOStreamClass.t &&&> get 0w2 GioCredentialsClass.t ---> ret boolean) (fn stream & credentials => f stream credentials)
    end
  end
