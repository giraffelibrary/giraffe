structure GLibDateWeekday :>
  sig
    include G_LIB_DATE_WEEKDAY
  end =
  struct
    datatype t =
      BAD_WEEKDAY
    | MONDAY
    | TUESDAY
    | WEDNESDAY
    | THURSDAY
    | FRIDAY
    | SATURDAY
    | SUNDAY
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            BAD_WEEKDAY => f 0
          | MONDAY => f 1
          | TUESDAY => f 2
          | WEDNESDAY => f 3
          | THURSDAY => f 4
          | FRIDAY => f 5
          | SATURDAY => f 6
          | SUNDAY => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => BAD_WEEKDAY
          | 1 => MONDAY
          | 2 => TUESDAY
          | 3 => WEDNESDAY
          | 4 => THURSDAY
          | 5 => FRIDAY
          | 6 => SATURDAY
          | 7 => SUNDAY
          | n => raise Value n
      end
    val null = BAD_WEEKDAY
  end
