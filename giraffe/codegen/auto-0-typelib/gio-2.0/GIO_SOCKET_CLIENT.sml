signature GIO_SOCKET_CLIENT =
  sig
    type 'a class_t
    type 'a socket_connectable_class_t
    type 'a cancellable_class_t
    type 'a socket_connection_class_t
    type 'a async_result_class_t
    type socket_family_t
    type 'a socket_address_class_t
    type socket_protocol_t
    type tls_certificate_flags_t
    type socket_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addApplicationProxy :
      'a class_t
       -> string
       -> unit
    val connect :
      'a class_t
       -> 'b socket_connectable_class_t
       -> 'c cancellable_class_t option
       -> base socket_connection_class_t
    val connectFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base socket_connection_class_t
    val connectToHost :
      'a class_t
       -> string
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> base socket_connection_class_t
    val connectToHostFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base socket_connection_class_t
    val connectToService :
      'a class_t
       -> string
       -> string
       -> 'b cancellable_class_t option
       -> base socket_connection_class_t
    val connectToServiceFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base socket_connection_class_t
    val connectToUri :
      'a class_t
       -> string
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> base socket_connection_class_t
    val connectToUriFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base socket_connection_class_t
    val getEnableProxy : 'a class_t -> bool
    val getFamily : 'a class_t -> socket_family_t
    val getLocalAddress : 'a class_t -> base socket_address_class_t
    val getProtocol : 'a class_t -> socket_protocol_t
    val getSocketType : 'a class_t -> socket_type_t
    val getTimeout : 'a class_t -> LargeInt.int
    val getTls : 'a class_t -> bool
    val getTlsValidationFlags : 'a class_t -> tls_certificate_flags_t
    val setEnableProxy :
      'a class_t
       -> bool
       -> unit
    val setFamily :
      'a class_t
       -> socket_family_t
       -> unit
    val setLocalAddress :
      'a class_t
       -> 'b socket_address_class_t
       -> unit
    val setProtocol :
      'a class_t
       -> socket_protocol_t
       -> unit
    val setSocketType :
      'a class_t
       -> socket_type_t
       -> unit
    val setTimeout :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTls :
      'a class_t
       -> bool
       -> unit
    val setTlsValidationFlags :
      'a class_t
       -> tls_certificate_flags_t
       -> unit
    val enableProxyProp : ('a class_t, bool, bool) Property.readwrite
    val familyProp : ('a class_t, socket_family_t, socket_family_t) Property.readwrite
    val localAddressProp : ('a class_t, base socket_address_class_t option, 'b socket_address_class_t option) Property.readwrite
    val protocolProp : ('a class_t, socket_protocol_t, socket_protocol_t) Property.readwrite
    val timeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val tlsProp : ('a class_t, bool, bool) Property.readwrite
    val tlsValidationFlagsProp : ('a class_t, tls_certificate_flags_t, tls_certificate_flags_t) Property.readwrite
    val typeProp : ('a class_t, socket_type_t, socket_type_t) Property.readwrite
  end
