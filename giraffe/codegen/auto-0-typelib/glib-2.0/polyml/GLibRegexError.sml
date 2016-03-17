structure GLibRegexError :>
  sig
    include
      G_LIB_REGEX_ERROR
        where type error_handler = GLibErrorRecord.handler
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            COMPILE => f 0
          | OPTIMIZE => f 1
          | REPLACE => f 2
          | MATCH => f 3
          | INTERNAL => f 4
          | STRAY_BACKSLASH => f 101
          | MISSING_CONTROL_CHAR => f 102
          | UNRECOGNIZED_ESCAPE => f 103
          | QUANTIFIERS_OUT_OF_ORDER => f 104
          | QUANTIFIER_TOO_BIG => f 105
          | UNTERMINATED_CHARACTER_CLASS => f 106
          | INVALID_ESCAPE_IN_CHARACTER_CLASS => f 107
          | RANGE_OUT_OF_ORDER => f 108
          | NOTHING_TO_REPEAT => f 109
          | UNRECOGNIZED_CHARACTER => f 112
          | POSIX_NAMED_CLASS_OUTSIDE_CLASS => f 113
          | UNMATCHED_PARENTHESIS => f 114
          | INEXISTENT_SUBPATTERN_REFERENCE => f 115
          | UNTERMINATED_COMMENT => f 118
          | EXPRESSION_TOO_LARGE => f 120
          | MEMORY_ERROR => f 121
          | VARIABLE_LENGTH_LOOKBEHIND => f 125
          | MALFORMED_CONDITION => f 126
          | TOO_MANY_CONDITIONAL_BRANCHES => f 127
          | ASSERTION_EXPECTED => f 128
          | UNKNOWN_POSIX_CLASS_NAME => f 130
          | POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED => f 131
          | HEX_CODE_TOO_LARGE => f 134
          | INVALID_CONDITION => f 135
          | SINGLE_BYTE_MATCH_IN_LOOKBEHIND => f 136
          | INFINITE_LOOP => f 140
          | MISSING_SUBPATTERN_NAME_TERMINATOR => f 142
          | DUPLICATE_SUBPATTERN_NAME => f 143
          | MALFORMED_PROPERTY => f 146
          | UNKNOWN_PROPERTY => f 147
          | SUBPATTERN_NAME_TOO_LONG => f 148
          | TOO_MANY_SUBPATTERNS => f 149
          | INVALID_OCTAL_VALUE => f 151
          | TOO_MANY_BRANCHES_IN_DEFINE => f 154
          | DEFINE_REPETION => f 155
          | INCONSISTENT_NEWLINE_OPTIONS => f 156
          | MISSING_BACK_REFERENCE => f 157
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => COMPILE
          | 1 => OPTIMIZE
          | 2 => REPLACE
          | 3 => MATCH
          | 4 => INTERNAL
          | 101 => STRAY_BACKSLASH
          | 102 => MISSING_CONTROL_CHAR
          | 103 => UNRECOGNIZED_ESCAPE
          | 104 => QUANTIFIERS_OUT_OF_ORDER
          | 105 => QUANTIFIER_TOO_BIG
          | 106 => UNTERMINATED_CHARACTER_CLASS
          | 107 => INVALID_ESCAPE_IN_CHARACTER_CLASS
          | 108 => RANGE_OUT_OF_ORDER
          | 109 => NOTHING_TO_REPEAT
          | 112 => UNRECOGNIZED_CHARACTER
          | 113 => POSIX_NAMED_CLASS_OUTSIDE_CLASS
          | 114 => UNMATCHED_PARENTHESIS
          | 115 => INEXISTENT_SUBPATTERN_REFERENCE
          | 118 => UNTERMINATED_COMMENT
          | 120 => EXPRESSION_TOO_LARGE
          | 121 => MEMORY_ERROR
          | 125 => VARIABLE_LENGTH_LOOKBEHIND
          | 126 => MALFORMED_CONDITION
          | 127 => TOO_MANY_CONDITIONAL_BRANCHES
          | 128 => ASSERTION_EXPECTED
          | 130 => UNKNOWN_POSIX_CLASS_NAME
          | 131 => POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED
          | 134 => HEX_CODE_TOO_LARGE
          | 135 => INVALID_CONDITION
          | 136 => SINGLE_BYTE_MATCH_IN_LOOKBEHIND
          | 140 => INFINITE_LOOP
          | 142 => MISSING_SUBPATTERN_NAME_TERMINATOR
          | 143 => DUPLICATE_SUBPATTERN_NAME
          | 146 => MALFORMED_PROPERTY
          | 147 => UNKNOWN_PROPERTY
          | 148 => SUBPATTERN_NAME_TOO_LONG
          | 149 => TOO_MANY_SUBPATTERNS
          | 151 => INVALID_OCTAL_VALUE
          | 154 => TOO_MANY_BRANCHES_IN_DEFINE
          | 155 => DEFINE_REPETION
          | 156 => INCONSISTENT_NEWLINE_OPTIONS
          | 157 => MISSING_BACK_REFERENCE
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-regex-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibRegexError = GLibRegexError.Error
