signature CAIRO =
  sig
    structure ContextRecord : CAIRO_CONTEXT_RECORD
    structure DeviceRecord : CAIRO_DEVICE_RECORD
    structure SurfaceRecord : CAIRO_SURFACE_RECORD
    structure PatternRecord : CAIRO_PATTERN_RECORD
    structure RegionRecord : CAIRO_REGION_RECORD
    structure Status : CAIRO_STATUS
    structure Content : CAIRO_CONTENT
    structure Operator : CAIRO_OPERATOR
    structure Antialias : CAIRO_ANTIALIAS
    structure FillRule : CAIRO_FILL_RULE
    structure LineCap : CAIRO_LINE_CAP
    structure LineJoin : CAIRO_LINE_JOIN
    structure TextClusterFlags : CAIRO_TEXT_CLUSTER_FLAGS
    structure FontSlant : CAIRO_FONT_SLANT
    structure FontWeight : CAIRO_FONT_WEIGHT
    structure SubpixelOrder : CAIRO_SUBPIXEL_ORDER
    structure HintStyle : CAIRO_HINT_STYLE
    structure HintMetrics : CAIRO_HINT_METRICS
    structure FontOptionsRecord : CAIRO_FONT_OPTIONS_RECORD
    structure FontType : CAIRO_FONT_TYPE
    structure PathDataType : CAIRO_PATH_DATA_TYPE
    structure DeviceType : CAIRO_DEVICE_TYPE
    structure SurfaceType : CAIRO_SURFACE_TYPE
    structure Format : CAIRO_FORMAT
    structure PatternType : CAIRO_PATTERN_TYPE
    structure Extend : CAIRO_EXTEND
    structure Filter : CAIRO_FILTER
    structure RegionOverlap : CAIRO_REGION_OVERLAP
    structure FontFaceRecord : CAIRO_FONT_FACE_RECORD
    structure ScaledFontRecord : CAIRO_SCALED_FONT_RECORD
    structure RectangleRecord : CAIRO_RECTANGLE_RECORD
    structure RectangleIntRecord : CAIRO_RECTANGLE_INT_RECORD
    structure Context :
      CAIRO_CONTEXT
        where type t = ContextRecord.t
        where type antialias_t = Antialias.t
        where type fillrule_t = FillRule.t
        where type linecap_t = LineCap.t
        where type linejoin_t = LineJoin.t
        where type operator_t = Operator.t
        where type status_t = Status.t
        where type content_t = Content.t
        where type pattern_t = PatternRecord.t
        where type surface_t = SurfaceRecord.t
    structure Device :
      CAIRO_DEVICE
        where type t = DeviceRecord.t
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
    structure FontFace :
      CAIRO_FONT_FACE
        where type t = FontFaceRecord.t
    structure ScaledFont :
      CAIRO_SCALED_FONT
        where type t = ScaledFontRecord.t
    structure Rectangle :
      CAIRO_RECTANGLE
        where type t = RectangleRecord.t
    structure RectangleInt :
      CAIRO_RECTANGLE_INT
        where type t = RectangleIntRecord.t
    val imageSurfaceCreate : unit -> unit
  end
