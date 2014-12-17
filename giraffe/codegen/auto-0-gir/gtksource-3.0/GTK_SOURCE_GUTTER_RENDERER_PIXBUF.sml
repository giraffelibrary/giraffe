signature GTK_SOURCE_GUTTER_RENDERER_PIXBUF =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getGicon : 'a class_t -> base Gio.IconClass.t
    val getIconName : 'a class_t -> string
    val getPixbuf : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getStockId : 'a class_t -> string
    val setGicon :
      'a class_t
       -> 'b Gio.IconClass.t
       -> unit
    val setIconName :
      'a class_t
       -> string
       -> unit
    val setPixbuf :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t
       -> unit
    val setStockId :
      'a class_t
       -> string
       -> unit
    val giconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val iconNameProp : ('a class_t, string option, string option) Property.readwrite
    val pixbufProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val stockIdProp : ('a class_t, string option, string option) Property.readwrite
  end
