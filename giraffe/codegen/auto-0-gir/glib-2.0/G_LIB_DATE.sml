signature G_LIB_DATE =
  sig
    type t
    type time_val_t
    type date_day_t
    type date_month_t
    type date_weekday_t
    type date_year_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val newDmy :
      date_day_t
       * date_month_t
       * date_year_t
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
    val getDay : t -> date_day_t
    val getDayOfYear : t -> LargeInt.int
    val getIso8601WeekOfYear : t -> LargeInt.int
    val getJulian : t -> LargeInt.int
    val getMondayWeekOfYear : t -> LargeInt.int
    val getMonth : t -> date_month_t
    val getSundayWeekOfYear : t -> LargeInt.int
    val getWeekday : t -> date_weekday_t
    val getYear : t -> date_year_t
    val isFirstOfMonth : t -> bool
    val isLastOfMonth : t -> bool
    val order :
      t
       -> t
       -> unit
    val setDay :
      t
       -> date_day_t
       -> unit
    val setDmy :
      t
       -> date_day_t
           * date_month_t
           * date_year_t
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
       -> date_year_t
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
    val getDaysInMonth : date_month_t * date_year_t -> Word8.word
    val getMondayWeeksInYear : date_year_t -> Word8.word
    val getSundayWeeksInYear : date_year_t -> Word8.word
    val isLeapYear : date_year_t -> bool
    val strftime :
      string
       * LargeInt.int
       * string
       * t
       -> LargeInt.int
    val validDay : date_day_t -> bool
    val validDmy :
      date_day_t
       * date_month_t
       * date_year_t
       -> bool
    val validJulian : LargeInt.int -> bool
    val validMonth : date_month_t -> bool
    val validWeekday : date_weekday_t -> bool
    val validYear : date_year_t -> bool
  end
