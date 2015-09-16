signature GTK_STATUS_ICON =
  sig
    type 'a class_t
    type 'a menu_class_t
    type 'a tooltip_class_t
    type orientation_t
    type image_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newFromFile : string -> base class_t
    val newFromGicon : 'a Gio.IconClass.t -> base class_t
    val newFromIconName : string -> base class_t
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.t -> base class_t
    val newFromStock : string -> base class_t
    val positionMenu :
      'a menu_class_t
       -> 'b class_t
       -> LargeInt.int
           * LargeInt.int
           * bool
    val getGeometry :
      'a class_t
       -> (base Gdk.ScreenClass.t
            * Cairo.RectangleIntRecord.t
            * orientation_t)
            option
    val getGicon : 'a class_t -> base Gio.IconClass.t
    val getHasTooltip : 'a class_t -> bool
    val getIconName : 'a class_t -> string
    val getPixbuf : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val getScreen : 'a class_t -> base Gdk.ScreenClass.t
    val getSize : 'a class_t -> LargeInt.int
    val getStock : 'a class_t -> string
    val getStorageType : 'a class_t -> image_type_t
    val getTitle : 'a class_t -> string
    val getTooltipMarkup : 'a class_t -> string
    val getTooltipText : 'a class_t -> string
    val getVisible : 'a class_t -> bool
    val getX11WindowId : 'a class_t -> LargeInt.int
    val isEmbedded : 'a class_t -> bool
    val setFromFile :
      'a class_t
       -> string
       -> unit
    val setFromGicon :
      'a class_t
       -> 'b Gio.IconClass.t
       -> unit
    val setFromIconName :
      'a class_t
       -> string
       -> unit
    val setFromPixbuf :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t option
       -> unit
    val setFromStock :
      'a class_t
       -> string
       -> unit
    val setHasTooltip :
      'a class_t
       -> bool
       -> unit
    val setName :
      'a class_t
       -> string
       -> unit
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val setTooltipMarkup :
      'a class_t
       -> string option
       -> unit
    val setTooltipText :
      'a class_t
       -> string
       -> unit
    val setVisible :
      'a class_t
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val buttonPressEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class_t Signal.signal
    val buttonReleaseEventSig : (Gdk.EventButtonRecord.t -> bool) -> 'a class_t Signal.signal
    val popupMenuSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val queryTooltipSig :
      (LargeInt.int
        -> LargeInt.int
        -> bool
        -> base tooltip_class_t
        -> bool)
       -> 'a class_t Signal.signal
    val scrollEventSig : (Gdk.EventScrollRecord.t -> bool) -> 'a class_t Signal.signal
    val sizeChangedSig : (LargeInt.int -> bool) -> 'a class_t Signal.signal
    val embeddedProp : ('a class_t, bool) Property.readonly
    val fileProp : ('a class_t, string option) Property.writeonly
    val giconProp : ('a class_t, base Gio.IconClass.t option, 'b Gio.IconClass.t option) Property.readwrite
    val hasTooltipProp : ('a class_t, bool, bool) Property.readwrite
    val iconNameProp : ('a class_t, string option, string option) Property.readwrite
    val orientationProp : ('a class_t, orientation_t) Property.readonly
    val pixbufProp : ('a class_t, base GdkPixbuf.PixbufClass.t option, 'b GdkPixbuf.PixbufClass.t option) Property.readwrite
    val screenProp : ('a class_t, base Gdk.ScreenClass.t option, 'b Gdk.ScreenClass.t option) Property.readwrite
    val sizeProp : ('a class_t, LargeInt.int) Property.readonly
    val stockProp : ('a class_t, string option, string option) Property.readwrite
    val storageTypeProp : ('a class_t, image_type_t) Property.readonly
    val titleProp : ('a class_t, string option, string option) Property.readwrite
    val tooltipMarkupProp : ('a class_t, string option, string option) Property.readwrite
    val tooltipTextProp : ('a class_t, string option, string option) Property.readwrite
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
  end
