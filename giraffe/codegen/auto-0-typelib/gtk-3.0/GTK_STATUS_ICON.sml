signature GTK_STATUS_ICON =
  sig
    type 'a class
    type 'a menu_class
    type 'a tooltip_class
    type orientation_t
    type image_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromFile : string -> base class
    val newFromGicon : 'a Gio.IconClass.class -> base class
    val newFromIconName : string -> base class
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.class -> base class
    val newFromStock : string -> base class
    val positionMenu :
      'a menu_class * 'b class
       -> LargeInt.int
           * LargeInt.int
           * bool
    val getGeometry :
      'a class
       -> (base Gdk.ScreenClass.class
            * Cairo.RectangleIntRecord.t
            * orientation_t)
            option
    val getGicon : 'a class -> base Gio.IconClass.class
    val getHasTooltip : 'a class -> bool
    val getIconName : 'a class -> string
    val getPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val getSize : 'a class -> LargeInt.int
    val getStock : 'a class -> string
    val getStorageType : 'a class -> image_type_t
    val getTitle : 'a class -> string
    val getTooltipMarkup : 'a class -> string
    val getTooltipText : 'a class -> string
    val getVisible : 'a class -> bool
    val getX11WindowId : 'a class -> LargeInt.int
    val isEmbedded : 'a class -> bool
    val setFromFile :
      'a class
       -> string
       -> unit
    val setFromGicon :
      'a class
       -> 'b Gio.IconClass.class
       -> unit
    val setFromIconName :
      'a class
       -> string
       -> unit
    val setFromPixbuf :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setFromStock :
      'a class
       -> string
       -> unit
    val setHasTooltip :
      'a class
       -> bool
       -> unit
    val setName :
      'a class
       -> string
       -> unit
    val setScreen :
      'a class
       -> 'b Gdk.ScreenClass.class
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setTooltipMarkup :
      'a class
       -> string option
       -> unit
    val setTooltipText :
      'a class
       -> string
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val buttonPressEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class Signal.t
    val buttonReleaseEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class Signal.t
    val popupMenuSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val queryTooltipSig :
      (LargeInt.int
        * LargeInt.int
        * bool
        * base tooltip_class
        -> bool)
       -> 'a class Signal.t
    val scrollEventSig : (Gdk.EventScrollRecord.t -> bool) -> 'a class Signal.t
    val sizeChangedSig : (LargeInt.int -> bool) -> 'a class Signal.t
    val embeddedProp : ('a class, bool) Property.readonly
    val fileProp : ('a class, string option) Property.writeonly
    val giconProp : ('a class, base Gio.IconClass.class option, 'b Gio.IconClass.class option) Property.readwrite
    val hasTooltipProp : ('a class, bool, bool) Property.readwrite
    val iconNameProp : ('a class, string option, string option) Property.readwrite
    val orientationProp : ('a class, orientation_t) Property.readonly
    val pixbufProp : ('a class, base GdkPixbuf.PixbufClass.class option, 'b GdkPixbuf.PixbufClass.class option) Property.readwrite
    val screenProp : ('a class, base Gdk.ScreenClass.class option, 'b Gdk.ScreenClass.class option) Property.readwrite
    val sizeProp : ('a class, LargeInt.int) Property.readonly
    val stockProp : ('a class, string option, string option) Property.readwrite
    val storageTypeProp : ('a class, image_type_t) Property.readonly
    val titleProp : ('a class, string option, string option) Property.readwrite
    val tooltipMarkupProp : ('a class, string option, string option) Property.readwrite
    val tooltipTextProp : ('a class, string option, string option) Property.readwrite
    val visibleProp : ('a class, bool, bool) Property.readwrite
  end
