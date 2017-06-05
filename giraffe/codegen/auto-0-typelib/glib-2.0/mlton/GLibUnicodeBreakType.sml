structure GLibUnicodeBreakType :> G_LIB_UNICODE_BREAK_TYPE =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = MANDATORY
        val toInt =
          fn
            MANDATORY => 0
          | CARRIAGE_RETURN => 1
          | LINE_FEED => 2
          | COMBINING_MARK => 3
          | SURROGATE => 4
          | ZERO_WIDTH_SPACE => 5
          | INSEPARABLE => 6
          | NON_BREAKING_GLUE => 7
          | CONTINGENT => 8
          | SPACE => 9
          | AFTER => 10
          | BEFORE => 11
          | BEFORE_AND_AFTER => 12
          | HYPHEN => 13
          | NON_STARTER => 14
          | OPEN_PUNCTUATION => 15
          | CLOSE_PUNCTUATION => 16
          | QUOTATION => 17
          | EXCLAMATION => 18
          | IDEOGRAPHIC => 19
          | NUMERIC => 20
          | INFIX_SEPARATOR => 21
          | SYMBOL => 22
          | ALPHABETIC => 23
          | PREFIX => 24
          | POSTFIX => 25
          | COMPLEX_CONTEXT => 26
          | AMBIGUOUS => 27
          | UNKNOWN => 28
          | NEXT_LINE => 29
          | WORD_JOINER => 30
          | HANGUL_L_JAMO => 31
          | HANGUL_V_JAMO => 32
          | HANGUL_T_JAMO => 33
          | HANGUL_LV_SYLLABLE => 34
          | HANGUL_LVT_SYLLABLE => 35
          | CLOSE_PARANTHESIS => 36
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
  end
