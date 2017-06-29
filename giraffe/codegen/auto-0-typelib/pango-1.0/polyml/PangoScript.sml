structure PangoScript :>
  PANGO_SCRIPT
    where type language_t = PangoLanguageRecord.t =
  struct
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
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID_CODE
        val toInt =
          fn
            INVALID_CODE => ~1
          | COMMON => 0
          | INHERITED => 1
          | ARABIC => 2
          | ARMENIAN => 3
          | BENGALI => 4
          | BOPOMOFO => 5
          | CHEROKEE => 6
          | COPTIC => 7
          | CYRILLIC => 8
          | DESERET => 9
          | DEVANAGARI => 10
          | ETHIOPIC => 11
          | GEORGIAN => 12
          | GOTHIC => 13
          | GREEK => 14
          | GUJARATI => 15
          | GURMUKHI => 16
          | HAN => 17
          | HANGUL => 18
          | HEBREW => 19
          | HIRAGANA => 20
          | KANNADA => 21
          | KATAKANA => 22
          | KHMER => 23
          | LAO => 24
          | LATIN => 25
          | MALAYALAM => 26
          | MONGOLIAN => 27
          | MYANMAR => 28
          | OGHAM => 29
          | OLD_ITALIC => 30
          | ORIYA => 31
          | RUNIC => 32
          | SINHALA => 33
          | SYRIAC => 34
          | TAMIL => 35
          | TELUGU => 36
          | THAANA => 37
          | THAI => 38
          | TIBETAN => 39
          | CANADIAN_ABORIGINAL => 40
          | YI => 41
          | TAGALOG => 42
          | HANUNOO => 43
          | BUHID => 44
          | TAGBANWA => 45
          | BRAILLE => 46
          | CYPRIOT => 47
          | LIMBU => 48
          | OSMANYA => 49
          | SHAVIAN => 50
          | LINEAR_B => 51
          | TAI_LE => 52
          | UGARITIC => 53
          | NEW_TAI_LUE => 54
          | BUGINESE => 55
          | GLAGOLITIC => 56
          | TIFINAGH => 57
          | SYLOTI_NAGRI => 58
          | OLD_PERSIAN => 59
          | KHAROSHTHI => 60
          | UNKNOWN => 61
          | BALINESE => 62
          | CUNEIFORM => 63
          | PHOENICIAN => 64
          | PHAGS_PA => 65
          | NKO => 66
          | KAYAH_LI => 67
          | LEPCHA => 68
          | REJANG => 69
          | SUNDANESE => 70
          | SAURASHTRA => 71
          | CHAM => 72
          | OL_CHIKI => 73
          | VAI => 74
          | CARIAN => 75
          | LYCIAN => 76
          | LYDIAN => 77
        exception Value of GInt32.t
        val fromInt =
          fn
            ~1 => INVALID_CODE
          | 0 => COMMON
          | 1 => INHERITED
          | 2 => ARABIC
          | 3 => ARMENIAN
          | 4 => BENGALI
          | 5 => BOPOMOFO
          | 6 => CHEROKEE
          | 7 => COPTIC
          | 8 => CYRILLIC
          | 9 => DESERET
          | 10 => DEVANAGARI
          | 11 => ETHIOPIC
          | 12 => GEORGIAN
          | 13 => GOTHIC
          | 14 => GREEK
          | 15 => GUJARATI
          | 16 => GURMUKHI
          | 17 => HAN
          | 18 => HANGUL
          | 19 => HEBREW
          | 20 => HIRAGANA
          | 21 => KANNADA
          | 22 => KATAKANA
          | 23 => KHMER
          | 24 => LAO
          | 25 => LATIN
          | 26 => MALAYALAM
          | 27 => MONGOLIAN
          | 28 => MYANMAR
          | 29 => OGHAM
          | 30 => OLD_ITALIC
          | 31 => ORIYA
          | 32 => RUNIC
          | 33 => SINHALA
          | 34 => SYRIAC
          | 35 => TAMIL
          | 36 => TELUGU
          | 37 => THAANA
          | 38 => THAI
          | 39 => TIBETAN
          | 40 => CANADIAN_ABORIGINAL
          | 41 => YI
          | 42 => TAGALOG
          | 43 => HANUNOO
          | 44 => BUHID
          | 45 => TAGBANWA
          | 46 => BRAILLE
          | 47 => CYPRIOT
          | 48 => LIMBU
          | 49 => OSMANYA
          | 50 => SHAVIAN
          | 51 => LINEAR_B
          | 52 => TAI_LE
          | 53 => UGARITIC
          | 54 => NEW_TAI_LUE
          | 55 => BUGINESE
          | 56 => GLAGOLITIC
          | 57 => TIFINAGH
          | 58 => SYLOTI_NAGRI
          | 59 => OLD_PERSIAN
          | 60 => KHAROSHTHI
          | 61 => UNKNOWN
          | 62 => BALINESE
          | 63 => CUNEIFORM
          | 64 => PHOENICIAN
          | 65 => PHAGS_PA
          | 66 => NKO
          | 67 => KAYAH_LI
          | 68 => LEPCHA
          | 69 => REJANG
          | 70 => SUNDANESE
          | 71 => SAURASHTRA
          | 72 => CHAM
          | 73 => OL_CHIKI
          | 74 => VAI
          | 75 => CARIAN
          | 76 => LYCIAN
          | 77 => LYDIAN
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_script_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    local
      open PolyMLFFI
    in
      val forUnichar_ = call (getSymbol "pango_script_for_unichar") (GChar.PolyML.cVal --> PolyML.cVal)
      val getSampleLanguage_ = call (getSymbol "pango_script_get_sample_language") (PolyML.cVal --> PangoLanguageRecord.PolyML.cPtr)
    end
    type language_t = PangoLanguageRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forUnichar ch = (GChar.FFI.withVal ---> FFI.fromVal) forUnichar_ ch
    fun getSampleLanguage script = (FFI.withVal ---> PangoLanguageRecord.FFI.fromPtr true) getSampleLanguage_ script
  end
