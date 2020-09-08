structure GtkGestureSingle :>
  GTK_GESTURE_SINGLE
    where type 'a class = 'a GtkGestureSingleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_single_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getButton_ = call (getSymbol "gtk_gesture_single_get_button") (GtkGestureSingleClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getCurrentButton_ = call (getSymbol "gtk_gesture_single_get_current_button") (GtkGestureSingleClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getCurrentSequence_ = call (getSymbol "gtk_gesture_single_get_current_sequence") (GtkGestureSingleClass.PolyML.cPtr --> GdkEventSequenceRecord.PolyML.cOptPtr)
      val getExclusive_ = call (getSymbol "gtk_gesture_single_get_exclusive") (GtkGestureSingleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTouchOnly_ = call (getSymbol "gtk_gesture_single_get_touch_only") (GtkGestureSingleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setButton_ = call (getSymbol "gtk_gesture_single_set_button") (GtkGestureSingleClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setExclusive_ = call (getSymbol "gtk_gesture_single_set_exclusive") (GtkGestureSingleClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTouchOnly_ = call (getSymbol "gtk_gesture_single_set_touch_only") (GtkGestureSingleClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkGestureSingleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getButton self = (GtkGestureSingleClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getButton_ self
    fun getCurrentButton self = (GtkGestureSingleClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getCurrentButton_ self
    fun getCurrentSequence self = (GtkGestureSingleClass.FFI.withPtr false ---> GdkEventSequenceRecord.FFI.fromOptPtr true) getCurrentSequence_ self
    fun getExclusive self = (GtkGestureSingleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getExclusive_ self
    fun getTouchOnly self = (GtkGestureSingleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTouchOnly_ self
    fun setButton self button = (GtkGestureSingleClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setButton_ (self & button)
    fun setExclusive self exclusive = (GtkGestureSingleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setExclusive_ (self & exclusive)
    fun setTouchOnly self touchOnly = (GtkGestureSingleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTouchOnly_ (self & touchOnly)
    local
      open ValueAccessor
    in
      val buttonProp =
        {
          name = "button",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val exclusiveProp =
        {
          name = "exclusive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val touchOnlyProp =
        {
          name = "touch-only",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
