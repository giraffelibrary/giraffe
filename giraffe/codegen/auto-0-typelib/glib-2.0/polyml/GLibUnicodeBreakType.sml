structure GLibUnicodeBreakType :>
  sig
    include G_LIB_UNICODE_BREAK_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      MANDATORY
    | CARRIAGE_RETURN
    | LINE_FEED
    | COMBINING_MARK
    | SURROGATE
    | ZERO_WIDTH_SPACE
    | INSEPARABLE
    | NON_BREAKING_GLUE
    | CONTINGENT
    | SPACE
    | AFTER
    | BEFORE
    | BEFORE_AND_AFTER
    | HYPHEN
    | NON_STARTER
    | OPEN_PUNCTUATION
    | CLOSE_PUNCTUATION
    | QUOTATION
    | EXCLAMATION
    | IDEOGRAPHIC
    | NUMERIC
    | INFIX_SEPARATOR
    | SYMBOL
    | ALPHABETIC
    | PREFIX
    | POSTFIX
    | COMPLEX_CONTEXT
    | AMBIGUOUS
    | UNKNOWN
    | NEXT_LINE
    | WORD_JOINER
    | HANGUL_L_JAMO
    | HANGUL_V_JAMO
    | HANGUL_T_JAMO
    | HANGUL_LV_SYLLABLE
    | HANGUL_LVT_SYLLABLE
    | CLOSE_PARANTHESIS
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            MANDATORY => f 0
          | CARRIAGE_RETURN => f 1
          | LINE_FEED => f 2
          | COMBINING_MARK => f 3
          | SURROGATE => f 4
          | ZERO_WIDTH_SPACE => f 5
          | INSEPARABLE => f 6
          | NON_BREAKING_GLUE => f 7
          | CONTINGENT => f 8
          | SPACE => f 9
          | AFTER => f 10
          | BEFORE => f 11
          | BEFORE_AND_AFTER => f 12
          | HYPHEN => f 13
          | NON_STARTER => f 14
          | OPEN_PUNCTUATION => f 15
          | CLOSE_PUNCTUATION => f 16
          | QUOTATION => f 17
          | EXCLAMATION => f 18
          | IDEOGRAPHIC => f 19
          | NUMERIC => f 20
          | INFIX_SEPARATOR => f 21
          | SYMBOL => f 22
          | ALPHABETIC => f 23
          | PREFIX => f 24
          | POSTFIX => f 25
          | COMPLEX_CONTEXT => f 26
          | AMBIGUOUS => f 27
          | UNKNOWN => f 28
          | NEXT_LINE => f 29
          | WORD_JOINER => f 30
          | HANGUL_L_JAMO => f 31
          | HANGUL_V_JAMO => f 32
          | HANGUL_T_JAMO => f 33
          | HANGUL_LV_SYLLABLE => f 34
          | HANGUL_LVT_SYLLABLE => f 35
          | CLOSE_PARANTHESIS => f 36
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => MANDATORY
          | 1 => CARRIAGE_RETURN
          | 2 => LINE_FEED
          | 3 => COMBINING_MARK
          | 4 => SURROGATE
          | 5 => ZERO_WIDTH_SPACE
          | 6 => INSEPARABLE
          | 7 => NON_BREAKING_GLUE
          | 8 => CONTINGENT
          | 9 => SPACE
          | 10 => AFTER
          | 11 => BEFORE
          | 12 => BEFORE_AND_AFTER
          | 13 => HYPHEN
          | 14 => NON_STARTER
          | 15 => OPEN_PUNCTUATION
          | 16 => CLOSE_PUNCTUATION
          | 17 => QUOTATION
          | 18 => EXCLAMATION
          | 19 => IDEOGRAPHIC
          | 20 => NUMERIC
          | 21 => INFIX_SEPARATOR
          | 22 => SYMBOL
          | 23 => ALPHABETIC
          | 24 => PREFIX
          | 25 => POSTFIX
          | 26 => COMPLEX_CONTEXT
          | 27 => AMBIGUOUS
          | 28 => UNKNOWN
          | 29 => NEXT_LINE
          | 30 => WORD_JOINER
          | 31 => HANGUL_L_JAMO
          | 32 => HANGUL_V_JAMO
          | 33 => HANGUL_T_JAMO
          | 34 => HANGUL_LV_SYLLABLE
          | 35 => HANGUL_LVT_SYLLABLE
          | 36 => CLOSE_PARANTHESIS
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = MANDATORY
  end
