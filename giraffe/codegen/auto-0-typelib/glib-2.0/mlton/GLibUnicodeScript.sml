structure GLibUnicodeScript :>
  sig
    include G_LIB_UNICODE_SCRIPT
  end =
  struct
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID_CODE => f ~1
          | COMMON => f 0
          | INHERITED => f 1
          | ARABIC => f 2
          | ARMENIAN => f 3
          | BENGALI => f 4
          | BOPOMOFO => f 5
          | CHEROKEE => f 6
          | COPTIC => f 7
          | CYRILLIC => f 8
          | DESERET => f 9
          | DEVANAGARI => f 10
          | ETHIOPIC => f 11
          | GEORGIAN => f 12
          | GOTHIC => f 13
          | GREEK => f 14
          | GUJARATI => f 15
          | GURMUKHI => f 16
          | HAN => f 17
          | HANGUL => f 18
          | HEBREW => f 19
          | HIRAGANA => f 20
          | KANNADA => f 21
          | KATAKANA => f 22
          | KHMER => f 23
          | LAO => f 24
          | LATIN => f 25
          | MALAYALAM => f 26
          | MONGOLIAN => f 27
          | MYANMAR => f 28
          | OGHAM => f 29
          | OLD_ITALIC => f 30
          | ORIYA => f 31
          | RUNIC => f 32
          | SINHALA => f 33
          | SYRIAC => f 34
          | TAMIL => f 35
          | TELUGU => f 36
          | THAANA => f 37
          | THAI => f 38
          | TIBETAN => f 39
          | CANADIAN_ABORIGINAL => f 40
          | YI => f 41
          | TAGALOG => f 42
          | HANUNOO => f 43
          | BUHID => f 44
          | TAGBANWA => f 45
          | BRAILLE => f 46
          | CYPRIOT => f 47
          | LIMBU => f 48
          | OSMANYA => f 49
          | SHAVIAN => f 50
          | LINEAR_B => f 51
          | TAI_LE => f 52
          | UGARITIC => f 53
          | NEW_TAI_LUE => f 54
          | BUGINESE => f 55
          | GLAGOLITIC => f 56
          | TIFINAGH => f 57
          | SYLOTI_NAGRI => f 58
          | OLD_PERSIAN => f 59
          | KHAROSHTHI => f 60
          | UNKNOWN => f 61
          | BALINESE => f 62
          | CUNEIFORM => f 63
          | PHOENICIAN => f 64
          | PHAGS_PA => f 65
          | NKO => f 66
          | KAYAH_LI => f 67
          | LEPCHA => f 68
          | REJANG => f 69
          | SUNDANESE => f 70
          | SAURASHTRA => f 71
          | CHAM => f 72
          | OL_CHIKI => f 73
          | VAI => f 74
          | CARIAN => f 75
          | LYCIAN => f 76
          | LYDIAN => f 77
          | AVESTAN => f 78
          | BAMUM => f 79
          | EGYPTIAN_HIEROGLYPHS => f 80
          | IMPERIAL_ARAMAIC => f 81
          | INSCRIPTIONAL_PAHLAVI => f 82
          | INSCRIPTIONAL_PARTHIAN => f 83
          | JAVANESE => f 84
          | KAITHI => f 85
          | LISU => f 86
          | MEETEI_MAYEK => f 87
          | OLD_SOUTH_ARABIAN => f 88
          | OLD_TURKIC => f 89
          | SAMARITAN => f 90
          | TAI_THAM => f 91
          | TAI_VIET => f 92
          | BATAK => f 93
          | BRAHMI => f 94
          | MANDAIC => f 95
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
          | 78 => AVESTAN
          | 79 => BAMUM
          | 80 => EGYPTIAN_HIEROGLYPHS
          | 81 => IMPERIAL_ARAMAIC
          | 82 => INSCRIPTIONAL_PAHLAVI
          | 83 => INSCRIPTIONAL_PARTHIAN
          | 84 => JAVANESE
          | 85 => KAITHI
          | 86 => LISU
          | 87 => MEETEI_MAYEK
          | 88 => OLD_SOUTH_ARABIAN
          | 89 => OLD_TURKIC
          | 90 => SAMARITAN
          | 91 => TAI_THAM
          | 92 => TAI_VIET
          | 93 => BATAK
          | 94 => BRAHMI
          | 95 => MANDAIC
          | n => raise Value n
      end
    val null = INVALID_CODE
  end
