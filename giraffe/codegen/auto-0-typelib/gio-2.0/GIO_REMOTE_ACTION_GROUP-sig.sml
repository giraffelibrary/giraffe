signature GIO_REMOTE_ACTION_GROUP =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val activateActionFull :
      'a class
       -> string
           * GLib.VariantRecord.t option
           * GLib.VariantRecord.t
       -> unit
    val changeActionStateFull :
      'a class
       -> string
           * GLib.VariantRecord.t
           * GLib.VariantRecord.t
       -> unit
  end
