signature GTK_ICON_SET =
  sig
    type t
    type icon_source_t
    type 'a widget_class
    type state_type_t
    type text_direction_t
    type 'a style_class
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
    val renderIcon :
      t
       -> 'a style_class option
           * text_direction_t
           * state_type_t
           * LargeInt.int
           * 'b widget_class option
           * string option
       -> base GdkPixbuf.PixbufClass.class
    val renderIconPixbuf :
      t
       -> 'a style_context_class * LargeInt.int
       -> base GdkPixbuf.PixbufClass.class
    val renderIconSurface :
      t
       -> 'a style_context_class
           * LargeInt.int
           * LargeInt.int
           * 'b Gdk.WindowClass.class option
       -> Cairo.SurfaceRecord.t
  end
