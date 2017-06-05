structure GioDBusAuthObserver :>
  GIO_D_BUS_AUTH_OBSERVER
    where type 'a class = 'a GioDBusAuthObserverClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_auth_observer_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_dbus_auth_observer_new") (PolyMLFFI.cVoid --> GioDBusAuthObserverClass.PolyML.cPtr)
      val authorizeAuthenticatedPeer_ =
        call (load_sym libgio "g_dbus_auth_observer_authorize_authenticated_peer")
          (
            GioDBusAuthObserverClass.PolyML.cPtr
             &&> GioIOStreamClass.PolyML.cPtr
             &&> GioCredentialsClass.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GioDBusAuthObserverClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioDBusAuthObserverClass.FFI.fromPtr true) new_ ()
    fun authorizeAuthenticatedPeer self stream credentials =
      (
        GioDBusAuthObserverClass.FFI.withPtr
         &&&> GioIOStreamClass.FFI.withPtr
         &&&> GioCredentialsClass.FFI.withPtr
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
      fun authorizeAuthenticatedPeerSig f = signal "authorize-authenticated-peer" (get 0w1 GioIOStreamClass.t &&&> get 0w2 GioCredentialsClass.t ---> ret boolean) (fn stream & credentials => f stream credentials)
    end
  end
