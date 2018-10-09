signature G_LIB_DATE_TIME =
  sig
    type t
    type time_span_t
    type time_val_t
    type time_zone_t
    val getType : unit -> GObject.Type.t
    val new :
      time_zone_t
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * real
       -> t
    val newFromTimevalLocal : time_val_t -> t
    val newFromTimevalUtc : time_val_t -> t
    val newFromUnixLocal : LargeInt.int -> t
    val newFromUnixUtc : LargeInt.int -> t
    val newLocal :
      LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * real
       -> t
    val newNow : time_zone_t -> t
    val newNowLocal : unit -> t
    val newNowUtc : unit -> t
    val newUtc :
      LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * real
       -> t
    val add :
      t
       -> time_span_t
       -> t
    val addDays :
      t
       -> LargeInt.int
       -> t
    val addFull :
      t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * real
       -> t
    val addHours :
      t
       -> LargeInt.int
       -> t
    val addMinutes :
      t
       -> LargeInt.int
       -> t
    val addMonths :
      t
       -> LargeInt.int
       -> t
    val addSeconds :
      t
       -> real
       -> t
    val addWeeks :
      t
       -> LargeInt.int
       -> t
    val addYears :
      t
       -> LargeInt.int
       -> t
    val difference :
      t
       -> t
       -> time_span_t
    val format :
      t
       -> string
       -> string
    val getDayOfMonth : t -> LargeInt.int
    val getDayOfWeek : t -> LargeInt.int
    val getDayOfYear : t -> LargeInt.int
    val getHour : t -> LargeInt.int
    val getMicrosecond : t -> LargeInt.int
    val getMinute : t -> LargeInt.int
    val getMonth : t -> LargeInt.int
    val getSecond : t -> LargeInt.int
    val getSeconds : t -> real
    val getTimezoneAbbreviation : t -> string
    val getUtcOffset : t -> time_span_t
    val getWeekNumberingYear : t -> LargeInt.int
    val getWeekOfYear : t -> LargeInt.int
    val getYear : t -> LargeInt.int
    val getYmd :
      t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val isDaylightSavings : t -> bool
    val toLocal : t -> t
    val toTimeval :
      t
       -> time_val_t
       -> bool
    val toTimezone :
      t
       -> time_zone_t
       -> t
    val toUnix : t -> LargeInt.int
    val toUtc : t -> t
  end
