structure GtkGestureSingle :>
  GTK_GESTURE_SINGLE
    where type 'a class = 'a GtkGestureSingleClass.class =
  struct
    val getType_ = _import "gtk_gesture_single_get_type" : unit -> GObjectType.FFI.val_;
    val getButton_ = _import "gtk_gesture_single_get_button" : GtkGestureSingleClass.FFI.non_opt GtkGestureSingleClass.FFI.p -> GUInt.FFI.val_;
    val getCurrentButton_ = _import "gtk_gesture_single_get_current_button" : GtkGestureSingleClass.FFI.non_opt GtkGestureSingleClass.FFI.p -> GUInt.FFI.val_;
    val getCurrentSequence_ = _import "gtk_gesture_single_get_current_sequence" : GtkGestureSingleClass.FFI.non_opt GtkGestureSingleClass.FFI.p -> GdkEventSequenceRecord.FFI.opt GdkEventSequenceRecord.FFI.p;
    val getExclusive_ = _import "gtk_gesture_single_get_exclusive" : GtkGestureSingleClass.FFI.non_opt GtkGestureSingleClass.FFI.p -> GBool.FFI.val_;
    val getTouchOnly_ = _import "gtk_gesture_single_get_touch_only" : GtkGestureSingleClass.FFI.non_opt GtkGestureSingleClass.FFI.p -> GBool.FFI.val_;
    val setButton_ = fn x1 & x2 => (_import "gtk_gesture_single_set_button" : GtkGestureSingleClass.FFI.non_opt GtkGestureSingleClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setExclusive_ = fn x1 & x2 => (_import "gtk_gesture_single_set_exclusive" : GtkGestureSingleClass.FFI.non_opt GtkGestureSingleClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTouchOnly_ = fn x1 & x2 => (_import "gtk_gesture_single_set_touch_only" : GtkGestureSingleClass.FFI.non_opt GtkGestureSingleClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkGestureSingleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getButton self = (GtkGestureSingleClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getButton_ self
    fun getCurrentButton self = (GtkGestureSingleClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getCurrentButton_ self
    fun getCurrentSequence self = (GtkGestureSingleClass.FFI.withPtr false ---> GdkEventSequenceRecord.FFI.fromOptPtr true) getCurrentSequence_ self
    fun getExclusive self = (GtkGestureSingleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getExclusive_ self
    fun getTouchOnly self = (GtkGestureSingleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTouchOnly_ self
    fun setButton self button = (GtkGestureSingleClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setButton_ (self & button)
    fun setExclusive self exclusive = (GtkGestureSingleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setExclusive_ (self & exclusive)
    fun setTouchOnly self touchOnly = (GtkGestureSingleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTouchOnly_ (self & touchOnly)
    local
      open Property
    in
      val buttonProp =
        {
          get = fn x => get "button" uint x,
          set = fn x => set "button" uint x,
          new = fn x => new "button" uint x
        }
      val exclusiveProp =
        {
          get = fn x => get "exclusive" boolean x,
          set = fn x => set "exclusive" boolean x,
          new = fn x => new "exclusive" boolean x
        }
      val touchOnlyProp =
        {
          get = fn x => get "touch-only" boolean x,
          set = fn x => set "touch-only" boolean x,
          new = fn x => new "touch-only" boolean x
        }
    end
  end
