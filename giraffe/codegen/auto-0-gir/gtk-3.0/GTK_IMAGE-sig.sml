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
    val fileProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val giconProp : ('a class, unit -> base Gio.IconClass.class option, 'b Gio.IconClass.class option -> unit, 'b Gio.IconClass.class option -> unit) Property.t
    val iconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val iconSetProp : ('a class, unit -> icon_set_t option, icon_set_t option -> unit, icon_set_t option -> unit) Property.t
    val iconSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val pixbufProp : ('a class, unit -> base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option -> unit, 'b GdkPixbuf.PixbufClass.class option -> unit) Property.t
    val pixbufAnimationProp : ('a class, unit -> base GdkPixbuf.PixbufAnimationClass.class option, 'b GdkPixbuf.PixbufAnimationClass.class option -> unit, 'b GdkPixbuf.PixbufAnimationClass.class option -> unit) Property.t
    val pixelSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val resourceProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val stockProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val storageTypeProp : ('a class, unit -> image_type_t, unit, unit) Property.t
    val surfaceProp : ('a class, unit -> Cairo.SurfaceRecord.t option, Cairo.SurfaceRecord.t option -> unit, Cairo.SurfaceRecord.t option -> unit) Property.t
    val useFallbackProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
