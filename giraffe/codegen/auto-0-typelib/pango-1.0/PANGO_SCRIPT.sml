signature PANGO_SCRIPT =
  sig
    datatype enum =
      INVALID_CODE
    | COMMON
    | INHERITED
    | ARABIC
    | ARMENIAN
    | BENGALI
    | BOPOMOFO
    | CHEROKEE
    | COPTIC
    | CYRILLIC
    | DESERET
    | DEVANAGARI
    | ETHIOPIC
    | GEORGIAN
    | GOTHIC
    | GREEK
    | GUJARATI
    | GURMUKHI
    | HAN
    | HANGUL
    | HEBREW
    | HIRAGANA
    | KANNADA
    | KATAKANA
    | KHMER
    | LAO
    | LATIN
    | MALAYALAM
    | MONGOLIAN
    | MYANMAR
    | OGHAM
    | OLD_ITALIC
    | ORIYA
    | RUNIC
    | SINHALA
    | SYRIAC
    | TAMIL
    | TELUGU
    | THAANA
    | THAI
    | TIBETAN
    | CANADIAN_ABORIGINAL
    | YI
    | TAGALOG
    | HANUNOO
    | BUHID
    | TAGBANWA
    | BRAILLE
    | CYPRIOT
    | LIMBU
    | OSMANYA
    | SHAVIAN
    | LINEAR_B
    | TAI_LE
    | UGARITIC
    | NEW_TAI_LUE
    | BUGINESE
    | GLAGOLITIC
    | TIFINAGH
    | SYLOTI_NAGRI
    | OLD_PERSIAN
    | KHAROSHTHI
    | UNKNOWN
    | BALINESE
    | CUNEIFORM
    | PHOENICIAN
    | PHAGS_PA
    | NKO
    | KAYAH_LI
    | LEPCHA
    | REJANG
    | SUNDANESE
    | SAURASHTRA
    | CHAM
    | OL_CHIKI
    | VAI
    | CARIAN
    | LYCIAN
    | LYDIAN
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    type language_t
    val getType : unit -> GObject.Type.t
    val forUnichar : char -> t
    val getSampleLanguage : t -> language_t
  end
