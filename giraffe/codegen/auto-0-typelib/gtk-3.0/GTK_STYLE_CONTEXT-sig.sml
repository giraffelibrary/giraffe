signature GTK_STYLE_CONTEXT =
  sig
    type 'a class
    type border_t
    type css_section_t
    type region_flags_t
    type icon_set_t
    type 'a style_provider_class
    type junction_sides_t
    type widget_path_t
    type state_flags_t
    type state_type_t
    type style_context_print_flags_t
    type text_direction_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addProviderForScreen :
      'a Gdk.ScreenClass.class
       * 'b style_provider_class
       * LargeInt.int
       -> unit
    val removeProviderForScreen : 'a Gdk.ScreenClass.class * 'b style_provider_class -> unit
    val resetWidgets : 'a Gdk.ScreenClass.class -> unit
    val addClass :
      'a class
       -> string
       -> unit
    val addProvider :
      'a class
       -> 'b style_provider_class * LargeInt.int
       -> unit
    val addRegion :
      'a class
       -> string * region_flags_t
       -> unit
    val getBackgroundColor :
      'a class
       -> state_flags_t
       -> Gdk.RgbaRecord.t
    val getBorder :
      'a class
       -> state_flags_t
       -> border_t
    val getBorderColor :
      'a class
       -> state_flags_t
       -> Gdk.RgbaRecord.t
    val getColor :
      'a class
       -> state_flags_t
       -> Gdk.RgbaRecord.t
    val getDirection : 'a class -> text_direction_t
    val getFont :
      'a class
       -> state_flags_t
       -> Pango.FontDescriptionRecord.t
    val getFrameClock : 'a class -> base Gdk.FrameClockClass.class option
    val getJunctionSides : 'a class -> junction_sides_t
    val getMargin :
      'a class
       -> state_flags_t
       -> border_t
    val getPadding :
      'a class
       -> state_flags_t
       -> border_t
    val getParent : 'a class -> base class option
    val getPath : 'a class -> widget_path_t
    val getScale : 'a class -> LargeInt.int
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val getSection :
      'a class
       -> string
       -> css_section_t option
    val getState : 'a class -> state_flags_t
    val getStyleProperty :
      'a class
       -> string * GObject.ValueRecord.t
       -> unit
    val hasClass :
      'a class
       -> string
       -> bool
    val hasRegion :
      'a class
       -> string
       -> region_flags_t option
    val invalidate : 'a class -> unit
    val lookupColor :
      'a class
       -> string
       -> Gdk.RgbaRecord.t option
    val lookupIconSet :
      'a class
       -> string
       -> icon_set_t option
    val popAnimatableRegion : 'a class -> unit
    val removeClass :
      'a class
       -> string
       -> unit
    val removeProvider :
      'a class
       -> 'b style_provider_class
       -> unit
    val removeRegion :
      'a class
       -> string
       -> unit
    val restore : 'a class -> unit
    val save : 'a class -> unit
    val scrollAnimations :
      'a class
       -> 'b Gdk.WindowClass.class
           * LargeInt.int
           * LargeInt.int
       -> unit
    val setBackground :
      'a class
       -> 'b Gdk.WindowClass.class
       -> unit
    val setDirection :
      'a class
       -> text_direction_t
       -> unit
    val setFrameClock :
      'a class
       -> 'b Gdk.FrameClockClass.class
       -> unit
    val setJunctionSides :
      'a class
       -> junction_sides_t
       -> unit
    val setParent :
      'a class
       -> 'b class option
       -> unit
    val setPath :
      'a class
       -> widget_path_t
       -> unit
    val setScale :
      'a class
       -> LargeInt.int
       -> unit
    val setScreen :
      'a class
       -> 'b Gdk.ScreenClass.class
       -> unit
    val setState :
      'a class
       -> state_flags_t
       -> unit
    val stateIsRunning :
      'a class
       -> state_type_t
       -> real option
    val toString :
      'a class
       -> style_context_print_flags_t
       -> string
    val changedSig : (unit -> unit) -> 'a class Signal.t
    val directionProp : ('a class, unit -> text_direction_t, text_direction_t -> unit, text_direction_t -> unit) Property.t
    val paintClockProp : ('a class, unit -> base Gdk.FrameClockClass.class option, 'b Gdk.FrameClockClass.class option -> unit, 'b Gdk.FrameClockClass.class option -> unit) Property.t
    val parentProp : ('a class, unit -> base class option, 'b class option -> unit, 'b class option -> unit) Property.t
    val screenProp : ('a class, unit -> base Gdk.ScreenClass.class option, 'b Gdk.ScreenClass.class option -> unit, 'b Gdk.ScreenClass.class option -> unit) Property.t
  end
