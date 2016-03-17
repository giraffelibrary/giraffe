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
    val newFromGicon :
      'a Gio.IconClass.class
       -> LargeInt.int
       -> base class
    val newFromIconName :
      string
       -> LargeInt.int
       -> base class
    val newFromIconSet :
      icon_set_t
       -> LargeInt.int
       -> base class
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.class option -> base class
    val newFromStock :
      string
       -> LargeInt.int
       -> base class
    val clear : 'a class -> unit
    val getAnimation : 'a class -> base GdkPixbuf.PixbufAnimationClass.class
    val getGicon : 'a class -> base Gio.IconClass.class * LargeInt.int
    val getIconName : 'a class -> string * LargeInt.int
    val getIconSet : 'a class -> icon_set_t * LargeInt.int
    val getPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class
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
       -> 'b Gio.IconClass.class
       -> LargeInt.int
       -> unit
    val setFromIconName :
      'a class
       -> string
       -> LargeInt.int
       -> unit
    val setFromIconSet :
      'a class
       -> icon_set_t
       -> LargeInt.int
       -> unit
    val setFromPixbuf :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setFromStock :
      'a class
       -> string
       -> LargeInt.int
       -> unit
    val setPixelSize :
      'a class
       -> LargeInt.int
       -> unit
    val fileProp : ('a class, string option, string option) Property.readwrite
    val giconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val iconNameProp : ('a class, string option, string option) Property.readwrite
    val iconSetProp : ('a class, icon_set_t option, icon_set_t option) Property.readwrite
    val iconSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val pixbufProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val pixbufAnimationProp : ('a class, base GdkPixbuf.PixbufAnimationClass.class option, 'b GdkPixbuf.PixbufAnimationClass.class option) Property.readwrite
    val pixelSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val stockProp : ('a class, string option, string option) Property.readwrite
    val storageTypeProp : ('a class, image_type_t) Property.readonly
    val useFallbackProp : ('a class, bool, bool) Property.readwrite
  end
