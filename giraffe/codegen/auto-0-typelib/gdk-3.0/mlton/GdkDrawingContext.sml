structure GdkDrawingContext :>
  GDK_DRAWING_CONTEXT
    where type 'a class = 'a GdkDrawingContextClass.class
    where type 'a window_class = 'a GdkWindowClass.class =
  struct
    val getType_ = _import "gdk_drawing_context_get_type" : unit -> GObjectType.FFI.val_;
    val getCairoContext_ = _import "gdk_drawing_context_get_cairo_context" : GdkDrawingContextClass.FFI.non_opt GdkDrawingContextClass.FFI.p -> CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p;
    val getClip_ = _import "gdk_drawing_context_get_clip" : GdkDrawingContextClass.FFI.non_opt GdkDrawingContextClass.FFI.p -> CairoRegionRecord.FFI.opt CairoRegionRecord.FFI.p;
    val getWindow_ = _import "gdk_drawing_context_get_window" : GdkDrawingContextClass.FFI.non_opt GdkDrawingContextClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val isValid_ = _import "gdk_drawing_context_is_valid" : GdkDrawingContextClass.FFI.non_opt GdkDrawingContextClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GdkDrawingContextClass.class
    type 'a window_class = 'a GdkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getCairoContext self = (GdkDrawingContextClass.FFI.withPtr false ---> CairoContextRecord.FFI.fromPtr false) getCairoContext_ self
    fun getClip self = (GdkDrawingContextClass.FFI.withPtr false ---> CairoRegionRecord.FFI.fromOptPtr true) getClip_ self
    fun getWindow self = (GdkDrawingContextClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getWindow_ self
    fun isValid self = (GdkDrawingContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) isValid_ self
    local
      open Property
    in
      val clipProp =
        {
          get = fn x => get "clip" CairoRegionRecord.tOpt x,
          new = fn x => new "clip" CairoRegionRecord.tOpt x
        }
      val windowProp =
        {
          get = fn x => get "window" GdkWindowClass.tOpt x,
          new = fn x => new "window" GdkWindowClass.tOpt x
        }
    end
  end
