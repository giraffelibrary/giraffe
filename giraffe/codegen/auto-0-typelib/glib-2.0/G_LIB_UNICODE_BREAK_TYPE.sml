signature G_LIB_UNICODE_BREAK_TYPE =
  sig
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
