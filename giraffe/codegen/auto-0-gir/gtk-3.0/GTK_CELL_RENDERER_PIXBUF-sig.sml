signature GTK_CELL_RENDERER_PIXBUF =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val followStateProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val giconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val iconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val pixbufProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val pixbufExpanderClosedProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val pixbufExpanderOpenProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val stockDetailProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val stockIdProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val stockSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val surfaceProp : ('a class, unit -> Cairo.SurfaceRecord.t option, Cairo.SurfaceRecord.t option -> unit, Cairo.SurfaceRecord.t option -> unit) Property.t
  end
