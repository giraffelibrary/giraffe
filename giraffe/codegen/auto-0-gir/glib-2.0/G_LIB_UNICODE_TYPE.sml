signature G_LIB_UNICODE_TYPE =
  sig
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
