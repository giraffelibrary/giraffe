signature GTK_SOURCE_GUTTER_RENDERER_PIXBUF =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getGicon : 'a class -> base Gio.IconClass.class
    val getIconName : 'a class -> string
    val getPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class
    val getStockId : 'a class -> string
    val setGicon :
      'a class
       -> 'b Gio.IconClass.class
       -> unit
    val setIconName :
      'a class
       -> string
       -> unit
    val setPixbuf :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class
       -> unit
    val setStockId :
      'a class
       -> string
       -> unit
    val giconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val iconNameProp : ('a class, string option, string option) Property.readwrite
    val pixbufProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val stockIdProp : ('a class, string option, string option) Property.readwrite
  end
