signature GTK_THEMING_ENGINE =
  sig
    type 'a class_t
    type textdirection_t
    type junctionsides_t
    type borderrecord_t
    type widgetpathrecord_t
    type stateflags_t
    type regionflags_t
    type statetype_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val load : string -> base class_t
    val getBackgroundColor :
      'a class_t
       -> stateflags_t
       -> Gdk.RgbaRecord.t
    val getBorder :
      'a class_t
       -> stateflags_t
       -> borderrecord_t
    val getBorderColor :
      'a class_t
       -> stateflags_t
       -> Gdk.RgbaRecord.t
    val getColor :
      'a class_t
       -> stateflags_t
       -> Gdk.RgbaRecord.t
    val getDirection : 'a class_t -> textdirection_t
    val getFont :
      'a class_t
       -> stateflags_t
       -> Pango.FontDescriptionRecord.t
    val getJunctionSides : 'a class_t -> junctionsides_t
    val getMargin :
      'a class_t
       -> stateflags_t
       -> borderrecord_t
    val getPadding :
      'a class_t
       -> stateflags_t
       -> borderrecord_t
    val getPath : 'a class_t -> widgetpathrecord_t
    val getScreen : 'a class_t -> base Gdk.ScreenClass.t
    val getState : 'a class_t -> stateflags_t
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
       -> regionflags_t option
    val lookupColor :
      'a class_t
       -> string
       -> Gdk.RgbaRecord.t option
    val stateIsRunning :
      'a class_t
       -> statetype_t
       -> real option
    val nameProp : ('a class_t, string option, string option) Property.readwrite
  end
