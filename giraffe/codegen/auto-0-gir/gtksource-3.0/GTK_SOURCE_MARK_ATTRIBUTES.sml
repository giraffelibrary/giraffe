signature GTK_SOURCE_MARK_ATTRIBUTES =
  sig
    type 'a class_t
    type 'a mark_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getBackground : 'a class_t -> Gdk.RgbaRecord.t option
    val getGicon : 'a class_t -> base Gio.IconClass.t
    val getIconName : 'a class_t -> string
    val getPixbuf : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getStockId : 'a class_t -> string
    val getTooltipMarkup :
      'a class_t
       -> 'b mark_class_t
       -> string
    val getTooltipText :
      'a class_t
       -> 'b mark_class_t
       -> string
    val renderIcon :
      'a class_t
       -> 'b Gtk.WidgetClass.t
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.t
    val setBackground :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
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
    val queryTooltipMarkupSig : (base mark_class_t -> string) -> 'a class_t Signal.signal
    val queryTooltipTextSig : (base mark_class_t -> string) -> 'a class_t Signal.signal
    val backgroundProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val giconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val iconNameProp : ('a class_t, string option, string option) Property.readwrite
    val pixbufProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val stockIdProp : ('a class_t, string option, string option) Property.readwrite
  end
