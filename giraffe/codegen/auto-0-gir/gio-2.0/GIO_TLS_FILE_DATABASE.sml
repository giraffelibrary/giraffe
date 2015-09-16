signature GIO_TLS_FILE_DATABASE =
  sig
    type 'a class_t
    type 'a tls_database_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base tls_database_class_t
    val anchorsProp : ('a class_t, string option, string option) Property.readwrite
  end
