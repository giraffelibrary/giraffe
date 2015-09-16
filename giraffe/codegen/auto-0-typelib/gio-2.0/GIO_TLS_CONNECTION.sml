signature GIO_TLS_CONNECTION =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a async_result_class_t
    type 'a i_o_stream_class_t
    type 'a tls_database_class_t
    type 'a tls_interaction_class_t
    type 'a tls_certificate_class_t
    type tls_certificate_flags_t
    type tls_rehandshake_mode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val emitAcceptCertificate :
      'a class_t
       -> 'b tls_certificate_class_t
       -> tls_certificate_flags_t
       -> bool
    val getCertificate : 'a class_t -> base tls_certificate_class_t
    val getDatabase : 'a class_t -> base tls_database_class_t
    val getInteraction : 'a class_t -> base tls_interaction_class_t
    val getPeerCertificate : 'a class_t -> base tls_certificate_class_t
    val getPeerCertificateErrors : 'a class_t -> tls_certificate_flags_t
    val getRehandshakeMode : 'a class_t -> tls_rehandshake_mode_t
    val getRequireCloseNotify : 'a class_t -> bool
    val handshake :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val handshakeFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val setCertificate :
      'a class_t
       -> 'b tls_certificate_class_t
       -> unit
    val setDatabase :
      'a class_t
       -> 'b tls_database_class_t
       -> unit
    val setInteraction :
      'a class_t
       -> 'b tls_interaction_class_t option
       -> unit
    val setRehandshakeMode :
      'a class_t
       -> tls_rehandshake_mode_t
       -> unit
    val setRequireCloseNotify :
      'a class_t
       -> bool
       -> unit
    val acceptCertificateSig :
      (base tls_certificate_class_t
        -> tls_certificate_flags_t
        -> bool)
       -> 'a class_t Signal.signal
    val baseIoStreamProp : ('a class_t, base i_o_stream_class_t option, 'b i_o_stream_class_t option) Property.readwrite
    val certificateProp : ('a class_t, base tls_certificate_class_t option, 'b tls_certificate_class_t option) Property.readwrite
    val databaseProp : ('a class_t, base tls_database_class_t option, 'b tls_database_class_t option) Property.readwrite
    val interactionProp : ('a class_t, base tls_interaction_class_t option, 'b tls_interaction_class_t option) Property.readwrite
    val peerCertificateProp : ('a class_t, base tls_certificate_class_t option) Property.readonly
    val peerCertificateErrorsProp : ('a class_t, tls_certificate_flags_t) Property.readonly
    val rehandshakeModeProp : ('a class_t, tls_rehandshake_mode_t, tls_rehandshake_mode_t) Property.readwrite
    val requireCloseNotifyProp : ('a class_t, bool, bool) Property.readwrite
    val useSystemCertdbProp : ('a class_t, bool, bool) Property.readwrite
  end
