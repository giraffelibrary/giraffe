signature GTK_ICON_THEME =
  sig
    type 'a class
    type 'a icon_info_class
    type icon_lookup_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addBuiltinIcon :
      string
       * LargeInt.int
       * 'a GdkPixbuf.PixbufClass.class
       -> unit
    val getDefault : unit -> base class
    val getForScreen : 'a Gdk.ScreenClass.class -> base class
    val addResourcePath :
      'a class
       -> string
       -> unit
    val appendSearchPath :
      'a class
       -> string
       -> unit
    val chooseIcon :
      'a class
       -> string list
           * LargeInt.int
           * icon_lookup_flags_t
       -> base icon_info_class option
    val chooseIconForScale :
      'a class
       -> string list
           * LargeInt.int
           * LargeInt.int
           * icon_lookup_flags_t
       -> base icon_info_class option
    val getExampleIconName : 'a class -> string option
    val getIconSizes :
      'a class
       -> string
       -> LargeInt.int vector
    val getSearchPath : 'a class -> string list
    val hasIcon :
      'a class
       -> string
       -> bool
    val loadIcon :
      'a class
       -> string
           * LargeInt.int
           * icon_lookup_flags_t
       -> base GdkPixbuf.PixbufClass.class option
    val loadIconForScale :
      'a class
       -> string
           * LargeInt.int
           * LargeInt.int
           * icon_lookup_flags_t
       -> base GdkPixbuf.PixbufClass.class option
    val loadSurface :
      'a class
       -> string
           * LargeInt.int
           * LargeInt.int
           * 'b Gdk.WindowClass.class option
           * icon_lookup_flags_t
       -> Cairo.SurfaceRecord.t option
    val lookupByGicon :
      'a class
       -> 'b Gio.IconClass.class
           * LargeInt.int
           * icon_lookup_flags_t
       -> base icon_info_class option
    val lookupByGiconForScale :
      'a class
       -> 'b Gio.IconClass.class
           * LargeInt.int
           * LargeInt.int
           * icon_lookup_flags_t
       -> base icon_info_class option
    val lookupIcon :
      'a class
       -> string
           * LargeInt.int
           * icon_lookup_flags_t
       -> base icon_info_class option
    val lookupIconForScale :
      'a class
       -> string
           * LargeInt.int
           * LargeInt.int
           * icon_lookup_flags_t
       -> base icon_info_class option
    val prependSearchPath :
      'a class
       -> string
       -> unit
    val rescanIfNeeded : 'a class -> bool
    val setCustomTheme :
      'a class
       -> string option
       -> unit
    val setScreen :
      'a class
       -> 'b Gdk.ScreenClass.class
       -> unit
    val setSearchPath :
      'a class
       -> string list
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.t
  end
