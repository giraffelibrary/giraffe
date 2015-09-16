signature GIO_TLS_BACKEND =
  sig
    type 'a class_t
    type 'a tls_database_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val getDefaultDatabase : 'a class_t -> base tls_database_class_t
    val supportsTls : 'a class_t -> bool
  end
