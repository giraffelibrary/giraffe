signature PANGO_SCRIPT =
  sig
    datatype t =
      INVALIDCODE
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
    | OLDITALIC
    | ORIYA
    | RUNIC
    | SINHALA
    | SYRIAC
    | TAMIL
    | TELUGU
    | THAANA
    | THAI
    | TIBETAN
    | CANADIANABORIGINAL
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
    | LINEARB
    | TAILE
    | UGARITIC
    | NEWTAILUE
    | BUGINESE
    | GLAGOLITIC
    | TIFINAGH
    | SYLOTINAGRI
    | OLDPERSIAN
    | KHAROSHTHI
    | UNKNOWN
    | BALINESE
    | CUNEIFORM
    | PHOENICIAN
    | PHAGSPA
    | NKO
    | KAYAHLI
    | LEPCHA
    | REJANG
    | SUNDANESE
    | SAURASHTRA
    | CHAM
    | OLCHIKI
    | VAI
    | CARIAN
    | LYCIAN
    | LYDIAN
    val null : t
    val t : (t, t) GObject.Value.accessor
    type languagerecord_t
    val getType : unit -> GObject.Type.t
    val forUnichar : char -> t
    val getSampleLanguage : t -> languagerecord_t
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
        exception Value of FFI.Enum.val_
      end
  end
