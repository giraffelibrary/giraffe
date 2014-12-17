structure GioDBusAuthObserver :>
  GIO_D_BUS_AUTH_OBSERVER
    where type 'a class_t = 'a GioDBusAuthObserverClass.t
    where type 'a credentialsclass_t = 'a GioCredentialsClass.t
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_auth_observer_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_dbus_auth_observer_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val authorizeAuthenticatedPeer_ =
        call (load_sym libgio "g_dbus_auth_observer_authorize_authenticated_peer")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioDBusAuthObserverClass.t
    type 'a credentialsclass_t = 'a GioCredentialsClass.t
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
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
