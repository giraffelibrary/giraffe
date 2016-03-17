signature G_LIB_REGEX_ERROR =
  sig
    datatype t =
      COMPILE
    | OPTIMIZE
    | REPLACE
    | MATCH
    | INTERNAL
    | STRAY_BACKSLASH
    | MISSING_CONTROL_CHAR
    | UNRECOGNIZED_ESCAPE
    | QUANTIFIERS_OUT_OF_ORDER
    | QUANTIFIER_TOO_BIG
    | UNTERMINATED_CHARACTER_CLASS
    | INVALID_ESCAPE_IN_CHARACTER_CLASS
    | RANGE_OUT_OF_ORDER
    | NOTHING_TO_REPEAT
    | UNRECOGNIZED_CHARACTER
    | POSIX_NAMED_CLASS_OUTSIDE_CLASS
    | UNMATCHED_PARENTHESIS
    | INEXISTENT_SUBPATTERN_REFERENCE
    | UNTERMINATED_COMMENT
    | EXPRESSION_TOO_LARGE
    | MEMORY_ERROR
    | VARIABLE_LENGTH_LOOKBEHIND
    | MALFORMED_CONDITION
    | TOO_MANY_CONDITIONAL_BRANCHES
    | ASSERTION_EXPECTED
    | UNKNOWN_POSIX_CLASS_NAME
    | POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED
    | HEX_CODE_TOO_LARGE
    | INVALID_CONDITION
    | SINGLE_BYTE_MATCH_IN_LOOKBEHIND
    | INFINITE_LOOP
    | MISSING_SUBPATTERN_NAME_TERMINATOR
    | DUPLICATE_SUBPATTERN_NAME
    | MALFORMED_PROPERTY
    | UNKNOWN_PROPERTY
    | SUBPATTERN_NAME_TOO_LONG
    | TOO_MANY_SUBPATTERNS
    | INVALID_OCTAL_VALUE
    | TOO_MANY_BRANCHES_IN_DEFINE
    | DEFINE_REPETION
    | INCONSISTENT_NEWLINE_OPTIONS
    | MISSING_BACK_REFERENCE
    exception Error of t
    type error_handler
    val handler : error_handler
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
