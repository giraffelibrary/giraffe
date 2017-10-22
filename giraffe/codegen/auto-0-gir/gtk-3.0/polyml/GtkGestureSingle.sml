structure GtkGestureSingle :>
  GTK_GESTURE_SINGLE
    where type 'a class = 'a GtkGestureSingleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_single_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getButton_ = call (getSymbol "gtk_gesture_single_get_button") (GtkGestureSingleClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getCurrentButton_ = call (getSymbol "gtk_gesture_single_get_current_button") (GtkGestureSingleClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getCurrentSequence_ = call (getSymbol "gtk_gesture_single_get_current_sequence") (GtkGestureSingleClass.PolyML.cPtr --> GdkEventSequenceRecord.PolyML.cPtr)
      val getExclusive_ = call (getSymbol "gtk_gesture_single_get_exclusive") (GtkGestureSingleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTouchOnly_ = call (getSymbol "gtk_gesture_single_get_touch_only") (GtkGestureSingleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setButton_ = call (getSymbol "gtk_gesture_single_set_button") (GtkGestureSingleClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setExclusive_ = call (getSymbol "gtk_gesture_single_set_exclusive") (GtkGestureSingleClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTouchOnly_ = call (getSymbol "gtk_gesture_single_set_touch_only") (GtkGestureSingleClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkGestureSingleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getButton self = (GtkGestureSingleClass.FFI.withPtr ---> GUInt.FFI.fromVal) getButton_ self
    fun getCurrentButton self = (GtkGestureSingleClass.FFI.withPtr ---> GUInt.FFI.fromVal) getCurrentButton_ self
    fun getCurrentSequence self = (GtkGestureSingleClass.FFI.withPtr ---> GdkEventSequenceRecord.FFI.fromPtr true) getCurrentSequence_ self
    fun getExclusive self = (GtkGestureSingleClass.FFI.withPtr ---> GBool.FFI.fromVal) getExclusive_ self
    fun getTouchOnly self = (GtkGestureSingleClass.FFI.withPtr ---> GBool.FFI.fromVal) getTouchOnly_ self
    fun setButton self button = (GtkGestureSingleClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setButton_ (self & button)
    fun setExclusive self exclusive = (GtkGestureSingleClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setExclusive_ (self & exclusive)
    fun setTouchOnly self touchOnly = (GtkGestureSingleClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setTouchOnly_ (self & touchOnly)
    local
      open Property
    in
      val buttonProp =
        {
          get = fn x => get "button" uint x,
          set = fn x => set "button" uint x
        }
      val exclusiveProp =
        {
          get = fn x => get "exclusive" boolean x,
          set = fn x => set "exclusive" boolean x
        }
      val touchOnlyProp =
        {
          get = fn x => get "touch-only" boolean x,
          set = fn x => set "touch-only" boolean x
        }
    end
  end
