signature PANGO_CONTEXT =
  sig
    type 'a class_t
    type font_metrics_record_t
    type 'a font_class_t
    type 'a fontset_class_t
    type direction_t
    type gravity_t
    type font_description_record_t
    type 'a font_map_class_t
    type gravity_hint_t
    type language_record_t
    type matrix_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getBaseDir : 'a class_t -> direction_t
    val getBaseGravity : 'a class_t -> gravity_t
    val getFontDescription : 'a class_t -> font_description_record_t
    val getFontMap : 'a class_t -> base font_map_class_t
    val getGravity : 'a class_t -> gravity_t
    val getGravityHint : 'a class_t -> gravity_hint_t
    val getLanguage : 'a class_t -> language_record_t
    val getMatrix : 'a class_t -> matrix_record_t
    val getMetrics :
      'a class_t
       -> font_description_record_t option
       -> language_record_t option
       -> font_metrics_record_t
    val loadFont :
      'a class_t
       -> font_description_record_t
       -> base font_class_t
    val loadFontset :
      'a class_t
       -> font_description_record_t
       -> language_record_t
       -> base fontset_class_t
    val setBaseDir :
      'a class_t
       -> direction_t
       -> unit
    val setBaseGravity :
      'a class_t
       -> gravity_t
       -> unit
    val setFontDescription :
      'a class_t
       -> font_description_record_t
       -> unit
    val setFontMap :
      'a class_t
       -> 'b font_map_class_t
       -> unit
    val setGravityHint :
      'a class_t
       -> gravity_hint_t
       -> unit
    val setLanguage :
      'a class_t
       -> language_record_t
       -> unit
    val setMatrix :
      'a class_t
       -> matrix_record_t option
       -> unit
  end
