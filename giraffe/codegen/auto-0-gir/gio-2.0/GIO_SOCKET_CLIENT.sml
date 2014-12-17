signature GIO_SOCKET_CLIENT =
  sig
    type 'a class_t
    type 'a socketconnectableclass_t
    type 'a cancellableclass_t
    type 'a socketconnectionclass_t
    type 'a asyncresultclass_t
    type socketfamily_t
    type 'a socketaddressclass_t
    type socketprotocol_t
    type tlscertificateflags_t
    type sockettype_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addApplicationProxy :
      'a class_t
       -> string
       -> unit
    val connect :
      'a class_t
       -> 'b socketconnectableclass_t
       -> 'c cancellableclass_t option
       -> base socketconnectionclass_t
    val connectFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base socketconnectionclass_t
    val connectToHost :
      'a class_t
       -> string
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> base socketconnectionclass_t
    val connectToHostFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base socketconnectionclass_t
    val connectToService :
      'a class_t
       -> string
       -> string
       -> 'b cancellableclass_t option
       -> base socketconnectionclass_t
    val connectToServiceFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base socketconnectionclass_t
    val connectToUri :
      'a class_t
       -> string
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> base socketconnectionclass_t
    val connectToUriFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base socketconnectionclass_t
    val getEnableProxy : 'a class_t -> bool
    val getFamily : 'a class_t -> socketfamily_t
    val getLocalAddress : 'a class_t -> base socketaddressclass_t
    val getProtocol : 'a class_t -> socketprotocol_t
    val getSocketType : 'a class_t -> sockettype_t
    val getTimeout : 'a class_t -> LargeInt.int
    val getTls : 'a class_t -> bool
    val getTlsValidationFlags : 'a class_t -> tlscertificateflags_t
    val setEnableProxy :
      'a class_t
       -> bool
       -> unit
    val setFamily :
      'a class_t
       -> socketfamily_t
       -> unit
    val setLocalAddress :
      'a class_t
       -> 'b socketaddressclass_t
       -> unit
    val setProtocol :
      'a class_t
       -> socketprotocol_t
       -> unit
    val setSocketType :
      'a class_t
       -> sockettype_t
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
       -> tlscertificateflags_t
       -> unit
    val enableProxyProp : ('a class_t, bool, bool) Property.readwrite
    val familyProp : ('a class_t, socketfamily_t, socketfamily_t) Property.readwrite
    val localAddressProp : ('a class_t, base socketaddressclass_t option, 'b socketaddressclass_t option) Property.readwrite
    val protocolProp : ('a class_t, socketprotocol_t, socketprotocol_t) Property.readwrite
    val timeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val tlsProp : ('a class_t, bool, bool) Property.readwrite
    val tlsValidationFlagsProp : ('a class_t, tlscertificateflags_t, tlscertificateflags_t) Property.readwrite
    val typeProp : ('a class_t, sockettype_t, sockettype_t) Property.readwrite
  end
