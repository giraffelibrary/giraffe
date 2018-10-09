signature PANGO_CONTEXT =
  sig
    type 'a class
    type font_metrics_t
    type 'a font_family_class
    type 'a font_class
    type 'a fontset_class
    type direction_t
    type gravity_t
    type font_description_t
    type 'a font_map_class
    type gravity_hint_t
    type language_t
    type matrix_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val changed : 'a class -> unit
    val getBaseDir : 'a class -> direction_t
    val getBaseGravity : 'a class -> gravity_t
    val getFontDescription : 'a class -> font_description_t
    val getFontMap : 'a class -> base font_map_class
    val getGravity : 'a class -> gravity_t
    val getGravityHint : 'a class -> gravity_hint_t
    val getLanguage : 'a class -> language_t
    val getMatrix : 'a class -> matrix_t option
    val getMetrics :
      'a class
       -> font_description_t option * language_t option
       -> font_metrics_t
    val getSerial : 'a class -> LargeInt.int
    val listFamilies : 'a class -> base font_family_class vector
    val loadFont :
      'a class
       -> font_description_t
       -> base font_class option
    val loadFontset :
      'a class
       -> font_description_t * language_t
       -> base fontset_class option
    val setBaseDir :
      'a class
       -> direction_t
       -> unit
    val setBaseGravity :
      'a class
       -> gravity_t
       -> unit
    val setFontDescription :
      'a class
       -> font_description_t
       -> unit
    val setFontMap :
      'a class
       -> 'b font_map_class
       -> unit
    val setGravityHint :
      'a class
       -> gravity_hint_t
       -> unit
    val setLanguage :
      'a class
       -> language_t
       -> unit
    val setMatrix :
      'a class
       -> matrix_t option
       -> unit
  end
