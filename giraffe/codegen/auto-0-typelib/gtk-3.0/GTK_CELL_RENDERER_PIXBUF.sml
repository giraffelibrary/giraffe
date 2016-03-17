signature GTK_CELL_RENDERER_PIXBUF =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val followStateProp : ('a class, bool, bool) Property.readwrite
    val giconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val iconNameProp : ('a class, string option, string option) Property.readwrite
    val pixbufProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val pixbufExpanderClosedProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val pixbufExpanderOpenProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val stockDetailProp : ('a class, string option, string option) Property.readwrite
    val stockIdProp : ('a class, string option, string option) Property.readwrite
    val stockSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
