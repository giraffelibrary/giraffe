signature GDK_SCREEN =
  sig
    type 'a class_t
    type 'a displayclass_t
    type rectanglerecord_t
    type 'a windowclass_t
    type 'a visualclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class_t
    val height : unit -> LargeInt.int
    val heightMm : unit -> LargeInt.int
    val width : unit -> LargeInt.int
    val widthMm : unit -> LargeInt.int
    val getActiveWindow : 'a class_t -> base windowclass_t
    val getDisplay : 'a class_t -> base displayclass_t
    val getFontOptions : 'a class_t -> Cairo.FontOptionsRecord.t
    val getHeight : 'a class_t -> LargeInt.int
    val getHeightMm : 'a class_t -> LargeInt.int
    val getMonitorAtPoint :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val getMonitorAtWindow :
      'a class_t
       -> 'b windowclass_t
       -> LargeInt.int
    val getMonitorGeometry :
      'a class_t
       -> LargeInt.int
       -> rectanglerecord_t
    val getMonitorHeightMm :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getMonitorPlugName :
      'a class_t
       -> LargeInt.int
       -> string
    val getMonitorWidthMm :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getNMonitors : 'a class_t -> LargeInt.int
    val getNumber : 'a class_t -> LargeInt.int
    val getPrimaryMonitor : 'a class_t -> LargeInt.int
    val getResolution : 'a class_t -> real
    val getRgbaVisual : 'a class_t -> base visualclass_t
    val getRootWindow : 'a class_t -> base windowclass_t
    val getSetting :
      'a class_t
       -> string
       -> GObject.ValueRecord.t
       -> bool
    val getSystemVisual : 'a class_t -> base visualclass_t
    val getWidth : 'a class_t -> LargeInt.int
    val getWidthMm : 'a class_t -> LargeInt.int
    val isComposited : 'a class_t -> bool
    val makeDisplayName : 'a class_t -> string
    val setFontOptions :
      'a class_t
       -> Cairo.FontOptionsRecord.t option
       -> unit
    val setResolution :
      'a class_t
       -> real
       -> unit
    val compositedChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val monitorsChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val sizeChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val resolutionProp : ('a class_t, real, real) Property.readwrite
  end
