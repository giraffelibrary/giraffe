signature GIO_SOCKET_CLIENT =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a socket_connection_class
    type 'a async_result_class
    type 'a i_o_stream_class
    type 'a socket_connectable_class
    type socket_client_event_t
    type socket_family_t
    type 'a socket_address_class
    type socket_protocol_t
    type 'a proxy_resolver_class
    type tls_certificate_flags_t
    type socket_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addApplicationProxy :
      'a class
       -> string
       -> unit
    val connect :
      'a class
       -> 'b socket_connectable_class * 'c cancellable_class option
       -> base socket_connection_class
    val connectFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class
    val connectToHost :
      'a class
       -> string
           * LargeInt.int
           * 'b cancellable_class option
       -> base socket_connection_class
    val connectToHostFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class
    val connectToService :
      'a class
       -> string
           * string
           * 'b cancellable_class option
       -> base socket_connection_class
    val connectToServiceFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class
    val connectToUri :
      'a class
       -> string
           * LargeInt.int
           * 'b cancellable_class option
       -> base socket_connection_class
    val connectToUriFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class
    val getEnableProxy : 'a class -> bool
    val getFamily : 'a class -> socket_family_t
    val getLocalAddress : 'a class -> base socket_address_class
    val getProtocol : 'a class -> socket_protocol_t
    val getProxyResolver : 'a class -> base proxy_resolver_class
    val getSocketType : 'a class -> socket_type_t
    val getTimeout : 'a class -> LargeInt.int
    val getTls : 'a class -> bool
    val getTlsValidationFlags : 'a class -> tls_certificate_flags_t
    val setEnableProxy :
      'a class
       -> bool
       -> unit
    val setFamily :
      'a class
       -> socket_family_t
       -> unit
    val setLocalAddress :
      'a class
       -> 'b socket_address_class option
       -> unit
    val setProtocol :
      'a class
       -> socket_protocol_t
       -> unit
    val setProxyResolver :
      'a class
       -> 'b proxy_resolver_class option
       -> unit
    val setSocketType :
      'a class
       -> socket_type_t
       -> unit
    val setTimeout :
      'a class
       -> LargeInt.int
       -> unit
    val setTls :
      'a class
       -> bool
       -> unit
    val setTlsValidationFlags :
      'a class
       -> tls_certificate_flags_t
       -> unit
    val eventSig :
      (socket_client_event_t
        * base socket_connectable_class
        * base i_o_stream_class option
        -> unit)
       -> 'a class Signal.t
    val enableProxyProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val familyProp : ('a class, unit -> socket_family_t, socket_family_t -> unit, socket_family_t -> unit) Property.t
    val localAddressProp : ('a class, unit -> base socket_address_class option, 'b socket_address_class option -> unit, 'b socket_address_class option -> unit) Property.t
    val protocolProp : ('a class, unit -> socket_protocol_t, socket_protocol_t -> unit, socket_protocol_t -> unit) Property.t
    val proxyResolverProp : ('a class, unit -> base proxy_resolver_class option, 'b proxy_resolver_class option -> unit, 'b proxy_resolver_class option -> unit) Property.t
    val timeoutProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val tlsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val tlsValidationFlagsProp : ('a class, unit -> tls_certificate_flags_t, tls_certificate_flags_t -> unit, tls_certificate_flags_t -> unit) Property.t
    val typeProp : ('a class, unit -> socket_type_t, socket_type_t -> unit, socket_type_t -> unit) Property.t
  end
