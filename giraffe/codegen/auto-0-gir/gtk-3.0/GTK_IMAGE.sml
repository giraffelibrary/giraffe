signature GTK_IMAGE =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type iconsetrecord_t
    type imagetype_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newFromAnimation : 'a GdkPixbuf.PixbufAnimationClass.t -> base class_t
    val newFromFile : string -> base class_t
    val newFromGicon :
      'a Gio.IconClass.t
       -> LargeInt.int
       -> base class_t
    val newFromIconName :
      string
       -> LargeInt.int
       -> base class_t
    val newFromIconSet :
      iconsetrecord_t
       -> LargeInt.int
       -> base class_t
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.t option -> base class_t
    val newFromStock :
      string
       -> LargeInt.int
       -> base class_t
    val clear : 'a class_t -> unit
    val getAnimation : 'a class_t -> base GdkPixbuf.PixbufAnimationClass.t
    val getGicon : 'a class_t -> base Gio.IconClass.t * LargeInt.int
    val getIconName : 'a class_t -> string * LargeInt.int
    val getIconSet : 'a class_t -> iconsetrecord_t * LargeInt.int
    val getPixbuf : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getPixelSize : 'a class_t -> LargeInt.int
    val getStock : 'a class_t -> string * LargeInt.int
    val getStorageType : 'a class_t -> imagetype_t
    val setFromAnimation :
      'a class_t
       -> 'b GdkPixbuf.PixbufAnimationClass.t
       -> unit
    val setFromFile :
      'a class_t
       -> string option
       -> unit
    val setFromGicon :
      'a class_t
       -> 'b Gio.IconClass.t
       -> LargeInt.int
       -> unit
    val setFromIconName :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setFromIconSet :
      'a class_t
       -> iconsetrecord_t
       -> LargeInt.int
       -> unit
    val setFromPixbuf :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t option
       -> unit
    val setFromStock :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setPixelSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val fileProp : ('a class_t, string option, string option) Property.readwrite
    val giconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val iconNameProp : ('a class_t, string option, string option) Property.readwrite
    val iconSetProp : ('a class_t, iconsetrecord_t option, iconsetrecord_t option) Property.readwrite
    val iconSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val pixbufProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val pixbufAnimationProp : ('a class_t, base GdkPixbuf.PixbufAnimationClass.t option, 'b GdkPixbuf.PixbufAnimationClass.t option) Property.readwrite
    val pixelSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val stockProp : ('a class_t, string option, string option) Property.readwrite
    val storageTypeProp : ('a class_t, imagetype_t) Property.readonly
    val useFallbackProp : ('a class_t, bool, bool) Property.readwrite
  end
