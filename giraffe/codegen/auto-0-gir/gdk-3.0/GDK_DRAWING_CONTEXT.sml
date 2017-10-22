signature GDK_DRAWING_CONTEXT =
  sig
    type 'a class
    type 'a window_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getCairoContext : 'a class -> Cairo.ContextRecord.t
    val getClip : 'a class -> Cairo.RegionRecord.t
    val getWindow : 'a class -> base window_class
    val isValid : 'a class -> bool
    val clipProp : ('a class, Cairo.RegionRecord.t option, Cairo.RegionRecord.t option) Property.readwrite
    val windowProp : ('a class, base window_class option, 'b window_class option) Property.readwrite
  end
