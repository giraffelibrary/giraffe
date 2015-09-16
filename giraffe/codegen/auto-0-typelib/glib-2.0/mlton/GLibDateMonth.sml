structure GLibDateMonth :>
  sig
    include G_LIB_DATE_MONTH
  end =
  struct
    datatype t =
      BAD_MONTH
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            BAD_MONTH => f 0
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
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => BAD_MONTH
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
    val null = BAD_MONTH
  end
