signature GTK_MOUNT_OPERATION =
  sig
    type 'a class
    type 'a window_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a window_class option -> base class
    val getParent : 'a class -> base window_class
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val isShowing : 'a class -> bool
    val setParent :
      'a class
       -> 'b window_class option
       -> unit
    val setScreen :
      'a class
       -> 'b Gdk.ScreenClass.class
       -> unit
    val isShowingProp : ('a class, unit -> bool, unit, unit) Property.t
    val parentProp : ('a class, unit -> base window_class option, 'b window_class option -> unit, 'b window_class option -> unit) Property.t
    val screenProp : ('a class, unit -> base Gdk.ScreenClass.class option, 'b Gdk.ScreenClass.class option -> unit, 'b Gdk.ScreenClass.class option -> unit) Property.t
  end
