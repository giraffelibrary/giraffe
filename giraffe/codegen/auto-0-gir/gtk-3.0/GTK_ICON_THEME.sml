signature GTK_ICON_THEME =
  sig
    type 'a class_t
    type icon_info_record_t
    type icon_lookup_flags_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addBuiltinIcon :
      string
       -> LargeInt.int
       -> 'a GdkPixbuf.PixbufClass.t
       -> unit
    val getDefault : unit -> base class_t
    val getForScreen : 'a Gdk.ScreenClass.t -> base class_t
    val appendSearchPath :
      'a class_t
       -> string
       -> unit
    val getExampleIconName : 'a class_t -> string
    val hasIcon :
      'a class_t
       -> string
       -> bool
    val loadIcon :
      'a class_t
       -> string
       -> LargeInt.int
       -> icon_lookup_flags_t
       -> base GdkPixbuf.PixbufClass.t
    val lookupByGicon :
      'a class_t
       -> 'b Gio.IconClass.t
       -> LargeInt.int
       -> icon_lookup_flags_t
       -> icon_info_record_t
    val lookupIcon :
      'a class_t
       -> string
       -> LargeInt.int
       -> icon_lookup_flags_t
       -> icon_info_record_t
    val prependSearchPath :
      'a class_t
       -> string
       -> unit
    val rescanIfNeeded : 'a class_t -> bool
    val setCustomTheme :
      'a class_t
       -> string option
       -> unit
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t
       -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
