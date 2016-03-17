signature GIO_TLS_FILE_DATABASE =
  sig
    type 'a class
    type 'a tls_database_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string -> base tls_database_class
    val anchorsProp : ('a class, string option, string option) Property.readwrite
  end
