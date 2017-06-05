structure GLibUnicodeType :> G_LIB_UNICODE_TYPE =
  struct
    datatype enum =
      CONTROL
    | FORMAT
    | UNASSIGNED
    | PRIVATE_USE
    | SURROGATE
    | LOWERCASE_LETTER
    | MODIFIER_LETTER
    | OTHER_LETTER
    | TITLECASE_LETTER
    | UPPERCASE_LETTER
    | SPACING_MARK
    | ENCLOSING_MARK
    | NON_SPACING_MARK
    | DECIMAL_NUMBER
    | LETTER_NUMBER
    | OTHER_NUMBER
    | CONNECT_PUNCTUATION
    | DASH_PUNCTUATION
    | CLOSE_PUNCTUATION
    | FINAL_PUNCTUATION
    | INITIAL_PUNCTUATION
    | OTHER_PUNCTUATION
    | OPEN_PUNCTUATION
    | CURRENCY_SYMBOL
    | MODIFIER_SYMBOL
    | MATH_SYMBOL
    | OTHER_SYMBOL
    | LINE_SEPARATOR
    | PARAGRAPH_SEPARATOR
    | SPACE_SEPARATOR
    structure Enum =
      Enum(
        type enum = enum
        val null = CONTROL
        val toInt =
          fn
            CONTROL => 0
          | FORMAT => 1
          | UNASSIGNED => 2
          | PRIVATE_USE => 3
          | SURROGATE => 4
          | LOWERCASE_LETTER => 5
          | MODIFIER_LETTER => 6
          | OTHER_LETTER => 7
          | TITLECASE_LETTER => 8
          | UPPERCASE_LETTER => 9
          | SPACING_MARK => 10
          | ENCLOSING_MARK => 11
          | NON_SPACING_MARK => 12
          | DECIMAL_NUMBER => 13
          | LETTER_NUMBER => 14
          | OTHER_NUMBER => 15
          | CONNECT_PUNCTUATION => 16
          | DASH_PUNCTUATION => 17
          | CLOSE_PUNCTUATION => 18
          | FINAL_PUNCTUATION => 19
          | INITIAL_PUNCTUATION => 20
          | OTHER_PUNCTUATION => 21
          | OPEN_PUNCTUATION => 22
          | CURRENCY_SYMBOL => 23
          | MODIFIER_SYMBOL => 24
          | MATH_SYMBOL => 25
          | OTHER_SYMBOL => 26
          | LINE_SEPARATOR => 27
          | PARAGRAPH_SEPARATOR => 28
          | SPACE_SEPARATOR => 29
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CONTROL
          | 1 => FORMAT
          | 2 => UNASSIGNED
          | 3 => PRIVATE_USE
          | 4 => SURROGATE
          | 5 => LOWERCASE_LETTER
          | 6 => MODIFIER_LETTER
          | 7 => OTHER_LETTER
          | 8 => TITLECASE_LETTER
          | 9 => UPPERCASE_LETTER
          | 10 => SPACING_MARK
          | 11 => ENCLOSING_MARK
          | 12 => NON_SPACING_MARK
          | 13 => DECIMAL_NUMBER
          | 14 => LETTER_NUMBER
          | 15 => OTHER_NUMBER
          | 16 => CONNECT_PUNCTUATION
          | 17 => DASH_PUNCTUATION
          | 18 => CLOSE_PUNCTUATION
          | 19 => FINAL_PUNCTUATION
          | 20 => INITIAL_PUNCTUATION
          | 21 => OTHER_PUNCTUATION
          | 22 => OPEN_PUNCTUATION
          | 23 => CURRENCY_SYMBOL
          | 24 => MODIFIER_SYMBOL
          | 25 => MATH_SYMBOL
          | 26 => OTHER_SYMBOL
          | 27 => LINE_SEPARATOR
          | 28 => PARAGRAPH_SEPARATOR
          | 29 => SPACE_SEPARATOR
          | n => raise Value n
      )
    open Enum
  end
