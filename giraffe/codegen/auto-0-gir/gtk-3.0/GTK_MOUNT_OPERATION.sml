signature GTK_MOUNT_OPERATION =
  sig
    type 'a class_t
    type 'a window_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : 'a window_class_t option -> base class_t
    val getParent : 'a class_t -> base window_class_t
    val getScreen : 'a class_t -> base Gdk.ScreenClass.t
    val isShowing : 'a class_t -> bool
    val setParent :
      'a class_t
       -> 'b window_class_t option
       -> unit
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t
       -> unit
    val isShowingProp : ('a class_t, bool) Property.readonly
    val parentProp : ('a class_t, base window_class_t option, 'b window_class_t option) Property.readwrite
    val screenProp : ('a class_t, base Gdk.ScreenClass.t option, 'b Gdk.ScreenClass.t option) Property.readwrite
  end
