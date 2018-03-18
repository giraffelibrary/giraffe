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
    val clipProp :
      {
        get : 'a class -> Cairo.RegionRecord.t option,
        new : Cairo.RegionRecord.t option -> 'a class Property.t
      }
    val windowProp :
      {
        get : 'a class -> base window_class option,
        new : 'b window_class option -> 'a class Property.t
      }
  end
