signature G_LIB_UNICODE_TYPE =
  sig
    datatype t =
      CONTROL
    | FORMAT
    | UNASSIGNED
    | PRIVATEUSE
    | SURROGATE
    | LOWERCASELETTER
    | MODIFIERLETTER
    | OTHERLETTER
    | TITLECASELETTER
    | UPPERCASELETTER
    | SPACINGMARK
    | ENCLOSINGMARK
    | NONSPACINGMARK
    | DECIMALNUMBER
    | LETTERNUMBER
    | OTHERNUMBER
    | CONNECTPUNCTUATION
    | DASHPUNCTUATION
    | CLOSEPUNCTUATION
    | FINALPUNCTUATION
    | INITIALPUNCTUATION
    | OTHERPUNCTUATION
    | OPENPUNCTUATION
    | CURRENCYSYMBOL
    | MODIFIERSYMBOL
    | MATHSYMBOL
    | OTHERSYMBOL
    | LINESEPARATOR
    | PARAGRAPHSEPARATOR
    | SPACESEPARATOR
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
        exception Value of FFI.Enum.val_
      end
  end
