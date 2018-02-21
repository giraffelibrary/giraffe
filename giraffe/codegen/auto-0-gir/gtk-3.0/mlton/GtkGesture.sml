structure GtkGesture :>
  GTK_GESTURE
    where type 'a class = 'a GtkGestureClass.class
    where type event_sequence_state_t = GtkEventSequenceState.t =
  struct
    val getType_ = _import "gtk_gesture_get_type" : unit -> GObjectType.FFI.val_;
    val getBoundingBox_ = fn x1 & x2 => (_import "gtk_gesture_get_bounding_box" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getBoundingBoxCenter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gesture_get_bounding_box_center" :
              GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDevice_ = _import "gtk_gesture_get_device" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p -> unit GdkDeviceClass.FFI.p;
    val getLastEvent_ = fn x1 & x2 => (_import "gtk_gesture_get_last_event" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p * GdkEventSequenceRecord.FFI.notnull GdkEventSequenceRecord.FFI.p -> unit GdkEvent.FFI.p;) (x1, x2)
    val getLastUpdatedSequence_ = _import "gtk_gesture_get_last_updated_sequence" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p -> unit GdkEventSequenceRecord.FFI.p;
    val getPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_gesture_get_point" :
              GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p
               * unit GdkEventSequenceRecord.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getSequenceState_ = fn x1 & x2 => (_import "gtk_gesture_get_sequence_state" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p * GdkEventSequenceRecord.FFI.notnull GdkEventSequenceRecord.FFI.p -> GtkEventSequenceState.FFI.val_;) (x1, x2)
    val getWindow_ = _import "gtk_gesture_get_window" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p -> unit GdkWindowClass.FFI.p;
    val group_ = fn x1 & x2 => (_import "gtk_gesture_group" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p * GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p -> unit;) (x1, x2)
    val handlesSequence_ = fn x1 & x2 => (_import "gtk_gesture_handles_sequence" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p * unit GdkEventSequenceRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val isActive_ = _import "gtk_gesture_is_active" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p -> GBool.FFI.val_;
    val isGroupedWith_ = fn x1 & x2 => (_import "gtk_gesture_is_grouped_with" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p * GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val isRecognized_ = _import "gtk_gesture_is_recognized" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p -> GBool.FFI.val_;
    val setSequenceState_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gesture_set_sequence_state" :
              GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p
               * GdkEventSequenceRecord.FFI.notnull GdkEventSequenceRecord.FFI.p
               * GtkEventSequenceState.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setState_ = fn x1 & x2 => (_import "gtk_gesture_set_state" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p * GtkEventSequenceState.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setWindow_ = fn x1 & x2 => (_import "gtk_gesture_set_window" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p * unit GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val ungroup_ = _import "gtk_gesture_ungroup" : GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p -> unit;
    type 'a class = 'a GtkGestureClass.class
    type event_sequence_state_t = GtkEventSequenceState.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBoundingBox self =
      let
        val rect & retVal = (GtkGestureClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getBoundingBox_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getBoundingBoxCenter self =
      let
        val x
         & y
         & retVal =
          (
            GtkGestureClass.FFI.withPtr
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
    fun getDevice self = (GtkGestureClass.FFI.withPtr ---> GdkDeviceClass.FFI.fromOptPtr false) getDevice_ self
    fun getLastEvent self sequence = (GtkGestureClass.FFI.withPtr &&&> GdkEventSequenceRecord.FFI.withPtr ---> GdkEvent.FFI.fromOptPtr false) getLastEvent_ (self & sequence)
    fun getLastUpdatedSequence self = (GtkGestureClass.FFI.withPtr ---> GdkEventSequenceRecord.FFI.fromOptPtr false) getLastUpdatedSequence_ self
    fun getPoint self sequence =
      let
        val x
         & y
         & retVal =
          (
            GtkGestureClass.FFI.withPtr
             &&&> GdkEventSequenceRecord.FFI.withOptPtr
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
    fun getSequenceState self sequence = (GtkGestureClass.FFI.withPtr &&&> GdkEventSequenceRecord.FFI.withPtr ---> GtkEventSequenceState.FFI.fromVal) getSequenceState_ (self & sequence)
    fun getWindow self = (GtkGestureClass.FFI.withPtr ---> GdkWindowClass.FFI.fromOptPtr false) getWindow_ self
    fun group self gesture = (GtkGestureClass.FFI.withPtr &&&> GtkGestureClass.FFI.withPtr ---> I) group_ (self & gesture)
    fun handlesSequence self sequence = (GtkGestureClass.FFI.withPtr &&&> GdkEventSequenceRecord.FFI.withOptPtr ---> GBool.FFI.fromVal) handlesSequence_ (self & sequence)
    fun isActive self = (GtkGestureClass.FFI.withPtr ---> GBool.FFI.fromVal) isActive_ self
    fun isGroupedWith self other = (GtkGestureClass.FFI.withPtr &&&> GtkGestureClass.FFI.withPtr ---> GBool.FFI.fromVal) isGroupedWith_ (self & other)
    fun isRecognized self = (GtkGestureClass.FFI.withPtr ---> GBool.FFI.fromVal) isRecognized_ self
    fun setSequenceState self (sequence, state) =
      (
        GtkGestureClass.FFI.withPtr
         &&&> GdkEventSequenceRecord.FFI.withPtr
         &&&> GtkEventSequenceState.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setSequenceState_
        (
          self
           & sequence
           & state
        )
    fun setState self state = (GtkGestureClass.FFI.withPtr &&&> GtkEventSequenceState.FFI.withVal ---> GBool.FFI.fromVal) setState_ (self & state)
    fun setWindow self window = (GtkGestureClass.FFI.withPtr &&&> GdkWindowClass.FFI.withOptPtr ---> I) setWindow_ (self & window)
    fun ungroup self = (GtkGestureClass.FFI.withPtr ---> I) ungroup_ self
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
      open Property
    in
      val nPointsProp =
        {
          get = fn x => get "n-points" uint x,
          set = fn x => set "n-points" uint x
        }
      val windowProp =
        {
          get = fn x => get "window" GdkWindowClass.tOpt x,
          set = fn x => set "window" GdkWindowClass.tOpt x
        }
    end
  end
