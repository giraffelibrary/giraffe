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
      'a menu_class
       * LargeInt.int
       * LargeInt.int
       * 'b class
       -> bool
           * LargeInt.int
           * LargeInt.int
    val getGeometry :
      'a class
       -> (base Gdk.ScreenClass.class
            * Gdk.RectangleRecord.t
            * orientation_t)
            option
    val getGicon : 'a class -> base Gio.IconClass.class option
    val getHasTooltip : 'a class -> bool
    val getIconName : 'a class -> string option
    val getPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class option
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val getSize : 'a class -> LargeInt.int
    val getStock : 'a class -> string option
    val getStorageType : 'a class -> image_type_t
    val getTitle : 'a class -> string
    val getTooltipMarkup : 'a class -> string option
    val getTooltipText : 'a class -> string option
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
    val embeddedProp : {get : 'a class -> bool}
    val fileProp :
      {
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
    val hasTooltipProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
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
    val orientationProp : {get : 'a class -> orientation_t}
    val pixbufProp :
      {
        get : 'a class -> base GdkPixbuf.PixbufClass.class option,
        set :
          'b GdkPixbuf.PixbufClass.class option
           -> 'a class
           -> unit,
        new : 'b GdkPixbuf.PixbufClass.class option -> 'a class Property.t
      }
    val screenProp :
      {
        get : 'a class -> base Gdk.ScreenClass.class option,
        set :
          'b Gdk.ScreenClass.class option
           -> 'a class
           -> unit,
        new : 'b Gdk.ScreenClass.class option -> 'a class Property.t
      }
    val sizeProp : {get : 'a class -> LargeInt.int}
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
    val titleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val tooltipMarkupProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val tooltipTextProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val visibleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
