structure GioDBusAuthObserver :>
  GIO_D_BUS_AUTH_OBSERVER
    where type 'a class = 'a GioDBusAuthObserverClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
  struct
    val getType_ = _import "g_dbus_auth_observer_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_dbus_auth_observer_new" : unit -> GioDBusAuthObserverClass.FFI.non_opt GioDBusAuthObserverClass.FFI.p;
    val allowMechanism_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_auth_observer_allow_mechanism" :
              GioDBusAuthObserverClass.FFI.non_opt GioDBusAuthObserverClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val authorizeAuthenticatedPeer_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_auth_observer_authorize_authenticated_peer" :
              GioDBusAuthObserverClass.FFI.non_opt GioDBusAuthObserverClass.FFI.p
               * GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p
               * GioCredentialsClass.FFI.opt GioCredentialsClass.FFI.p
               -> GBool.FFI.val_;
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioDBusAuthObserverClass.FFI.fromPtr true) new_ ()
    fun allowMechanism self mechanism = (GioDBusAuthObserverClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) allowMechanism_ (self & mechanism)
    fun authorizeAuthenticatedPeer self (stream, credentials) =
      (
        GioDBusAuthObserverClass.FFI.withPtr
         &&&> GioIOStreamClass.FFI.withPtr
         &&&> GioCredentialsClass.FFI.withOptPtr
         ---> GBool.FFI.fromVal
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
      fun allowMechanismSig f = signal "allow-mechanism" (get 0w1 string ---> ret boolean) f
      fun authorizeAuthenticatedPeerSig f = signal "authorize-authenticated-peer" (get 0w1 GioIOStreamClass.t &&&> get 0w2 GioCredentialsClass.tOpt ---> ret boolean) (fn stream & credentials => f (stream, credentials))
    end
  end
