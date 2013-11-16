structure GLibUnicodeType :>
  sig
    include G_LIB_UNICODE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
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
          | PRIVATEUSE => f 3
          | SURROGATE => f 4
          | LOWERCASELETTER => f 5
          | MODIFIERLETTER => f 6
          | OTHERLETTER => f 7
          | TITLECASELETTER => f 8
          | UPPERCASELETTER => f 9
          | SPACINGMARK => f 10
          | ENCLOSINGMARK => f 11
          | NONSPACINGMARK => f 12
          | DECIMALNUMBER => f 13
          | LETTERNUMBER => f 14
          | OTHERNUMBER => f 15
          | CONNECTPUNCTUATION => f 16
          | DASHPUNCTUATION => f 17
          | CLOSEPUNCTUATION => f 18
          | FINALPUNCTUATION => f 19
          | INITIALPUNCTUATION => f 20
          | OTHERPUNCTUATION => f 21
          | OPENPUNCTUATION => f 22
          | CURRENCYSYMBOL => f 23
          | MODIFIERSYMBOL => f 24
          | MATHSYMBOL => f 25
          | OTHERSYMBOL => f 26
          | LINESEPARATOR => f 27
          | PARAGRAPHSEPARATOR => f 28
          | SPACESEPARATOR => f 29
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => CONTROL
          | 1 => FORMAT
          | 2 => UNASSIGNED
          | 3 => PRIVATEUSE
          | 4 => SURROGATE
          | 5 => LOWERCASELETTER
          | 6 => MODIFIERLETTER
          | 7 => OTHERLETTER
          | 8 => TITLECASELETTER
          | 9 => UPPERCASELETTER
          | 10 => SPACINGMARK
          | 11 => ENCLOSINGMARK
          | 12 => NONSPACINGMARK
          | 13 => DECIMALNUMBER
          | 14 => LETTERNUMBER
          | 15 => OTHERNUMBER
          | 16 => CONNECTPUNCTUATION
          | 17 => DASHPUNCTUATION
          | 18 => CLOSEPUNCTUATION
          | 19 => FINALPUNCTUATION
          | 20 => INITIALPUNCTUATION
          | 21 => OTHERPUNCTUATION
          | 22 => OPENPUNCTUATION
          | 23 => CURRENCYSYMBOL
          | 24 => MODIFIERSYMBOL
          | 25 => MATHSYMBOL
          | 26 => OTHERSYMBOL
          | 27 => LINESEPARATOR
          | 28 => PARAGRAPHSEPARATOR
          | 29 => SPACESEPARATOR
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = CONTROL
  end
