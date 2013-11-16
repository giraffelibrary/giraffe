signature CAIRO =
  sig
    structure ContextRecord : CAIRO_CONTEXT_RECORD
    structure SurfaceRecord : CAIRO_SURFACE_RECORD
    structure PatternRecord : CAIRO_PATTERN_RECORD
    structure RegionRecord : CAIRO_REGION_RECORD
    structure Content : CAIRO_CONTENT
    structure FontOptionsRecord : CAIRO_FONT_OPTIONS_RECORD
    structure ScaledFontRecord : CAIRO_SCALED_FONT_RECORD
    structure RectangleIntRecord : CAIRO_RECTANGLE_INT_RECORD
    structure Context :
      CAIRO_CONTEXT
        where type record_t = ContextRecord.t
    structure Surface :
      CAIRO_SURFACE
        where type record_t = SurfaceRecord.t
    structure Pattern :
      CAIRO_PATTERN
        where type record_t = PatternRecord.t
    structure Region :
      CAIRO_REGION
        where type record_t = RegionRecord.t
    structure FontOptions :
      CAIRO_FONT_OPTIONS
        where type record_t = FontOptionsRecord.t
    structure ScaledFont :
      CAIRO_SCALED_FONT
        where type record_t = ScaledFontRecord.t
    structure RectangleInt :
      CAIRO_RECTANGLE_INT
        where type record_t = RectangleIntRecord.t
    val imageSurfaceCreate : unit -> unit
  end
