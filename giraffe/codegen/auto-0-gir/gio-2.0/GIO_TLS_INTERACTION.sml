signature GIO_TLS_INTERACTION =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    type tlsinteractionresult_t
    type 'a cancellableclass_t
    type 'a tlspasswordclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val askPassword :
      'a class_t
       -> 'b tlspasswordclass_t
       -> 'c cancellableclass_t option
       -> tlsinteractionresult_t
    val askPasswordFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> tlsinteractionresult_t
    val invokeAskPassword :
      'a class_t
       -> 'b tlspasswordclass_t
       -> 'c cancellableclass_t option
       -> tlsinteractionresult_t
  end
