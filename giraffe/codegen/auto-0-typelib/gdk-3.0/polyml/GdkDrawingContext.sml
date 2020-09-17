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
      val getClip_ = call (getSymbol "gdk_drawing_context_get_clip") (GdkDrawingContextClass.PolyML.cPtr --> CairoRegionRecord.PolyML.cOptPtr)
      val getWindow_ = call (getSymbol "gdk_drawing_context_get_window") (GdkDrawingContextClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val isValid_ = call (getSymbol "gdk_drawing_context_is_valid") (GdkDrawingContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GdkDrawingContextClass.class
    type 'a window_class = 'a GdkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getCairoContext self = (GdkDrawingContextClass.FFI.withPtr false ---> CairoContextRecord.FFI.fromPtr false) getCairoContext_ self before GdkDrawingContextClass.FFI.touchPtr self
    fun getClip self = (GdkDrawingContextClass.FFI.withPtr false ---> CairoRegionRecord.FFI.fromOptPtr true) getClip_ self
    fun getWindow self = (GdkDrawingContextClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getWindow_ self before GdkDrawingContextClass.FFI.touchPtr self
    fun isValid self = (GdkDrawingContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) isValid_ self
    local
      open ValueAccessor
    in
      val clipProp =
        {
          name = "clip",
          gtype = fn () => C.gtype CairoRegionRecord.tOpt (),
          get = fn x => fn () => C.get CairoRegionRecord.tOpt x,
          set = ignore,
          init = fn x => C.set CairoRegionRecord.tOpt x
        }
      val windowProp =
        {
          name = "window",
          gtype = fn () => C.gtype GdkWindowClass.tOpt (),
          get = fn x => fn () => C.get GdkWindowClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkWindowClass.tOpt x
        }
    end
  end
