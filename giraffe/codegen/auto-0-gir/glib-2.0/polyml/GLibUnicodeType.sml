structure GLibUnicodeType :>
  sig
    include G_LIB_UNICODE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CONTROL => f 0
          | FORMAT => f 1
          | UNASSIGNED => f 2
          | PRIVATE_USE => f 3
          | SURROGATE => f 4
          | LOWERCASE_LETTER => f 5
          | MODIFIER_LETTER => f 6
          | OTHER_LETTER => f 7
          | TITLECASE_LETTER => f 8
          | UPPERCASE_LETTER => f 9
          | SPACING_MARK => f 10
          | ENCLOSING_MARK => f 11
          | NON_SPACING_MARK => f 12
          | DECIMAL_NUMBER => f 13
          | LETTER_NUMBER => f 14
          | OTHER_NUMBER => f 15
          | CONNECT_PUNCTUATION => f 16
          | DASH_PUNCTUATION => f 17
          | CLOSE_PUNCTUATION => f 18
          | FINAL_PUNCTUATION => f 19
          | INITIAL_PUNCTUATION => f 20
          | OTHER_PUNCTUATION => f 21
          | OPEN_PUNCTUATION => f 22
          | CURRENCY_SYMBOL => f 23
          | MODIFIER_SYMBOL => f 24
          | MATH_SYMBOL => f 25
          | OTHER_SYMBOL => f 26
          | LINE_SEPARATOR => f 27
          | PARAGRAPH_SEPARATOR => f 28
          | SPACE_SEPARATOR => f 29
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = CONTROL
  end
