signature GIO_TLS_CONNECTION =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a async_result_class
    type 'a i_o_stream_class
    type 'a tls_database_class
    type 'a tls_interaction_class
    type 'a tls_certificate_class
    type tls_certificate_flags_t
    type tls_rehandshake_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val emitAcceptCertificate :
      'a class
       -> 'b tls_certificate_class * tls_certificate_flags_t
       -> bool
    val getCertificate : 'a class -> base tls_certificate_class
    val getDatabase : 'a class -> base tls_database_class
    val getInteraction : 'a class -> base tls_interaction_class
    val getPeerCertificate : 'a class -> base tls_certificate_class
    val getPeerCertificateErrors : 'a class -> tls_certificate_flags_t
    val getRehandshakeMode : 'a class -> tls_rehandshake_mode_t
    val getRequireCloseNotify : 'a class -> bool
    val getUseSystemCertdb : 'a class -> bool
    val handshake :
      'a class
       -> 'b cancellable_class option
       -> unit
    val handshakeFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val setCertificate :
      'a class
       -> 'b tls_certificate_class
       -> unit
    val setDatabase :
      'a class
       -> 'b tls_database_class
       -> unit
    val setInteraction :
      'a class
       -> 'b tls_interaction_class option
       -> unit
    val setRehandshakeMode :
      'a class
       -> tls_rehandshake_mode_t
       -> unit
    val setRequireCloseNotify :
      'a class
       -> bool
       -> unit
    val setUseSystemCertdb :
      'a class
       -> bool
       -> unit
    val acceptCertificateSig : (base tls_certificate_class * tls_certificate_flags_t -> bool) -> 'a class Signal.t
    val baseIoStreamProp :
      {
        get : 'a class -> base i_o_stream_class option,
        new : 'b i_o_stream_class option -> 'a class Property.t
      }
    val certificateProp :
      {
        get : 'a class -> base tls_certificate_class option,
        set :
          'b tls_certificate_class option
           -> 'a class
           -> unit,
        new : 'b tls_certificate_class option -> 'a class Property.t
      }
    val databaseProp :
      {
        get : 'a class -> base tls_database_class option,
        set :
          'b tls_database_class option
           -> 'a class
           -> unit,
        new : 'b tls_database_class option -> 'a class Property.t
      }
    val interactionProp :
      {
        get : 'a class -> base tls_interaction_class option,
        set :
          'b tls_interaction_class option
           -> 'a class
           -> unit,
        new : 'b tls_interaction_class option -> 'a class Property.t
      }
    val peerCertificateProp : {get : 'a class -> base tls_certificate_class option}
    val peerCertificateErrorsProp : {get : 'a class -> tls_certificate_flags_t}
    val rehandshakeModeProp :
      {
        get : 'a class -> tls_rehandshake_mode_t,
        set :
          tls_rehandshake_mode_t
           -> 'a class
           -> unit,
        new : tls_rehandshake_mode_t -> 'a class Property.t
      }
    val requireCloseNotifyProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val useSystemCertdbProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
