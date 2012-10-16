signature GTK_STYLE_CONTEXT =
  sig
    type 'a class_t
    type textdirection_t
    type statetype_t
    type stateflags_t
    type widgetpathrecord_t
    type junctionsides_t
    type 'a styleproviderclass_t
    type iconsetrecord_t
    type regionflags_t
    type borderrecord_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addProviderForScreen :
      'a Gdk.ScreenClass.t
       -> 'b styleproviderclass_t
       -> LargeInt.int
       -> unit
    val removeProviderForScreen :
      'a Gdk.ScreenClass.t
       -> 'b styleproviderclass_t
       -> unit
    val resetWidgets : 'a Gdk.ScreenClass.t -> unit
    val addClass :
      'a class_t
       -> string
       -> unit
    val addProvider :
      'a class_t
       -> 'b styleproviderclass_t
       -> LargeInt.int
       -> unit
    val addRegion :
      'a class_t
       -> string
       -> regionflags_t
       -> unit
    val cancelAnimations : 'a class_t -> unit
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
    val invalidate : 'a class_t -> unit
    val lookupColor :
      'a class_t
       -> string
       -> Gdk.RgbaRecord.t option
    val lookupIconSet :
      'a class_t
       -> string
       -> iconsetrecord_t
    val notifyStateChange :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> statetype_t
       -> bool
       -> unit
    val popAnimatableRegion : 'a class_t -> unit
    val pushAnimatableRegion : 'a class_t -> unit
    val removeClass :
      'a class_t
       -> string
       -> unit
    val removeProvider :
      'a class_t
       -> 'b styleproviderclass_t
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
       -> textdirection_t
       -> unit
    val setJunctionSides :
      'a class_t
       -> junctionsides_t
       -> unit
    val setPath :
      'a class_t
       -> widgetpathrecord_t
       -> unit
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t
       -> unit
    val setState :
      'a class_t
       -> stateflags_t
       -> unit
    val stateIsRunning :
      'a class_t
       -> statetype_t
       -> real option
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val directionProp : ('a class_t, textdirection_t, textdirection_t) Property.readwrite
    val screenProp : ('a class_t, base Gdk.ScreenClass.t option, 'b Gdk.ScreenClass.t option) Property.readwrite
  end
