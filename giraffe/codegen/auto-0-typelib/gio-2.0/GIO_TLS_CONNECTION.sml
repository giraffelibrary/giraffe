signature GIO_TLS_CONNECTION =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    type 'a asyncresultclass_t
    type 'a iostreamclass_t
    type 'a tlsdatabaseclass_t
    type 'a tlsinteractionclass_t
    type 'a tlscertificateclass_t
    type tlscertificateflags_t
    type tlsrehandshakemode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val emitAcceptCertificate :
      'a class_t
       -> 'b tlscertificateclass_t
       -> tlscertificateflags_t
       -> bool
    val getCertificate : 'a class_t -> base tlscertificateclass_t
    val getDatabase : 'a class_t -> base tlsdatabaseclass_t
    val getInteraction : 'a class_t -> base tlsinteractionclass_t
    val getPeerCertificate : 'a class_t -> base tlscertificateclass_t
    val getPeerCertificateErrors : 'a class_t -> tlscertificateflags_t
    val getRehandshakeMode : 'a class_t -> tlsrehandshakemode_t
    val getRequireCloseNotify : 'a class_t -> bool
    val handshake :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val handshakeFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val setCertificate :
      'a class_t
       -> 'b tlscertificateclass_t
       -> unit
    val setDatabase :
      'a class_t
       -> 'b tlsdatabaseclass_t
       -> unit
    val setInteraction :
      'a class_t
       -> 'b tlsinteractionclass_t option
       -> unit
    val setRehandshakeMode :
      'a class_t
       -> tlsrehandshakemode_t
       -> unit
    val setRequireCloseNotify :
      'a class_t
       -> bool
       -> unit
    val acceptCertificateSig :
      (base tlscertificateclass_t
        -> tlscertificateflags_t
        -> bool)
       -> 'a class_t Signal.signal
    val baseIoStreamProp : ('a class_t, base iostreamclass_t option, 'b iostreamclass_t option) Property.readwrite
    val certificateProp : ('a class_t, base tlscertificateclass_t option, 'b tlscertificateclass_t option) Property.readwrite
    val databaseProp : ('a class_t, base tlsdatabaseclass_t option, 'b tlsdatabaseclass_t option) Property.readwrite
    val interactionProp : ('a class_t, base tlsinteractionclass_t option, 'b tlsinteractionclass_t option) Property.readwrite
    val peerCertificateProp : ('a class_t, base tlscertificateclass_t option) Property.readonly
    val peerCertificateErrorsProp : ('a class_t, tlscertificateflags_t) Property.readonly
    val rehandshakeModeProp : ('a class_t, tlsrehandshakemode_t, tlsrehandshakemode_t) Property.readwrite
    val requireCloseNotifyProp : ('a class_t, bool, bool) Property.readwrite
    val useSystemCertdbProp : ('a class_t, bool, bool) Property.readwrite
  end
