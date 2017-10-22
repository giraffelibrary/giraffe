structure GdkDrawingContext :>
  GDK_DRAWING_CONTEXT
    where type 'a class = 'a GdkDrawingContextClass.class
    where type 'a window_class = 'a GdkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_drawing_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getCairoContext_ = call (getSymbol "gdk_drawing_context_get_cairo_context") (GdkDrawingContextClass.PolyML.cPtr --> CairoContextRecord.PolyML.cPtr)
      val getClip_ = call (getSymbol "gdk_drawing_context_get_clip") (GdkDrawingContextClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val getWindow_ = call (getSymbol "gdk_drawing_context_get_window") (GdkDrawingContextClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val isValid_ = call (getSymbol "gdk_drawing_context_is_valid") (GdkDrawingContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GdkDrawingContextClass.class
    type 'a window_class = 'a GdkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getCairoContext self = (GdkDrawingContextClass.FFI.withPtr ---> CairoContextRecord.FFI.fromPtr false) getCairoContext_ self
    fun getClip self = (GdkDrawingContextClass.FFI.withPtr ---> CairoRegionRecord.FFI.fromPtr true) getClip_ self
    fun getWindow self = (GdkDrawingContextClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getWindow_ self
    fun isValid self = (GdkDrawingContextClass.FFI.withPtr ---> GBool.FFI.fromVal) isValid_ self
    local
      open Property
    in
      val clipProp =
        {
          get = fn x => get "clip" CairoRegionRecord.tOpt x,
          set = fn x => set "clip" CairoRegionRecord.tOpt x
        }
      val windowProp =
        {
          get = fn x => get "window" GdkWindowClass.tOpt x,
          set = fn x => set "window" GdkWindowClass.tOpt x
        }
    end
  end
