structure GtkGesturePan :>
  GTK_GESTURE_PAN
    where type 'a class = 'a GtkGesturePanClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type pan_direction_t = GtkPanDirection.t
    where type orientation_t = GtkOrientation.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_pan_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_gesture_pan_new") (GtkWidgetClass.PolyML.cPtr &&> GtkOrientation.PolyML.cVal --> GtkGestureClass.PolyML.cPtr)
      val getOrientation_ = call (getSymbol "gtk_gesture_pan_get_orientation") (GtkGesturePanClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val setOrientation_ = call (getSymbol "gtk_gesture_pan_set_orientation") (GtkGesturePanClass.PolyML.cPtr &&> GtkOrientation.PolyML.cVal --> cVoid)
    end
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
