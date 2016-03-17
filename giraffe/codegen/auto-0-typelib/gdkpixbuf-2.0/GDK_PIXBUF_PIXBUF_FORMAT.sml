signature GDK_PIXBUF_PIXBUF_FORMAT =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val copy : t -> t
    val getDescription : t -> string
    val getLicense : t -> string
    val getName : t -> string
    val isDisabled : t -> bool
    val isScalable : t -> bool
    val isWritable : t -> bool
    val setDisabled :
      t
       -> bool
       -> unit
  end
