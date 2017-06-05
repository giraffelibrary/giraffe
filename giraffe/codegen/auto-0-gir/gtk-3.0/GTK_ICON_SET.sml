signature GTK_ICON_SET =
  sig
    type t
    type icon_source_t
    type 'a style_context_class
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.class -> t
    val addSource :
      t
       -> icon_source_t
       -> unit
    val copy : t -> t
    val getSizes : t -> LargeInt.int vector
    val renderIconPixbuf :
      t
       -> 'a style_context_class
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.class
  end
