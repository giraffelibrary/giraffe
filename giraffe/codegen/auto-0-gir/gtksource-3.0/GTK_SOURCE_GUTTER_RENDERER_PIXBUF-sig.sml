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
       -> 'b Gio.IconClass.class option
       -> unit
    val setIconName :
      'a class
       -> string option
       -> unit
    val setPixbuf :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setStockId :
      'a class
       -> string option
       -> unit
    val giconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val iconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val pixbufProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val stockIdProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
