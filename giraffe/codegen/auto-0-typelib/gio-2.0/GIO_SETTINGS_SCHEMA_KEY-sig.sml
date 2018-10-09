signature GIO_SETTINGS_SCHEMA_KEY =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val getDefaultValue : t -> GLib.VariantRecord.t
    val getDescription : t -> string
    val getName : t -> string
    val getRange : t -> GLib.VariantRecord.t
    val getSummary : t -> string
    val getValueType : t -> GLib.VariantTypeRecord.t
    val rangeCheck :
      t
       -> GLib.VariantRecord.t
       -> bool
  end
