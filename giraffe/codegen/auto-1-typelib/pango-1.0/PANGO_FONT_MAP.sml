signature PANGO_FONT_MAP =
  sig
    type 'a class_t
    type 'a contextclass_t
    type fontdescriptionrecord_t
    type languagerecord_t
    type 'a fontsetclass_t
    type 'a fontclass_t
    val getType : unit -> GObject.Type.t
    val createContext : 'a class_t -> base contextclass_t
    val loadFont :
      'a class_t
       -> 'b contextclass_t
       -> fontdescriptionrecord_t
       -> base fontclass_t
    val loadFontset :
      'a class_t
       -> 'b contextclass_t
       -> fontdescriptionrecord_t
       -> languagerecord_t
       -> base fontsetclass_t
  end
