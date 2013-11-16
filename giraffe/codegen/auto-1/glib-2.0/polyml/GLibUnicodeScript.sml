structure GLibUnicodeScript :>
  sig
    include G_LIB_UNICODE_SCRIPT
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
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
    | AVESTAN
    | BAMUM
    | EGYPTIANHIEROGLYPHS
    | IMPERIALARAMAIC
    | INSCRIPTIONALPAHLAVI
    | INSCRIPTIONALPARTHIAN
    | JAVANESE
    | KAITHI
    | LISU
    | MEETEIMAYEK
    | OLDSOUTHARABIAN
    | OLDTURKIC
    | SAMARITAN
    | TAITHAM
    | TAIVIET
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
            INVALIDCODE => f ~1
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
          | OLDITALIC => f 30
          | ORIYA => f 31
          | RUNIC => f 32
          | SINHALA => f 33
          | SYRIAC => f 34
          | TAMIL => f 35
          | TELUGU => f 36
          | THAANA => f 37
          | THAI => f 38
          | TIBETAN => f 39
          | CANADIANABORIGINAL => f 40
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
          | LINEARB => f 51
          | TAILE => f 52
          | UGARITIC => f 53
          | NEWTAILUE => f 54
          | BUGINESE => f 55
          | GLAGOLITIC => f 56
          | TIFINAGH => f 57
          | SYLOTINAGRI => f 58
          | OLDPERSIAN => f 59
          | KHAROSHTHI => f 60
          | UNKNOWN => f 61
          | BALINESE => f 62
          | CUNEIFORM => f 63
          | PHOENICIAN => f 64
          | PHAGSPA => f 65
          | NKO => f 66
          | KAYAHLI => f 67
          | LEPCHA => f 68
          | REJANG => f 69
          | SUNDANESE => f 70
          | SAURASHTRA => f 71
          | CHAM => f 72
          | OLCHIKI => f 73
          | VAI => f 74
          | CARIAN => f 75
          | LYCIAN => f 76
          | LYDIAN => f 77
          | AVESTAN => f 78
          | BAMUM => f 79
          | EGYPTIANHIEROGLYPHS => f 80
          | IMPERIALARAMAIC => f 81
          | INSCRIPTIONALPAHLAVI => f 82
          | INSCRIPTIONALPARTHIAN => f 83
          | JAVANESE => f 84
          | KAITHI => f 85
          | LISU => f 86
          | MEETEIMAYEK => f 87
          | OLDSOUTHARABIAN => f 88
          | OLDTURKIC => f 89
          | SAMARITAN => f 90
          | TAITHAM => f 91
          | TAIVIET => f 92
          | BATAK => f 93
          | BRAHMI => f 94
          | MANDAIC => f 95
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            ~1 => INVALIDCODE
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
          | 30 => OLDITALIC
          | 31 => ORIYA
          | 32 => RUNIC
          | 33 => SINHALA
          | 34 => SYRIAC
          | 35 => TAMIL
          | 36 => TELUGU
          | 37 => THAANA
          | 38 => THAI
          | 39 => TIBETAN
          | 40 => CANADIANABORIGINAL
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
          | 51 => LINEARB
          | 52 => TAILE
          | 53 => UGARITIC
          | 54 => NEWTAILUE
          | 55 => BUGINESE
          | 56 => GLAGOLITIC
          | 57 => TIFINAGH
          | 58 => SYLOTINAGRI
          | 59 => OLDPERSIAN
          | 60 => KHAROSHTHI
          | 61 => UNKNOWN
          | 62 => BALINESE
          | 63 => CUNEIFORM
          | 64 => PHOENICIAN
          | 65 => PHAGSPA
          | 66 => NKO
          | 67 => KAYAHLI
          | 68 => LEPCHA
          | 69 => REJANG
          | 70 => SUNDANESE
          | 71 => SAURASHTRA
          | 72 => CHAM
          | 73 => OLCHIKI
          | 74 => VAI
          | 75 => CARIAN
          | 76 => LYCIAN
          | 77 => LYDIAN
          | 78 => AVESTAN
          | 79 => BAMUM
          | 80 => EGYPTIANHIEROGLYPHS
          | 81 => IMPERIALARAMAIC
          | 82 => INSCRIPTIONALPAHLAVI
          | 83 => INSCRIPTIONALPARTHIAN
          | 84 => JAVANESE
          | 85 => KAITHI
          | 86 => LISU
          | 87 => MEETEIMAYEK
          | 88 => OLDSOUTHARABIAN
          | 89 => OLDTURKIC
          | 90 => SAMARITAN
          | 91 => TAITHAM
          | 92 => TAIVIET
          | 93 => BATAK
          | 94 => BRAHMI
          | 95 => MANDAIC
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = INVALIDCODE
  end
