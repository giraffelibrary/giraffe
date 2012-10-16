structure GLibUnicodeBreakType :>
  sig
    include G_LIB_UNICODE_BREAK_TYPE
  end =
  struct
    datatype t =
      MANDATORY
    | CARRIAGERETURN
    | LINEFEED
    | COMBININGMARK
    | SURROGATE
    | ZEROWIDTHSPACE
    | INSEPARABLE
    | NONBREAKINGGLUE
    | CONTINGENT
    | SPACE
    | AFTER
    | BEFORE
    | BEFOREANDAFTER
    | HYPHEN
    | NONSTARTER
    | OPENPUNCTUATION
    | CLOSEPUNCTUATION
    | QUOTATION
    | EXCLAMATION
    | IDEOGRAPHIC
    | NUMERIC
    | INFIXSEPARATOR
    | SYMBOL
    | ALPHABETIC
    | PREFIX
    | POSTFIX
    | COMPLEXCONTEXT
    | AMBIGUOUS
    | UNKNOWN
    | NEXTLINE
    | WORDJOINER
    | HANGULLJAMO
    | HANGULVJAMO
    | HANGULTJAMO
    | HANGULLVSYLLABLE
    | HANGULLVTSYLLABLE
    | CLOSEPARANTHESIS
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            MANDATORY => f 0
          | CARRIAGERETURN => f 1
          | LINEFEED => f 2
          | COMBININGMARK => f 3
          | SURROGATE => f 4
          | ZEROWIDTHSPACE => f 5
          | INSEPARABLE => f 6
          | NONBREAKINGGLUE => f 7
          | CONTINGENT => f 8
          | SPACE => f 9
          | AFTER => f 10
          | BEFORE => f 11
          | BEFOREANDAFTER => f 12
          | HYPHEN => f 13
          | NONSTARTER => f 14
          | OPENPUNCTUATION => f 15
          | CLOSEPUNCTUATION => f 16
          | QUOTATION => f 17
          | EXCLAMATION => f 18
          | IDEOGRAPHIC => f 19
          | NUMERIC => f 20
          | INFIXSEPARATOR => f 21
          | SYMBOL => f 22
          | ALPHABETIC => f 23
          | PREFIX => f 24
          | POSTFIX => f 25
          | COMPLEXCONTEXT => f 26
          | AMBIGUOUS => f 27
          | UNKNOWN => f 28
          | NEXTLINE => f 29
          | WORDJOINER => f 30
          | HANGULLJAMO => f 31
          | HANGULVJAMO => f 32
          | HANGULTJAMO => f 33
          | HANGULLVSYLLABLE => f 34
          | HANGULLVTSYLLABLE => f 35
          | CLOSEPARANTHESIS => f 36
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => MANDATORY
          | 1 => CARRIAGERETURN
          | 2 => LINEFEED
          | 3 => COMBININGMARK
          | 4 => SURROGATE
          | 5 => ZEROWIDTHSPACE
          | 6 => INSEPARABLE
          | 7 => NONBREAKINGGLUE
          | 8 => CONTINGENT
          | 9 => SPACE
          | 10 => AFTER
          | 11 => BEFORE
          | 12 => BEFOREANDAFTER
          | 13 => HYPHEN
          | 14 => NONSTARTER
          | 15 => OPENPUNCTUATION
          | 16 => CLOSEPUNCTUATION
          | 17 => QUOTATION
          | 18 => EXCLAMATION
          | 19 => IDEOGRAPHIC
          | 20 => NUMERIC
          | 21 => INFIXSEPARATOR
          | 22 => SYMBOL
          | 23 => ALPHABETIC
          | 24 => PREFIX
          | 25 => POSTFIX
          | 26 => COMPLEXCONTEXT
          | 27 => AMBIGUOUS
          | 28 => UNKNOWN
          | 29 => NEXTLINE
          | 30 => WORDJOINER
          | 31 => HANGULLJAMO
          | 32 => HANGULVJAMO
          | 33 => HANGULTJAMO
          | 34 => HANGULLVSYLLABLE
          | 35 => HANGULLVTSYLLABLE
          | 36 => CLOSEPARANTHESIS
          | n => raise Value n
      end
    val null = MANDATORY
  end
