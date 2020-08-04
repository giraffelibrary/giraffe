structure GtkGestureDrag :>
  GTK_GESTURE_DRAG
    where type 'a class = 'a GtkGestureDragClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_gesture_drag_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_gesture_drag_new" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p;
    val getOffset_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gesture_drag_get_offset" :
              GtkGestureDragClass.FFI.non_opt GtkGestureDragClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getStartPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gesture_drag_get_start_point" :
              GtkGestureDragClass.FFI.non_opt GtkGestureDragClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkGestureDragClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr false ---> GtkGestureDragClass.FFI.fromPtr true) new_ widget
    fun getOffset self =
      let
        val x
         & y
         & retVal =
          (
            GtkGestureDragClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getOffset_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        if retVal then SOME (x, y) else NONE
      end
    fun getStartPoint self =
      let
        val x
         & y
         & retVal =
          (
            GtkGestureDragClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getStartPoint_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        if retVal then SOME (x, y) else NONE
      end
    local
      open ClosureMarshal Signal
    in
      fun dragBeginSig f = signal "drag-begin" (get 0w1 double &&&> get 0w2 double ---> ret_void) (fn startX & startY => f (startX, startY))
      fun dragEndSig f = signal "drag-end" (get 0w1 double &&&> get 0w2 double ---> ret_void) (fn offsetX & offsetY => f (offsetX, offsetY))
      fun dragUpdateSig f = signal "drag-update" (get 0w1 double &&&> get 0w2 double ---> ret_void) (fn offsetX & offsetY => f (offsetX, offsetY))
    end
  end
