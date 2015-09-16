signature PANGO_FONT_MAP =
  sig
    type 'a class_t
    type 'a font_class_t
    type 'a fontset_class_t
    type language_record_t
    type font_description_record_t
    type 'a context_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val createContext : 'a class_t -> base context_class_t
    val loadFont :
      'a class_t
       -> 'b context_class_t
       -> font_description_record_t
       -> base font_class_t
    val loadFontset :
      'a class_t
       -> 'b context_class_t
       -> font_description_record_t
       -> language_record_t
       -> base fontset_class_t
  end
