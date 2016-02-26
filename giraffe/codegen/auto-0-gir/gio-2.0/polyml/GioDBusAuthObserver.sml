structure GioDBusAuthObserver :>
  GIO_D_BUS_AUTH_OBSERVER
    where type 'a class_t = 'a GioDBusAuthObserverClass.t
    where type 'a credentials_class_t = 'a GioCredentialsClass.t
    where type 'a i_o_stream_class_t = 'a GioIOStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_auth_observer_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_dbus_auth_observer_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val authorizeAuthenticatedPeer_ =
        call (load_sym libgio "g_dbus_auth_observer_authorize_authenticated_peer")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class_t = 'a GioDBusAuthObserverClass.t
    type 'a credentials_class_t = 'a GioCredentialsClass.t
    type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    type t = base class_t
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
