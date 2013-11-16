signature G_LIB_DATE_MONTH =
  sig
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
