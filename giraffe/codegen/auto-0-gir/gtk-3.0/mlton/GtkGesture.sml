structure GtkGesture :>
  GTK_GESTURE
    where type 'a class = 'a GtkGestureClass.class
    where type event_sequence_state_t = GtkEventSequenceState.t =
  struct
    val getType_ = _import "gtk_gesture_get_type" : unit -> GObjectType.FFI.val_;
    val getBoundingBox_ = fn x1 & x2 => (_import "gtk_gesture_get_bounding_box" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getBoundingBoxCenter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gesture_get_bounding_box_center" :
              GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDevice_ = _import "gtk_gesture_get_device" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p -> GdkDeviceClass.FFI.opt GdkDeviceClass.FFI.p;
    val getLastEvent_ = fn x1 & x2 => (_import "gtk_gesture_get_last_event" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p * GdkEventSequenceRecord.FFI.non_opt GdkEventSequenceRecord.FFI.p -> GdkEvent.FFI.opt GdkEvent.FFI.p;) (x1, x2)
    val getLastUpdatedSequence_ = _import "gtk_gesture_get_last_updated_sequence" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p -> GdkEventSequenceRecord.FFI.opt GdkEventSequenceRecord.FFI.p;
    val getPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_gesture_get_point" :
              GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p
               * GdkEventSequenceRecord.FFI.opt GdkEventSequenceRecord.FFI.p
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
    val getSequenceState_ = fn x1 & x2 => (_import "gtk_gesture_get_sequence_state" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p * GdkEventSequenceRecord.FFI.non_opt GdkEventSequenceRecord.FFI.p -> GtkEventSequenceState.FFI.val_;) (x1, x2)
    val getWindow_ = _import "gtk_gesture_get_window" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
    val group_ = fn x1 & x2 => (_import "gtk_gesture_group" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p * GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p -> unit;) (x1, x2)
    val handlesSequence_ = fn x1 & x2 => (_import "gtk_gesture_handles_sequence" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p * GdkEventSequenceRecord.FFI.opt GdkEventSequenceRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val isActive_ = _import "gtk_gesture_is_active" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p -> GBool.FFI.val_;
    val isGroupedWith_ = fn x1 & x2 => (_import "gtk_gesture_is_grouped_with" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p * GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val isRecognized_ = _import "gtk_gesture_is_recognized" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p -> GBool.FFI.val_;
    val setSequenceState_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gesture_set_sequence_state" :
              GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p
               * GdkEventSequenceRecord.FFI.non_opt GdkEventSequenceRecord.FFI.p
               * GtkEventSequenceState.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setState_ = fn x1 & x2 => (_import "gtk_gesture_set_state" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p * GtkEventSequenceState.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val setWindow_ = fn x1 & x2 => (_import "gtk_gesture_set_window" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p * GdkWindowClass.FFI.opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val ungroup_ = _import "gtk_gesture_ungroup" : GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p -> unit;
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
