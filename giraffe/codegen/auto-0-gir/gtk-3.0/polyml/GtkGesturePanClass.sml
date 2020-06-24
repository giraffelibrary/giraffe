structure GtkGesturePanClass :>
  GTK_GESTURE_PAN_CLASS
    where type 'a gesture_drag_class = 'a GtkGestureDragClass.class
    where type C.opt = GtkGestureDragClass.C.opt
    where type C.non_opt = GtkGestureDragClass.C.non_opt
    where type 'a C.p = 'a GtkGestureDragClass.C.p =
  struct
    type 'a gesture_drag_class = 'a GtkGestureDragClass.class
    open GtkGestureDragClass
    type 'a gesture_pan = unit
    type 'a class = 'a gesture_pan class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_pan_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
