structure GLibDateWeekday :>
  sig
    include G_LIB_DATE_WEEKDAY
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      BADWEEKDAY
    | MONDAY
    | TUESDAY
    | WEDNESDAY
    | THURSDAY
    | FRIDAY
    | SATURDAY
    | SUNDAY
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            BADWEEKDAY => f 0
          | MONDAY => f 1
          | TUESDAY => f 2
          | WEDNESDAY => f 3
          | THURSDAY => f 4
          | FRIDAY => f 5
          | SATURDAY => f 6
          | SUNDAY => f 7
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => BADWEEKDAY
          | 1 => MONDAY
          | 2 => TUESDAY
          | 3 => WEDNESDAY
          | 4 => THURSDAY
          | 5 => FRIDAY
          | 6 => SATURDAY
          | 7 => SUNDAY
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = BADWEEKDAY
  end
