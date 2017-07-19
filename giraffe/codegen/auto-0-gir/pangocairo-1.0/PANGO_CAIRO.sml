signature PANGO_CAIRO =
  sig
    structure FcFontMapClass : PANGO_CAIRO_FC_FONT_MAP_CLASS
    structure FontClass : PANGO_CAIRO_FONT_CLASS
    structure FontMapClass : PANGO_CAIRO_FONT_MAP_CLASS
    structure FcFontMap :
      PANGO_CAIRO_FC_FONT_MAP
        where type 'a class = 'a FcFontMapClass.class
        where type 'a font_map_class = 'a FontMapClass.class
    structure Font :
      PANGO_CAIRO_FONT
        where type 'a class = 'a FontClass.class
    structure FontMap :
      PANGO_CAIRO_FONT_MAP
        where type 'a class = 'a FontMapClass.class
    val contextGetFontOptions : 'a Pango.ContextClass.class -> Cairo.FontOptionsRecord.t
    val contextGetResolution : 'a Pango.ContextClass.class -> real
    val contextSetFontOptions : 'a Pango.ContextClass.class * Cairo.FontOptionsRecord.t -> unit
    val contextSetResolution : 'a Pango.ContextClass.class * real -> unit
    val createContext : Cairo.ContextRecord.t -> base Pango.ContextClass.class
    val createLayout : Cairo.ContextRecord.t -> base Pango.LayoutClass.class
    val errorUnderlinePath :
      Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val fontMapGetDefault : unit -> base Pango.FontMapClass.class
    val fontMapNew : unit -> base Pango.FontMapClass.class
    val glyphStringPath :
      Cairo.ContextRecord.t
       * 'a Pango.FontClass.class
       * Pango.GlyphStringRecord.t
       -> unit
    val layoutLinePath : Cairo.ContextRecord.t * Pango.LayoutLineRecord.t -> unit
    val layoutPath : Cairo.ContextRecord.t * 'a Pango.LayoutClass.class -> unit
    val showErrorUnderline :
      Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val showGlyphItem :
      Cairo.ContextRecord.t
       * string
       * Pango.GlyphItemRecord.t
       -> unit
    val showGlyphString :
      Cairo.ContextRecord.t
       * 'a Pango.FontClass.class
       * Pango.GlyphStringRecord.t
       -> unit
    val showLayout : Cairo.ContextRecord.t * 'a Pango.LayoutClass.class -> unit
    val showLayoutLine : Cairo.ContextRecord.t * Pango.LayoutLineRecord.t -> unit
    val updateContext : Cairo.ContextRecord.t * 'a Pango.ContextClass.class -> unit
    val updateLayout : Cairo.ContextRecord.t * 'a Pango.LayoutClass.class -> unit
  end
