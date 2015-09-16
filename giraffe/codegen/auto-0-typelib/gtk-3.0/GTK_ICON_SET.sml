signature GTK_ICON_SET =
  sig
    type record_t
    type icon_source_record_t
    type 'a style_context_class_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.t -> record_t
    val addSource :
      record_t
       -> icon_source_record_t
       -> unit
    val copy : record_t -> record_t
    val renderIconPixbuf :
      record_t
       -> 'a style_context_class_t
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.t
  end
