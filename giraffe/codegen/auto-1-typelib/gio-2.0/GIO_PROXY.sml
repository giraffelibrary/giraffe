signature GIO_PROXY =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    type 'a iostreamclass_t
    type 'a proxyaddressclass_t
    type 'a cancellableclass_t
    val getType : unit -> GObject.Type.t
    val getDefaultForProtocol : string -> base class_t
    val connect :
      'a class_t
       -> 'b iostreamclass_t
       -> 'c proxyaddressclass_t
       -> 'd cancellableclass_t option
       -> base iostreamclass_t
    val connectFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base iostreamclass_t
    val supportsHostname : 'a class_t -> bool
  end
