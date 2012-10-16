structure GLibDateMonth :>
  sig
    include G_LIB_DATE_MONTH
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      BADMONTH
    | JANUARY
    | FEBRUARY
    | MARCH
    | APRIL
    | MAY
    | JUNE
    | JULY
    | AUGUST
    | SEPTEMBER
    | OCTOBER
    | NOVEMBER
    | DECEMBER
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            BADMONTH => f 0
          | JANUARY => f 1
          | FEBRUARY => f 2
          | MARCH => f 3
          | APRIL => f 4
          | MAY => f 5
          | JUNE => f 6
          | JULY => f 7
          | AUGUST => f 8
          | SEPTEMBER => f 9
          | OCTOBER => f 10
          | NOVEMBER => f 11
          | DECEMBER => f 12
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => BADMONTH
          | 1 => JANUARY
          | 2 => FEBRUARY
          | 3 => MARCH
          | 4 => APRIL
          | 5 => MAY
          | 6 => JUNE
          | 7 => JULY
          | 8 => AUGUST
          | 9 => SEPTEMBER
          | 10 => OCTOBER
          | 11 => NOVEMBER
          | 12 => DECEMBER
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = BADMONTH
  end
