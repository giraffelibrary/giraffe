structure Cairo : CAIRO =
  struct
    local
      open PolyMLFFI
    in
      val imageSurfaceCreate_ = call (load_sym libcairogobject "cairo_image_surface_create") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
    end
    structure ContextRecord = CairoContextRecord
    structure SurfaceRecord = CairoSurfaceRecord
    structure PatternRecord = CairoPatternRecord
    structure RegionRecord = CairoRegionRecord
    structure Content = CairoContent
    structure FontOptionsRecord = CairoFontOptionsRecord
    structure ScaledFontRecord = CairoScaledFontRecord
    structure RectangleIntRecord = CairoRectangleIntRecord
    structure Context = CairoContext
    structure Surface = CairoSurface
    structure Pattern = CairoPattern
    structure Region = CairoRegion
    structure FontOptions = CairoFontOptions
    structure ScaledFont = CairoScaledFont
    structure RectangleInt = CairoRectangleInt
    fun imageSurfaceCreate () = (I ---> I) imageSurfaceCreate_ ()
  end
