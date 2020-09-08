signature GDK_SCREEN =
  sig
    type 'a class
    type 'a display_class
    type rectangle_t
    type 'a window_class
    type 'a visual_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class option
    val height : unit -> LargeInt.int
    val heightMm : unit -> LargeInt.int
    val width : unit -> LargeInt.int
    val widthMm : unit -> LargeInt.int
    val getActiveWindow : 'a class -> base window_class option
    val getDisplay : 'a class -> base display_class
    val getFontOptions : 'a class -> Cairo.FontOptionsRecord.t option
    val getHeight : 'a class -> LargeInt.int
    val getHeightMm : 'a class -> LargeInt.int
    val getMonitorAtPoint :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val getMonitorAtWindow :
      'a class
       -> 'b window_class
       -> LargeInt.int
    val getMonitorGeometry :
      'a class
       -> LargeInt.int
       -> rectangle_t
    val getMonitorHeightMm :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getMonitorPlugName :
      'a class
       -> LargeInt.int
       -> string option
    val getMonitorScaleFactor :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getMonitorWidthMm :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getMonitorWorkarea :
      'a class
       -> LargeInt.int
       -> rectangle_t
    val getNMonitors : 'a class -> LargeInt.int
    val getNumber : 'a class -> LargeInt.int
    val getPrimaryMonitor : 'a class -> LargeInt.int
    val getResolution : 'a class -> real
    val getRgbaVisual : 'a class -> base visual_class option
    val getRootWindow : 'a class -> base window_class
    val getSetting :
      'a class
       -> string * GObject.ValueRecord.t
       -> bool
    val getSystemVisual : 'a class -> base visual_class
    val getWidth : 'a class -> LargeInt.int
    val getWidthMm : 'a class -> LargeInt.int
    val isComposited : 'a class -> bool
    val makeDisplayName : 'a class -> string
    val setFontOptions :
      'a class
       -> Cairo.FontOptionsRecord.t option
       -> unit
    val setResolution :
      'a class
       -> real
       -> unit
    val compositedChangedSig : (unit -> unit) -> 'a class Signal.t
    val monitorsChangedSig : (unit -> unit) -> 'a class Signal.t
    val sizeChangedSig : (unit -> unit) -> 'a class Signal.t
    val resolutionProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
  end
