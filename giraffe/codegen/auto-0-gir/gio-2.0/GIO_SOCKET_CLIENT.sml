signature GIO_SOCKET_CLIENT =
  sig
    type 'a class
    type 'a socket_connectable_class
    type 'a cancellable_class
    type 'a socket_connection_class
    type 'a async_result_class
    type socket_family_t
    type 'a socket_address_class
    type socket_protocol_t
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
       -> 'b socket_connectable_class
       -> 'c cancellable_class option
       -> base socket_connection_class
    val connectFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class
    val connectToHost :
      'a class
       -> string
       -> LargeInt.int
       -> 'b cancellable_class option
       -> base socket_connection_class
    val connectToHostFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class
    val connectToService :
      'a class
       -> string
       -> string
       -> 'b cancellable_class option
       -> base socket_connection_class
    val connectToServiceFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class
    val connectToUri :
      'a class
       -> string
       -> LargeInt.int
       -> 'b cancellable_class option
       -> base socket_connection_class
    val connectToUriFinish :
      'a class
       -> 'b async_result_class
       -> base socket_connection_class
    val getEnableProxy : 'a class -> bool
    val getFamily : 'a class -> socket_family_t
    val getLocalAddress : 'a class -> base socket_address_class
    val getProtocol : 'a class -> socket_protocol_t
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
       -> 'b socket_address_class
       -> unit
    val setProtocol :
      'a class
       -> socket_protocol_t
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
    val enableProxyProp : ('a class, bool, bool) Property.readwrite
    val familyProp : ('a class, socket_family_t, socket_family_t) Property.readwrite
    val localAddressProp : ('a class, base socket_address_class option, 'b socket_address_class option) Property.readwrite
    val protocolProp : ('a class, socket_protocol_t, socket_protocol_t) Property.readwrite
    val timeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val tlsProp : ('a class, bool, bool) Property.readwrite
    val tlsValidationFlagsProp : ('a class, tls_certificate_flags_t, tls_certificate_flags_t) Property.readwrite
    val typeProp : ('a class, socket_type_t, socket_type_t) Property.readwrite
  end
