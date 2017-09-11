signature GTK_ICON_THEME =
  sig
    type 'a class
    type icon_info_t
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
    val appendSearchPath :
      'a class
       -> string
       -> unit
    val chooseIcon :
      'a class
       -> string list
           * LargeInt.int
           * icon_lookup_flags_t
       -> icon_info_t
    val getExampleIconName : 'a class -> string
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
       -> base GdkPixbuf.PixbufClass.class
    val lookupByGicon :
      'a class
       -> 'b Gio.IconClass.class
           * LargeInt.int
           * icon_lookup_flags_t
       -> icon_info_t
    val lookupIcon :
      'a class
       -> string
           * LargeInt.int
           * icon_lookup_flags_t
       -> icon_info_t
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
