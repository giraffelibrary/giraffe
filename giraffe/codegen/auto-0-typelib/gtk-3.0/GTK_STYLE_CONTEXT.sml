signature GTK_STYLE_CONTEXT =
  sig
    type 'a class_t
    type border_record_t
    type region_flags_t
    type icon_set_record_t
    type 'a style_provider_class_t
    type junction_sides_t
    type widget_path_record_t
    type state_flags_t
    type state_type_t
    type text_direction_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addProviderForScreen :
      'a Gdk.ScreenClass.t
       -> 'b style_provider_class_t
       -> LargeInt.int
       -> unit
    val removeProviderForScreen :
      'a Gdk.ScreenClass.t
       -> 'b style_provider_class_t
       -> unit
    val resetWidgets : 'a Gdk.ScreenClass.t -> unit
    val addClass :
      'a class_t
       -> string
       -> unit
    val addProvider :
      'a class_t
       -> 'b style_provider_class_t
       -> LargeInt.int
       -> unit
    val addRegion :
      'a class_t
       -> string
       -> region_flags_t
       -> unit
    val getBackgroundColor :
      'a class_t
       -> state_flags_t
       -> Gdk.RgbaRecord.t
    val getBorder :
      'a class_t
       -> state_flags_t
       -> border_record_t
    val getBorderColor :
      'a class_t
       -> state_flags_t
       -> Gdk.RgbaRecord.t
    val getColor :
      'a class_t
       -> state_flags_t
       -> Gdk.RgbaRecord.t
    val getDirection : 'a class_t -> text_direction_t
    val getFont :
      'a class_t
       -> state_flags_t
       -> Pango.FontDescriptionRecord.t
    val getJunctionSides : 'a class_t -> junction_sides_t
    val getMargin :
      'a class_t
       -> state_flags_t
       -> border_record_t
    val getPadding :
      'a class_t
       -> state_flags_t
       -> border_record_t
    val getPath : 'a class_t -> widget_path_record_t
    val getScreen : 'a class_t -> base Gdk.ScreenClass.t
    val getState : 'a class_t -> state_flags_t
    val getStyleProperty :
      'a class_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val hasClass :
      'a class_t
       -> string
       -> bool
    val hasRegion :
      'a class_t
       -> string
       -> region_flags_t option
    val invalidate : 'a class_t -> unit
    val lookupColor :
      'a class_t
       -> string
       -> Gdk.RgbaRecord.t option
    val lookupIconSet :
      'a class_t
       -> string
       -> icon_set_record_t
    val popAnimatableRegion : 'a class_t -> unit
    val removeClass :
      'a class_t
       -> string
       -> unit
    val removeProvider :
      'a class_t
       -> 'b style_provider_class_t
       -> unit
    val removeRegion :
      'a class_t
       -> string
       -> unit
    val restore : 'a class_t -> unit
    val save : 'a class_t -> unit
    val scrollAnimations :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setBackground :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> unit
    val setDirection :
      'a class_t
       -> text_direction_t
       -> unit
    val setJunctionSides :
      'a class_t
       -> junction_sides_t
       -> unit
    val setPath :
      'a class_t
       -> widget_path_record_t
       -> unit
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t
       -> unit
    val setState :
      'a class_t
       -> state_flags_t
       -> unit
    val stateIsRunning :
      'a class_t
       -> state_type_t
       -> real option
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val directionProp : ('a class_t, text_direction_t, text_direction_t) Property.readwrite
    val screenProp : ('a class_t, base Gdk.ScreenClass.t option, 'b Gdk.ScreenClass.t option) Property.readwrite
  end
