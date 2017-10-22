structure GtkGestureDrag :>
  GTK_GESTURE_DRAG
    where type 'a class = 'a GtkGestureDragClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_drag_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_gesture_drag_new") (GtkWidgetClass.PolyML.cPtr --> GtkGestureClass.PolyML.cPtr)
      val getOffset_ =
        call (getSymbol "gtk_gesture_drag_get_offset")
          (
            GtkGestureDragClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getStartPoint_ =
        call (getSymbol "gtk_gesture_drag_get_start_point")
          (
            GtkGestureDragClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkGestureDragClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr ---> GtkGestureDragClass.FFI.fromPtr true) new_ widget
    fun getOffset self =
      let
        val x
         & y
         & retVal =
          (
            GtkGestureDragClass.FFI.withPtr
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
            GtkGestureDragClass.FFI.withPtr
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
