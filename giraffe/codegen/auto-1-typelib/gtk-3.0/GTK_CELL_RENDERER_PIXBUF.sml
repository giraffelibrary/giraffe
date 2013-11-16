signature GTK_CELL_RENDERER_PIXBUF =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val followStateProp : ('a class_t, bool, bool) Property.readwrite
    val giconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val iconNameProp : ('a class_t, string option, string option) Property.readwrite
    val pixbufProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val pixbufExpanderClosedProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val pixbufExpanderOpenProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val stockDetailProp : ('a class_t, string option, string option) Property.readwrite
    val stockIdProp : ('a class_t, string option, string option) Property.readwrite
    val stockSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
