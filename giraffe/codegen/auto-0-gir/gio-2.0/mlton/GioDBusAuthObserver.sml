structure GioDBusAuthObserver :>
  GIO_D_BUS_AUTH_OBSERVER
    where type 'a class = 'a GioDBusAuthObserverClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
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
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDBusAuthObserverClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioDBusAuthObserverClass.C.fromPtr true) new_ ()
    fun authorizeAuthenticatedPeer self stream credentials =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> FFI.Bool.C.fromVal
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
