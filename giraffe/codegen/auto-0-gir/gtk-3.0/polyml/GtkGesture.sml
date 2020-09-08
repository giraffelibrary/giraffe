structure GtkGesture :>
  GTK_GESTURE
    where type 'a class = 'a GtkGestureClass.class
    where type event_sequence_state_t = GtkEventSequenceState.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getBoundingBox_ = call (getSymbol "gtk_gesture_get_bounding_box") (GtkGestureClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBoundingBoxCenter_ =
        call (getSymbol "gtk_gesture_get_bounding_box_center")
          (
            GtkGestureClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getDevice_ = call (getSymbol "gtk_gesture_get_device") (GtkGestureClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cOptPtr)
      val getLastEvent_ = call (getSymbol "gtk_gesture_get_last_event") (GtkGestureClass.PolyML.cPtr &&> GdkEventSequenceRecord.PolyML.cPtr --> GdkEvent.PolyML.cOptPtr)
      val getLastUpdatedSequence_ = call (getSymbol "gtk_gesture_get_last_updated_sequence") (GtkGestureClass.PolyML.cPtr --> GdkEventSequenceRecord.PolyML.cOptPtr)
      val getPoint_ =
        call (getSymbol "gtk_gesture_get_point")
          (
            GtkGestureClass.PolyML.cPtr
             &&> GdkEventSequenceRecord.PolyML.cOptPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getSequenceState_ = call (getSymbol "gtk_gesture_get_sequence_state") (GtkGestureClass.PolyML.cPtr &&> GdkEventSequenceRecord.PolyML.cPtr --> GtkEventSequenceState.PolyML.cVal)
      val getWindow_ = call (getSymbol "gtk_gesture_get_window") (GtkGestureClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
      val group_ = call (getSymbol "gtk_gesture_group") (GtkGestureClass.PolyML.cPtr &&> GtkGestureClass.PolyML.cPtr --> cVoid)
      val handlesSequence_ = call (getSymbol "gtk_gesture_handles_sequence") (GtkGestureClass.PolyML.cPtr &&> GdkEventSequenceRecord.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val isActive_ = call (getSymbol "gtk_gesture_is_active") (GtkGestureClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isGroupedWith_ = call (getSymbol "gtk_gesture_is_grouped_with") (GtkGestureClass.PolyML.cPtr &&> GtkGestureClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isRecognized_ = call (getSymbol "gtk_gesture_is_recognized") (GtkGestureClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setSequenceState_ =
        call (getSymbol "gtk_gesture_set_sequence_state")
          (
            GtkGestureClass.PolyML.cPtr
             &&> GdkEventSequenceRecord.PolyML.cPtr
             &&> GtkEventSequenceState.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setState_ = call (getSymbol "gtk_gesture_set_state") (GtkGestureClass.PolyML.cPtr &&> GtkEventSequenceState.PolyML.cVal --> GBool.PolyML.cVal)
      val setWindow_ = call (getSymbol "gtk_gesture_set_window") (GtkGestureClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cOptPtr --> cVoid)
      val ungroup_ = call (getSymbol "gtk_gesture_ungroup") (GtkGestureClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkGestureClass.class
    type event_sequence_state_t = GtkEventSequenceState.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBoundingBox self =
      let
        val rect & retVal = (GtkGestureClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getBoundingBox_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getBoundingBoxCenter self =
      let
        val x
         & y
         & retVal =
          (
            GtkGestureClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getBoundingBoxCenter_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        if retVal then SOME (x, y) else NONE
      end
    fun getDevice self = (GtkGestureClass.FFI.withPtr false ---> GdkDeviceClass.FFI.fromOptPtr false) getDevice_ self
    fun getLastEvent self sequence = (GtkGestureClass.FFI.withPtr false &&&> GdkEventSequenceRecord.FFI.withPtr false ---> GdkEvent.FFI.fromOptPtr false) getLastEvent_ (self & sequence)
    fun getLastUpdatedSequence self = (GtkGestureClass.FFI.withPtr false ---> GdkEventSequenceRecord.FFI.fromOptPtr false) getLastUpdatedSequence_ self
    fun getPoint self sequence =
      let
        val x
         & y
         & retVal =
          (
            GtkGestureClass.FFI.withPtr false
             &&&> GdkEventSequenceRecord.FFI.withOptPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getPoint_
            (
              self
               & sequence
               & GDouble.null
               & GDouble.null
            )
      in
        if retVal then SOME (x, y) else NONE
      end
    fun getSequenceState self sequence = (GtkGestureClass.FFI.withPtr false &&&> GdkEventSequenceRecord.FFI.withPtr false ---> GtkEventSequenceState.FFI.fromVal) getSequenceState_ (self & sequence)
    fun getWindow self = (GtkGestureClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getWindow_ self
    fun group self gesture = (GtkGestureClass.FFI.withPtr false &&&> GtkGestureClass.FFI.withPtr false ---> I) group_ (self & gesture)
    fun handlesSequence self sequence = (GtkGestureClass.FFI.withPtr false &&&> GdkEventSequenceRecord.FFI.withOptPtr false ---> GBool.FFI.fromVal) handlesSequence_ (self & sequence)
    fun isActive self = (GtkGestureClass.FFI.withPtr false ---> GBool.FFI.fromVal) isActive_ self
    fun isGroupedWith self other = (GtkGestureClass.FFI.withPtr false &&&> GtkGestureClass.FFI.withPtr false ---> GBool.FFI.fromVal) isGroupedWith_ (self & other)
    fun isRecognized self = (GtkGestureClass.FFI.withPtr false ---> GBool.FFI.fromVal) isRecognized_ self
    fun setSequenceState self (sequence, state) =
      (
        GtkGestureClass.FFI.withPtr false
         &&&> GdkEventSequenceRecord.FFI.withPtr false
         &&&> GtkEventSequenceState.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setSequenceState_
        (
          self
           & sequence
           & state
        )
    fun setState self state = (GtkGestureClass.FFI.withPtr false &&&> GtkEventSequenceState.FFI.withVal ---> GBool.FFI.fromVal) setState_ (self & state)
    fun setWindow self window = (GtkGestureClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withOptPtr false ---> I) setWindow_ (self & window)
    fun ungroup self = (GtkGestureClass.FFI.withPtr false ---> I) ungroup_ self
    local
      open ClosureMarshal Signal
    in
      fun beginSig f = signal "begin" (get 0w1 GdkEventSequenceRecord.t ---> ret_void) f
      fun cancelSig f = signal "cancel" (get 0w1 GdkEventSequenceRecord.t ---> ret_void) f
      fun endSig f = signal "end" (get 0w1 GdkEventSequenceRecord.t ---> ret_void) f
      fun sequenceStateChangedSig f = signal "sequence-state-changed" (get 0w1 GdkEventSequenceRecord.t &&&> get 0w2 GtkEventSequenceState.t ---> ret_void) (fn sequence & state => f (sequence, state))
      fun updateSig f = signal "update" (get 0w1 GdkEventSequenceRecord.t ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val nPointsProp =
        {
          name = "n-points",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = fn x => C.set uint x
        }
      val windowProp =
        {
          name = "window",
          gtype = fn () => C.gtype GdkWindowClass.tOpt (),
          get = fn x => fn () => C.get GdkWindowClass.tOpt x,
          set = fn x => C.set GdkWindowClass.tOpt x,
          init = fn x => C.set GdkWindowClass.tOpt x
        }
    end
  end
