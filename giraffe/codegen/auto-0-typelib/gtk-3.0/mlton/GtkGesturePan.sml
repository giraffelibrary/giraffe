structure GtkGesturePan :>
  GTK_GESTURE_PAN
    where type 'a class = 'a GtkGesturePanClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type pan_direction_t = GtkPanDirection.t
    where type orientation_t = GtkOrientation.t =
  struct
    val getType_ = _import "gtk_gesture_pan_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_gesture_pan_new" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkOrientation.FFI.val_ -> GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p;) (x1, x2)
    val getOrientation_ = _import "gtk_gesture_pan_get_orientation" : GtkGesturePanClass.FFI.non_opt GtkGesturePanClass.FFI.p -> GtkOrientation.FFI.val_;
    val setOrientation_ = fn x1 & x2 => (_import "gtk_gesture_pan_set_orientation" : GtkGesturePanClass.FFI.non_opt GtkGesturePanClass.FFI.p * GtkOrientation.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkGesturePanClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type pan_direction_t = GtkPanDirection.t
    type orientation_t = GtkOrientation.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (widget, orientation) = (GtkWidgetClass.FFI.withPtr false &&&> GtkOrientation.FFI.withVal ---> GtkGesturePanClass.FFI.fromPtr true) new_ (widget & orientation)
    fun getOrientation self = (GtkGesturePanClass.FFI.withPtr false ---> GtkOrientation.FFI.fromVal) getOrientation_ self
    fun setOrientation self orientation = (GtkGesturePanClass.FFI.withPtr false &&&> GtkOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
    local
      open ClosureMarshal Signal
    in
      fun panSig f = signal "pan" (get 0w1 GtkPanDirection.t &&&> get 0w2 double ---> ret_void) (fn direction & offset => f (direction, offset))
    end
    local
      open ValueAccessor
    in
      val orientationProp =
        {
          name = "orientation",
          gtype = fn () => C.gtype GtkOrientation.t (),
          get = fn x => fn () => C.get GtkOrientation.t x,
          set = fn x => C.set GtkOrientation.t x,
          init = fn x => C.set GtkOrientation.t x
        }
    end
  end
