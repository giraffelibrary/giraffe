structure GtkGestureSwipe :>
  GTK_GESTURE_SWIPE
    where type 'a class = 'a GtkGestureSwipeClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_gesture_swipe_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_gesture_swipe_new" : GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p;
    val getVelocity_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gesture_swipe_get_velocity" :
              GtkGestureSwipeClass.FFI.notnull GtkGestureSwipeClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkGestureSwipeClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr ---> GtkGestureSwipeClass.FFI.fromPtr true) new_ widget
    fun getVelocity self =
      let
        val velocityX
         & velocityY
         & retVal =
          (
            GtkGestureSwipeClass.FFI.withPtr
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
