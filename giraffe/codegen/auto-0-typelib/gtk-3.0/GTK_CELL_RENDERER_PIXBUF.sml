signature GTK_CELL_RENDERER_PIXBUF =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val followStateProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
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
    val pixbufExpanderClosedProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val pixbufExpanderOpenProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val stockDetailProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
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
    val stockSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val surfaceProp :
      {
        get : 'a class -> Cairo.SurfaceRecord.t option,
        set :
          Cairo.SurfaceRecord.t option
           -> 'a class
           -> unit,
        new : Cairo.SurfaceRecord.t option -> 'a class Property.t
      }
  end
