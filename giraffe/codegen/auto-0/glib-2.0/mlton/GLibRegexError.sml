structure GLibRegexError :>
  sig
    include
      G_LIB_REGEX_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      COMPILE
    | OPTIMIZE
    | REPLACE
    | MATCH
    | INTERNAL
    | STRAYBACKSLASH
    | MISSINGCONTROLCHAR
    | UNRECOGNIZEDESCAPE
    | QUANTIFIERSOUTOFORDER
    | QUANTIFIERTOOBIG
    | UNTERMINATEDCHARACTERCLASS
    | INVALIDESCAPEINCHARACTERCLASS
    | RANGEOUTOFORDER
    | NOTHINGTOREPEAT
    | UNRECOGNIZEDCHARACTER
    | POSIXNAMEDCLASSOUTSIDECLASS
    | UNMATCHEDPARENTHESIS
    | INEXISTENTSUBPATTERNREFERENCE
    | UNTERMINATEDCOMMENT
    | EXPRESSIONTOOLARGE
    | MEMORYERROR
    | VARIABLELENGTHLOOKBEHIND
    | MALFORMEDCONDITION
    | TOOMANYCONDITIONALBRANCHES
    | ASSERTIONEXPECTED
    | UNKNOWNPOSIXCLASSNAME
    | POSIXCOLLATINGELEMENTSNOTSUPPORTED
    | HEXCODETOOLARGE
    | INVALIDCONDITION
    | SINGLEBYTEMATCHINLOOKBEHIND
    | INFINITELOOP
    | MISSINGSUBPATTERNNAMETERMINATOR
    | DUPLICATESUBPATTERNNAME
    | MALFORMEDPROPERTY
    | UNKNOWNPROPERTY
    | SUBPATTERNNAMETOOLONG
    | TOOMANYSUBPATTERNS
    | INVALIDOCTALVALUE
    | TOOMANYBRANCHESINDEFINE
    | DEFINEREPETION
    | INCONSISTENTNEWLINEOPTIONS
    | MISSINGBACKREFERENCE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            COMPILE => f 0
          | OPTIMIZE => f 1
          | REPLACE => f 2
          | MATCH => f 3
          | INTERNAL => f 4
          | STRAYBACKSLASH => f 101
          | MISSINGCONTROLCHAR => f 102
          | UNRECOGNIZEDESCAPE => f 103
          | QUANTIFIERSOUTOFORDER => f 104
          | QUANTIFIERTOOBIG => f 105
          | UNTERMINATEDCHARACTERCLASS => f 106
          | INVALIDESCAPEINCHARACTERCLASS => f 107
          | RANGEOUTOFORDER => f 108
          | NOTHINGTOREPEAT => f 109
          | UNRECOGNIZEDCHARACTER => f 112
          | POSIXNAMEDCLASSOUTSIDECLASS => f 113
          | UNMATCHEDPARENTHESIS => f 114
          | INEXISTENTSUBPATTERNREFERENCE => f 115
          | UNTERMINATEDCOMMENT => f 118
          | EXPRESSIONTOOLARGE => f 120
          | MEMORYERROR => f 121
          | VARIABLELENGTHLOOKBEHIND => f 125
          | MALFORMEDCONDITION => f 126
          | TOOMANYCONDITIONALBRANCHES => f 127
          | ASSERTIONEXPECTED => f 128
          | UNKNOWNPOSIXCLASSNAME => f 130
          | POSIXCOLLATINGELEMENTSNOTSUPPORTED => f 131
          | HEXCODETOOLARGE => f 134
          | INVALIDCONDITION => f 135
          | SINGLEBYTEMATCHINLOOKBEHIND => f 136
          | INFINITELOOP => f 140
          | MISSINGSUBPATTERNNAMETERMINATOR => f 142
          | DUPLICATESUBPATTERNNAME => f 143
          | MALFORMEDPROPERTY => f 146
          | UNKNOWNPROPERTY => f 147
          | SUBPATTERNNAMETOOLONG => f 148
          | TOOMANYSUBPATTERNS => f 149
          | INVALIDOCTALVALUE => f 151
          | TOOMANYBRANCHESINDEFINE => f 154
          | DEFINEREPETION => f 155
          | INCONSISTENTNEWLINEOPTIONS => f 156
          | MISSINGBACKREFERENCE => f 157
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => COMPILE
          | 1 => OPTIMIZE
          | 2 => REPLACE
          | 3 => MATCH
          | 4 => INTERNAL
          | 101 => STRAYBACKSLASH
          | 102 => MISSINGCONTROLCHAR
          | 103 => UNRECOGNIZEDESCAPE
          | 104 => QUANTIFIERSOUTOFORDER
          | 105 => QUANTIFIERTOOBIG
          | 106 => UNTERMINATEDCHARACTERCLASS
          | 107 => INVALIDESCAPEINCHARACTERCLASS
          | 108 => RANGEOUTOFORDER
          | 109 => NOTHINGTOREPEAT
          | 112 => UNRECOGNIZEDCHARACTER
          | 113 => POSIXNAMEDCLASSOUTSIDECLASS
          | 114 => UNMATCHEDPARENTHESIS
          | 115 => INEXISTENTSUBPATTERNREFERENCE
          | 118 => UNTERMINATEDCOMMENT
          | 120 => EXPRESSIONTOOLARGE
          | 121 => MEMORYERROR
          | 125 => VARIABLELENGTHLOOKBEHIND
          | 126 => MALFORMEDCONDITION
          | 127 => TOOMANYCONDITIONALBRANCHES
          | 128 => ASSERTIONEXPECTED
          | 130 => UNKNOWNPOSIXCLASSNAME
          | 131 => POSIXCOLLATINGELEMENTSNOTSUPPORTED
          | 134 => HEXCODETOOLARGE
          | 135 => INVALIDCONDITION
          | 136 => SINGLEBYTEMATCHINLOOKBEHIND
          | 140 => INFINITELOOP
          | 142 => MISSINGSUBPATTERNNAMETERMINATOR
          | 143 => DUPLICATESUBPATTERNNAME
          | 146 => MALFORMEDPROPERTY
          | 147 => UNKNOWNPROPERTY
          | 148 => SUBPATTERNNAMETOOLONG
          | 149 => TOOMANYSUBPATTERNS
          | 151 => INVALIDOCTALVALUE
          | 154 => TOOMANYBRANCHESINDEFINE
          | 155 => DEFINEREPETION
          | 156 => INCONSISTENTNEWLINEOPTIONS
          | 157 => MISSINGBACKREFERENCE
          | n => raise Value n
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-regex-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibRegexError = GLibRegexError.Error
