signature GTK_THEMING_ENGINE =
  sig
    type 'a class
    type text_direction_t
    type junction_sides_t
    type border_t
    type widget_path_t
    type state_flags_t
    type region_flags_t
    type state_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val load : string -> base class option
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
    val getJunctionSides : 'a class -> junction_sides_t
    val getMargin :
      'a class
       -> state_flags_t
       -> border_t
    val getPadding :
      'a class
       -> state_flags_t
       -> border_t
    val getPath : 'a class -> widget_path_t
    val getScreen : 'a class -> base Gdk.ScreenClass.class option
    val getState : 'a class -> state_flags_t
    val getStyleProperty :
      'a class
       -> string
       -> GObject.ValueRecord.t
    val hasClass :
      'a class
       -> string
       -> bool
    val hasRegion :
      'a class
       -> string
       -> region_flags_t option
    val lookupColor :
      'a class
       -> string
       -> Gdk.RgbaRecord.t option
    val stateIsRunning :
      'a class
       -> state_type_t
       -> real option
    val nameProp : ('a class, string option, string option) Property.readwrite
  end
