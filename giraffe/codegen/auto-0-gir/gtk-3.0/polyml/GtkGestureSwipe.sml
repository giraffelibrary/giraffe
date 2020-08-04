structure GtkGestureSwipe :>
  GTK_GESTURE_SWIPE
    where type 'a class = 'a GtkGestureSwipeClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_swipe_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_gesture_swipe_new") (GtkWidgetClass.PolyML.cPtr --> GtkGestureClass.PolyML.cPtr)
      val getVelocity_ =
        call (getSymbol "gtk_gesture_swipe_get_velocity")
          (
            GtkGestureSwipeClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkGestureSwipeClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr false ---> GtkGestureSwipeClass.FFI.fromPtr true) new_ widget
    fun getVelocity self =
      let
        val velocityX
         & velocityY
         & retVal =
          (
            GtkGestureSwipeClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getVelocity_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        if retVal then SOME (velocityX, velocityY) else NONE
      end
    local
      open ClosureMarshal Signal
    in
      fun swipeSig f = signal "swipe" (get 0w1 double &&&> get 0w2 double ---> ret_void) (fn velocityX & velocityY => f (velocityX, velocityY))
    end
  end
