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
    val queryTooltipMarkupSig : (base mark_class -> string) -> 'a class Signal.t
    val queryTooltipTextSig : (base mark_class -> string) -> 'a class Signal.t
    val backgroundProp :
      {
        get : 'a class -> Gdk.RgbaRecord.t option,
        set :
          Gdk.RgbaRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.RgbaRecord.t option -> 'a class Property.t
      }
    val giconProp :
      {
        get : 'a class -> base Gio.IconClass.class option,
        set :
          'b Gio.IconClass.class option
           -> 'a class
           -> unit,
        new : 'b Gio.IconClass.class option -> 'a class Property.t
      }
    val iconNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val pixbufProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val stockIdProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
