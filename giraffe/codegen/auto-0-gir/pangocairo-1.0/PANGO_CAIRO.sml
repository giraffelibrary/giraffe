signature PANGO_CAIRO =
  sig
    structure FcFontMapClass : PANGO_CAIRO_FC_FONT_MAP_CLASS
    structure FontClass : PANGO_CAIRO_FONT_CLASS
    structure FontMapClass : PANGO_CAIRO_FONT_MAP_CLASS
    structure FcFontMap :
      PANGO_CAIRO_FC_FONT_MAP
        where type 'a class_t = 'a FcFontMapClass.t
        where type 'a font_map_class_t = 'a FontMapClass.t
    structure Font :
      PANGO_CAIRO_FONT
        where type 'a class_t = 'a FontClass.t
    structure FontMap :
      PANGO_CAIRO_FONT_MAP
        where type 'a class_t = 'a FontMapClass.t
    val contextGetFontOptions : 'a Pango.ContextClass.t -> Cairo.FontOptionsRecord.t
    val contextGetResolution : 'a Pango.ContextClass.t -> real
    val contextSetFontOptions :
      'a Pango.ContextClass.t
       -> Cairo.FontOptionsRecord.t
       -> unit
    val contextSetResolution :
      'a Pango.ContextClass.t
       -> real
       -> unit
    val createContext : Cairo.ContextRecord.t -> base Pango.ContextClass.t
    val createLayout : Cairo.ContextRecord.t -> base Pango.LayoutClass.t
    val errorUnderlinePath :
      Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val fontMapGetDefault : unit -> base Pango.FontMapClass.t
    val fontMapNew : unit -> base Pango.FontMapClass.t
    val glyphStringPath :
      Cairo.ContextRecord.t
       -> 'a Pango.FontClass.t
       -> Pango.GlyphStringRecord.t
       -> unit
    val layoutLinePath :
      Cairo.ContextRecord.t
       -> Pango.LayoutLineRecord.t
       -> unit
    val layoutPath :
      Cairo.ContextRecord.t
       -> 'a Pango.LayoutClass.t
       -> unit
    val showErrorUnderline :
      Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val showGlyphItem :
      Cairo.ContextRecord.t
       -> string
       -> Pango.GlyphItemRecord.t
       -> unit
    val showGlyphString :
      Cairo.ContextRecord.t
       -> 'a Pango.FontClass.t
       -> Pango.GlyphStringRecord.t
       -> unit
    val showLayout :
      Cairo.ContextRecord.t
       -> 'a Pango.LayoutClass.t
       -> unit
    val showLayoutLine :
      Cairo.ContextRecord.t
       -> Pango.LayoutLineRecord.t
       -> unit
    val updateContext :
      Cairo.ContextRecord.t
       -> 'a Pango.ContextClass.t
       -> unit
    val updateLayout :
      Cairo.ContextRecord.t
       -> 'a Pango.LayoutClass.t
       -> unit
  end
