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
    val isShowingProp : {get : 'a class -> bool}
    val parentProp :
      {
        get : 'a class -> base window_class option,
        set :
          'b window_class option
           -> 'a class
           -> unit,
        new : 'b window_class option -> 'a class Property.t
      }
    val screenProp :
      {
        get : 'a class -> base Gdk.ScreenClass.class option,
        set :
          'b Gdk.ScreenClass.class option
           -> 'a class
           -> unit,
        new : 'b Gdk.ScreenClass.class option -> 'a class Property.t
      }
  end
