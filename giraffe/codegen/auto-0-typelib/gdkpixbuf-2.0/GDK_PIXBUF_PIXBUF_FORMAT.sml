signature GDK_PIXBUF_PIXBUF_FORMAT =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val copy : record_t -> record_t
    val getDescription : record_t -> string
    val getLicense : record_t -> string
    val getName : record_t -> string
    val isDisabled : record_t -> bool
    val isScalable : record_t -> bool
    val isWritable : record_t -> bool
    val setDisabled :
      record_t
       -> bool
       -> unit
  end
