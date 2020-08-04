structure GioTlsClientConnection :>
  GIO_TLS_CLIENT_CONNECTION
    where type 'a class = 'a GioTlsClientConnectionClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t =
  struct
    val getType_ = _import "g_tls_client_connection_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_client_connection_new" :
              GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p
               * GioSocketConnectableClass.FFI.opt GioSocketConnectableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val copySessionState_ = fn x1 & x2 => (_import "g_tls_client_connection_copy_session_state" : GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p * GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p -> unit;) (x1, x2)
    val getServerIdentity_ = _import "g_tls_client_connection_get_server_identity" : GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p -> GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p;
    val getUseSsl3_ = _import "g_tls_client_connection_get_use_ssl3" : GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p -> GBool.FFI.val_;
    val getValidationFlags_ = _import "g_tls_client_connection_get_validation_flags" : GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p -> GioTlsCertificateFlags.FFI.val_;
    val setServerIdentity_ = fn x1 & x2 => (_import "g_tls_client_connection_set_server_identity" : GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p * GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p -> unit;) (x1, x2)
    val setUseSsl3_ = fn x1 & x2 => (_import "g_tls_client_connection_set_use_ssl3" : GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setValidationFlags_ = fn x1 & x2 => (_import "g_tls_client_connection_set_validation_flags" : GioTlsClientConnectionClass.FFI.non_opt GioTlsClientConnectionClass.FFI.p * GioTlsCertificateFlags.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioTlsClientConnectionClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseIoStream, serverIdentity) =
      (
        GioIOStreamClass.FFI.withPtr false
         &&&> GioSocketConnectableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsClientConnectionClass.FFI.fromPtr true
      )
        new_
        (
          baseIoStream
           & serverIdentity
           & []
        )
    fun copySessionState self source = (GioTlsClientConnectionClass.FFI.withPtr false &&&> GioTlsClientConnectionClass.FFI.withPtr false ---> I) copySessionState_ (self & source)
    fun getServerIdentity self = (GioTlsClientConnectionClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) getServerIdentity_ self
    fun getUseSsl3 self = (GioTlsClientConnectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseSsl3_ self
    fun getValidationFlags self = (GioTlsClientConnectionClass.FFI.withPtr false ---> GioTlsCertificateFlags.FFI.fromVal) getValidationFlags_ self
    fun setServerIdentity self identity = (GioTlsClientConnectionClass.FFI.withPtr false &&&> GioSocketConnectableClass.FFI.withPtr false ---> I) setServerIdentity_ (self & identity)
    fun setUseSsl3 self useSsl3 = (GioTlsClientConnectionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseSsl3_ (self & useSsl3)
    fun setValidationFlags self flags = (GioTlsClientConnectionClass.FFI.withPtr false &&&> GioTlsCertificateFlags.FFI.withVal ---> I) setValidationFlags_ (self & flags)
    local
      open Property
    in
      val serverIdentityProp =
        {
          get = fn x => get "server-identity" GioSocketConnectableClass.tOpt x,
          set = fn x => set "server-identity" GioSocketConnectableClass.tOpt x,
          new = fn x => new "server-identity" GioSocketConnectableClass.tOpt x
        }
      val useSsl3Prop =
        {
          get = fn x => get "use-ssl3" boolean x,
          set = fn x => set "use-ssl3" boolean x,
          new = fn x => new "use-ssl3" boolean x
        }
      val validationFlagsProp =
        {
          get = fn x => get "validation-flags" GioTlsCertificateFlags.t x,
          set = fn x => set "validation-flags" GioTlsCertificateFlags.t x,
          new = fn x => new "validation-flags" GioTlsCertificateFlags.t x
        }
    end
  end
