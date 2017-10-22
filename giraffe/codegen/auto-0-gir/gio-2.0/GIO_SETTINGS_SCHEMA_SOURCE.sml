signature GIO_SETTINGS_SCHEMA_SOURCE =
  sig
    type t
    type settings_schema_t
    val getType : unit -> GObject.Type.t
    val newFromDirectory :
      string
       * t option
       * bool
       -> t
    val listSchemas :
      t
       -> bool
       -> string list * string list
    val lookup :
      t
       -> string * bool
       -> settings_schema_t
    val getDefault : unit -> t
  end
