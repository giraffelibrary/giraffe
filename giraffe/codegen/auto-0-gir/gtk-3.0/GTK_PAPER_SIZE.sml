signature GTK_PAPER_SIZE =
  sig
    type t
    type unit_t
    val getType : unit -> GObject.Type.t
    val new : string option -> t
    val newCustom :
      string
       -> string
       -> real
       -> real
       -> unit_t
       -> t
    val newFromKeyFile :
      GLib.KeyFileRecord.t
       -> string
       -> t
    val newFromPpd :
      string
       -> string
       -> real
       -> real
       -> t
    val copy : t -> t
    val getDefaultBottomMargin :
      t
       -> unit_t
       -> real
    val getDefaultLeftMargin :
      t
       -> unit_t
       -> real
    val getDefaultRightMargin :
      t
       -> unit_t
       -> real
    val getDefaultTopMargin :
      t
       -> unit_t
       -> real
    val getDisplayName : t -> string
    val getHeight :
      t
       -> unit_t
       -> real
    val getName : t -> string
    val getPpdName : t -> string
    val getWidth :
      t
       -> unit_t
       -> real
    val isCustom : t -> bool
    val isEqual :
      t
       -> t
       -> bool
    val setSize :
      t
       -> real
       -> real
       -> unit_t
       -> unit
    val toKeyFile :
      t
       -> GLib.KeyFileRecord.t
       -> string
       -> unit
    val getDefault : unit -> string
  end
