signature GTK_IMAGE =
  sig
    type 'a class
    type 'a buildable_class
    type icon_set_t
    type image_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromAnimation : 'a GdkPixbuf.PixbufAnimationClass.class -> base class
    val newFromFile : string -> base class
    val newFromGicon : 'a Gio.IconClass.class * LargeInt.int -> base class
    val newFromIconName : string option * LargeInt.int -> base class
    val newFromIconSet : icon_set_t * LargeInt.int -> base class
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.class option -> base class
    val newFromResource : string -> base class
    val newFromStock : string * LargeInt.int -> base class
    val newFromSurface : Cairo.SurfaceRecord.t option -> base class
    val clear : 'a class -> unit
    val getAnimation : 'a class -> base GdkPixbuf.PixbufAnimationClass.class option
    val getGicon : 'a class -> base Gio.IconClass.class * LargeInt.int
    val getIconName : 'a class -> string * LargeInt.int
    val getIconSet : 'a class -> icon_set_t * LargeInt.int
    val getPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class option
    val getPixelSize : 'a class -> LargeInt.int
    val getStock : 'a class -> string * LargeInt.int
    val getStorageType : 'a class -> image_type_t
    val setFromAnimation :
      'a class
       -> 'b GdkPixbuf.PixbufAnimationClass.class
       -> unit
    val setFromFile :
      'a class
       -> string option
       -> unit
    val setFromGicon :
      'a class
       -> 'b Gio.IconClass.class * LargeInt.int
       -> unit
    val setFromIconName :
      'a class
       -> string option * LargeInt.int
       -> unit
    val setFromIconSet :
      'a class
       -> icon_set_t * LargeInt.int
       -> unit
    val setFromPixbuf :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setFromResource :
      'a class
       -> string option
       -> unit
    val setFromStock :
      'a class
       -> string * LargeInt.int
       -> unit
    val setFromSurface :
      'a class
       -> Cairo.SurfaceRecord.t option
       -> unit
    val setPixelSize :
      'a class
       -> LargeInt.int
       -> unit
    val fileProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
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
    val iconSetProp :
      {
        get : 'a class -> icon_set_t option,
        set :
          icon_set_t option
           -> 'a class
           -> unit,
        new : icon_set_t option -> 'a class Property.t
      }
    val iconSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
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
    val pixbufAnimationProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufAnimationClass.class option,
        set :
          'b GdkPixbuf.PixbufAnimationClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufAnimationClass.class option -> 'a class Property.t
      }
    val pixelSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val resourceProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val stockProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val storageTypeProp : {get : 'a class -> image_type_t}
    val surfaceProp :
      {
        get : 'a class -> Cairo.SurfaceRecord.t option,
        set :
          Cairo.SurfaceRecord.t option
           -> 'a class
           -> unit,
        new : Cairo.SurfaceRecord.t option -> 'a class Property.t
      }
    val useFallbackProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
