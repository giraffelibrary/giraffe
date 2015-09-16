signature GTK_THEMING_ENGINE =
  sig
    type 'a class_t
    type text_direction_t
    type junction_sides_t
    type border_record_t
    type widget_path_record_t
    type state_flags_t
    type region_flags_t
    type state_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val load : string -> base class_t
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
    val lookupColor :
      'a class_t
       -> string
       -> Gdk.RgbaRecord.t option
    val stateIsRunning :
      'a class_t
       -> state_type_t
       -> real option
    val nameProp : ('a class_t, string option, string option) Property.readwrite
  end
