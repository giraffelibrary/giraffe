signature G_LIB_UNICODE_SCRIPT =
  sig
    datatype t =
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
    | AVESTAN
    | BAMUM
    | EGYPTIAN_HIEROGLYPHS
    | IMPERIAL_ARAMAIC
    | INSCRIPTIONAL_PAHLAVI
    | INSCRIPTIONAL_PARTHIAN
    | JAVANESE
    | KAITHI
    | LISU
    | MEETEI_MAYEK
    | OLD_SOUTH_ARABIAN
    | OLD_TURKIC
    | SAMARITAN
    | TAI_THAM
    | TAI_VIET
    | BATAK
    | BRAHMI
    | MANDAIC
    val null : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
