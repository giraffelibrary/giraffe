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
