signature GTK_MOUNT_OPERATION =
  sig
    type 'a class_t
    type 'a windowclass_t
    val getType : unit -> GObject.Type.t
    val new : 'a windowclass_t option -> base class_t
    val getParent : 'a class_t -> base windowclass_t
    val getScreen : 'a class_t -> base Gdk.ScreenClass.t
    val isShowing : 'a class_t -> bool
    val setParent :
      'a class_t
       -> 'b windowclass_t option
       -> unit
    val setScreen :
      'a class_t
       -> 'b Gdk.ScreenClass.t
       -> unit
    val isShowingProp : ('a class_t, bool) Property.readonly
    val parentProp : ('a class_t, base windowclass_t option, 'b windowclass_t option) Property.readwrite
    val screenProp : ('a class_t, base Gdk.ScreenClass.t option, 'b Gdk.ScreenClass.t option) Property.readwrite
  end
