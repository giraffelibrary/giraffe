signature GIO_TLS_BACKEND =
  sig
    type 'a class
    type 'a tls_database_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val getDefaultDatabase : 'a class -> base tls_database_class
    val supportsTls : 'a class -> bool
  end
