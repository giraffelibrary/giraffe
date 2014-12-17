signature PANGO_CONTEXT =
  sig
    type 'a class_t
    type fontmetricsrecord_t
    type 'a fontclass_t
    type 'a fontsetclass_t
    type direction_t
    type gravity_t
    type fontdescriptionrecord_t
    type 'a fontmapclass_t
    type gravityhint_t
    type languagerecord_t
    type matrixrecord_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getBaseDir : 'a class_t -> direction_t
    val getBaseGravity : 'a class_t -> gravity_t
    val getFontDescription : 'a class_t -> fontdescriptionrecord_t
    val getFontMap : 'a class_t -> base fontmapclass_t
    val getGravity : 'a class_t -> gravity_t
    val getGravityHint : 'a class_t -> gravityhint_t
    val getLanguage : 'a class_t -> languagerecord_t
    val getMatrix : 'a class_t -> matrixrecord_t
    val getMetrics :
      'a class_t
       -> fontdescriptionrecord_t option
       -> languagerecord_t option
       -> fontmetricsrecord_t
    val loadFont :
      'a class_t
       -> fontdescriptionrecord_t
       -> base fontclass_t
    val loadFontset :
      'a class_t
       -> fontdescriptionrecord_t
       -> languagerecord_t
       -> base fontsetclass_t
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
       -> fontdescriptionrecord_t
       -> unit
    val setFontMap :
      'a class_t
       -> 'b fontmapclass_t
       -> unit
    val setGravityHint :
      'a class_t
       -> gravityhint_t
       -> unit
    val setLanguage :
      'a class_t
       -> languagerecord_t
       -> unit
    val setMatrix :
      'a class_t
       -> matrixrecord_t option
       -> unit
  end
