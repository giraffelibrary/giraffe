signature GIO_TLS_DATABASE =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    type tlscertificateflags_t
    type 'a tlscertificateclass_t
    type 'a socketconnectableclass_t
    type 'a tlsinteractionclass_t
    type tlsdatabaseverifyflags_t
    type 'a cancellableclass_t
    type tlsdatabaselookupflags_t
    val getType : unit -> GObject.Type.t
    val createCertificateHandle :
      'a class_t
       -> 'b tlscertificateclass_t
       -> string
    val lookupCertificateForHandle :
      'a class_t
       -> string
       -> 'b tlsinteractionclass_t option
       -> tlsdatabaselookupflags_t
       -> 'c cancellableclass_t option
       -> base tlscertificateclass_t
    val lookupCertificateForHandleFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base tlscertificateclass_t
    val lookupCertificateIssuer :
      'a class_t
       -> 'b tlscertificateclass_t
       -> 'c tlsinteractionclass_t option
       -> tlsdatabaselookupflags_t
       -> 'd cancellableclass_t option
       -> base tlscertificateclass_t
    val lookupCertificateIssuerFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base tlscertificateclass_t
    val verifyChain :
      'a class_t
       -> 'b tlscertificateclass_t
       -> string
       -> 'c socketconnectableclass_t option
       -> 'd tlsinteractionclass_t option
       -> tlsdatabaseverifyflags_t
       -> 'e cancellableclass_t option
       -> tlscertificateflags_t
    val verifyChainFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> tlscertificateflags_t
  end
