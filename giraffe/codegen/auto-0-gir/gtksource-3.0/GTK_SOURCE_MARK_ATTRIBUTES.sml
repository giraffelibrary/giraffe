signature GTK_SOURCE_MARK_ATTRIBUTES =
  sig
    type 'a class
    type 'a mark_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getBackground : 'a class -> Gdk.RgbaRecord.t option
    val getGicon : 'a class -> base Gio.IconClass.class
    val getIconName : 'a class -> string
    val getPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class
    val getStockId : 'a class -> string
    val getTooltipMarkup :
      'a class
       -> 'b mark_class
       -> string
    val getTooltipText :
      'a class
       -> 'b mark_class
       -> string
    val renderIcon :
      'a class
       -> 'b Gtk.WidgetClass.class * LargeInt.int
       -> base GdkPixbuf.PixbufClass.class
    val setBackground :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
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
    val queryTooltipMarkupSig : (base mark_class -> string) -> 'a class Signal.signal
    val queryTooltipTextSig : (base mark_class -> string) -> 'a class Signal.signal
    val backgroundProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val giconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val iconNameProp : ('a class, string option, string option) Property.readwrite
    val pixbufProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val stockIdProp : ('a class, string option, string option) Property.readwrite
  end
