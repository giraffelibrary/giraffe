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
        where type t = ContextRecord.t
    structure Surface :
      CAIRO_SURFACE
        where type t = SurfaceRecord.t
    structure Pattern :
      CAIRO_PATTERN
        where type t = PatternRecord.t
    structure Region :
      CAIRO_REGION
        where type t = RegionRecord.t
    structure FontOptions :
      CAIRO_FONT_OPTIONS
        where type t = FontOptionsRecord.t
    structure ScaledFont :
      CAIRO_SCALED_FONT
        where type t = ScaledFontRecord.t
    structure RectangleInt :
      CAIRO_RECTANGLE_INT
        where type t = RectangleIntRecord.t
    val imageSurfaceCreate : unit -> unit
  end
