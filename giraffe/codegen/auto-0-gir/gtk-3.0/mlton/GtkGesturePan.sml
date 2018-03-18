structure GtkGesturePan :>
  GTK_GESTURE_PAN
    where type 'a class = 'a GtkGesturePanClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type pan_direction_t = GtkPanDirection.t
    where type orientation_t = GtkOrientation.t =
  struct
    val getType_ = _import "gtk_gesture_pan_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_gesture_pan_new" : GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p * GtkOrientation.FFI.val_ -> GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p;) (x1, x2)
    val getOrientation_ = _import "gtk_gesture_pan_get_orientation" : GtkGesturePanClass.FFI.notnull GtkGesturePanClass.FFI.p -> GtkOrientation.FFI.val_;
    val setOrientation_ = fn x1 & x2 => (_import "gtk_gesture_pan_set_orientation" : GtkGesturePanClass.FFI.notnull GtkGesturePanClass.FFI.p * GtkOrientation.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkGesturePanClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type pan_direction_t = GtkPanDirection.t
    type orientation_t = GtkOrientation.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (widget, orientation) = (GtkWidgetClass.FFI.withPtr &&&> GtkOrientation.FFI.withVal ---> GtkGesturePanClass.FFI.fromPtr true) new_ (widget & orientation)
    fun getOrientation self = (GtkGesturePanClass.FFI.withPtr ---> GtkOrientation.FFI.fromVal) getOrientation_ self
    fun setOrientation self orientation = (GtkGesturePanClass.FFI.withPtr &&&> GtkOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
    local
      open ClosureMarshal Signal
    in
      fun panSig f = signal "pan" (get 0w1 GtkPanDirection.t &&&> get 0w2 double ---> ret_void) (fn direction & offset => f (direction, offset))
    end
    local
      open Property
    in
      val orientationProp =
        {
          get = fn x => get "orientation" GtkOrientation.t x,
          set = fn x => set "orientation" GtkOrientation.t x,
          new = fn x => new "orientation" GtkOrientation.t x
        }
    end
  end
