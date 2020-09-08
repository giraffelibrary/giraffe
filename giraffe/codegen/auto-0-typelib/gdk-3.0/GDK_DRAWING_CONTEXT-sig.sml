signature GDK_DRAWING_CONTEXT =
  sig
    type 'a class
    type 'a window_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getCairoContext : 'a class -> Cairo.ContextRecord.t
    val getClip : 'a class -> Cairo.RegionRecord.t option
    val getWindow : 'a class -> base window_class
    val isValid : 'a class -> bool
    val clipProp : ('a class, unit -> Cairo.RegionRecord.t option, unit, Cairo.RegionRecord.t option -> unit) Property.t
    val windowProp : ('a class, unit -> base window_class option, unit, 'b window_class option -> unit) Property.t
  end
