signature GTK_PAPER_SIZE =
  sig
    type record_t
    type unit_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : string option -> record_t
    val newCustom :
      string
       -> string
       -> real
       -> real
       -> unit_t
       -> record_t
    val newFromKeyFile :
      GLib.KeyFileRecord.t
       -> string
       -> record_t
    val newFromPpd :
      string
       -> string
       -> real
       -> real
       -> record_t
    val copy : record_t -> record_t
    val getDefaultBottomMargin :
      record_t
       -> unit_t
       -> real
    val getDefaultLeftMargin :
      record_t
       -> unit_t
       -> real
    val getDefaultRightMargin :
      record_t
       -> unit_t
       -> real
    val getDefaultTopMargin :
      record_t
       -> unit_t
       -> real
    val getDisplayName : record_t -> string
    val getHeight :
      record_t
       -> unit_t
       -> real
    val getName : record_t -> string
    val getPpdName : record_t -> string
    val getWidth :
      record_t
       -> unit_t
       -> real
    val isCustom : record_t -> bool
    val isEqual :
      record_t
       -> record_t
       -> bool
    val setSize :
      record_t
       -> real
       -> real
       -> unit_t
       -> unit
    val toKeyFile :
      record_t
       -> GLib.KeyFileRecord.t
       -> string
       -> unit
    val getDefault : unit -> string
  end
