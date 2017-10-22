signature G_LIB_REGEX_ERROR =
  sig
    datatype enum =
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
    | INVALID_RELATIVE_REFERENCE
    | BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN
    | UNKNOWN_BACKTRACKING_CONTROL_VERB
    | NUMBER_TOO_BIG
    | MISSING_SUBPATTERN_NAME
    | MISSING_DIGIT
    | INVALID_DATA_CHARACTER
    | EXTRA_SUBPATTERN_NAME
    | BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED
    | INVALID_CONTROL_CHAR
    | MISSING_NAME
    | NOT_SUPPORTED_IN_CLASS
    | TOO_MANY_FORWARD_REFERENCES
    | NAME_TOO_LONG
    | CHARACTER_VALUE_TOO_LARGE
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
