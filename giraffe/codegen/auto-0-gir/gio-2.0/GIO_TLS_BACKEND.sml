signature GIO_TLS_BACKEND =
  sig
    type 'a class_t
    type 'a tlsdatabaseclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val getDefaultDatabase : 'a class_t -> base tlsdatabaseclass_t
    val supportsTls : 'a class_t -> bool
  end
