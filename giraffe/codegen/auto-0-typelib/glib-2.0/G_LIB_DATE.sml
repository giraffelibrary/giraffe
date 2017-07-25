signature G_LIB_DATE =
  sig
    type t
    type time_val_t
    type date_month_t
    type date_weekday_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val newDmy :
      Word8.word
       * date_month_t
       * LargeInt.int
       -> t
    val newJulian : LargeInt.int -> t
    val addDays :
      t
       -> LargeInt.int
       -> unit
    val addMonths :
      t
       -> LargeInt.int
       -> unit
    val addYears :
      t
       -> LargeInt.int
       -> unit
    val clamp :
      t
       -> t * t
       -> unit
    val clear :
      t
       -> LargeInt.int
       -> unit
    val compare :
      t
       -> t
       -> LargeInt.int
    val daysBetween :
      t
       -> t
       -> LargeInt.int
    val getDay : t -> Word8.word
    val getDayOfYear : t -> LargeInt.int
    val getIso8601WeekOfYear : t -> LargeInt.int
    val getJulian : t -> LargeInt.int
    val getMondayWeekOfYear : t -> LargeInt.int
    val getMonth : t -> date_month_t
    val getSundayWeekOfYear : t -> LargeInt.int
    val getWeekday : t -> date_weekday_t
    val getYear : t -> LargeInt.int
    val isFirstOfMonth : t -> bool
    val isLastOfMonth : t -> bool
    val order :
      t
       -> t
       -> unit
    val setDay :
      t
       -> Word8.word
       -> unit
    val setDmy :
      t
       -> Word8.word
           * date_month_t
           * LargeInt.int
       -> unit
    val setJulian :
      t
       -> LargeInt.int
       -> unit
    val setMonth :
      t
       -> date_month_t
       -> unit
    val setParse :
      t
       -> string
       -> unit
    val setTimeT :
      t
       -> LargeInt.int
       -> unit
    val setTimeVal :
      t
       -> time_val_t
       -> unit
    val setYear :
      t
       -> LargeInt.int
       -> unit
    val subtractDays :
      t
       -> LargeInt.int
       -> unit
    val subtractMonths :
      t
       -> LargeInt.int
       -> unit
    val subtractYears :
      t
       -> LargeInt.int
       -> unit
    val valid : t -> bool
    val getDaysInMonth : date_month_t * LargeInt.int -> Word8.word
    val getMondayWeeksInYear : LargeInt.int -> Word8.word
    val getSundayWeeksInYear : LargeInt.int -> Word8.word
    val isLeapYear : LargeInt.int -> bool
    val strftime :
      string
       * LargeInt.int
       * string
       * t
       -> LargeInt.int
    val validDay : Word8.word -> bool
    val validDmy :
      Word8.word
       * date_month_t
       * LargeInt.int
       -> bool
    val validJulian : LargeInt.int -> bool
    val validMonth : date_month_t -> bool
    val validWeekday : date_weekday_t -> bool
    val validYear : LargeInt.int -> bool
  end
