structure GLibDate :>
  G_LIB_DATE
    where type t = GLibDateRecord.t
    where type time_t = GLibTime.t
    where type time_val_t = GLibTimeValRecord.t
    where type date_day_t = GLibDateDay.t
    where type date_month_t = GLibDateMonth.t
    where type date_weekday_t = GLibDateWeekday.t
    where type date_year_t = GLibDateYear.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_date_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_date_new") (cVoid --> GLibDateRecord.PolyML.cPtr)
      val newDmy_ =
        call (getSymbol "g_date_new_dmy")
          (
            GLibDateDay.PolyML.cVal
             &&> GLibDateMonth.PolyML.cVal
             &&> GLibDateYear.PolyML.cVal
             --> GLibDateRecord.PolyML.cPtr
          )
      val newJulian_ = call (getSymbol "g_date_new_julian") (GUInt32.PolyML.cVal --> GLibDateRecord.PolyML.cPtr)
      val addDays_ = call (getSymbol "g_date_add_days") (GLibDateRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val addMonths_ = call (getSymbol "g_date_add_months") (GLibDateRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val addYears_ = call (getSymbol "g_date_add_years") (GLibDateRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val clamp_ =
        call (getSymbol "g_date_clamp")
          (
            GLibDateRecord.PolyML.cPtr
             &&> GLibDateRecord.PolyML.cPtr
             &&> GLibDateRecord.PolyML.cPtr
             --> cVoid
          )
      val clear_ = call (getSymbol "g_date_clear") (GLibDateRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val compare_ = call (getSymbol "g_date_compare") (GLibDateRecord.PolyML.cPtr &&> GLibDateRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val daysBetween_ = call (getSymbol "g_date_days_between") (GLibDateRecord.PolyML.cPtr &&> GLibDateRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getDay_ = call (getSymbol "g_date_get_day") (GLibDateRecord.PolyML.cPtr --> GLibDateDay.PolyML.cVal)
      val getDayOfYear_ = call (getSymbol "g_date_get_day_of_year") (GLibDateRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getIso8601WeekOfYear_ = call (getSymbol "g_date_get_iso8601_week_of_year") (GLibDateRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getJulian_ = call (getSymbol "g_date_get_julian") (GLibDateRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getMondayWeekOfYear_ = call (getSymbol "g_date_get_monday_week_of_year") (GLibDateRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getMonth_ = call (getSymbol "g_date_get_month") (GLibDateRecord.PolyML.cPtr --> GLibDateMonth.PolyML.cVal)
      val getSundayWeekOfYear_ = call (getSymbol "g_date_get_sunday_week_of_year") (GLibDateRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getWeekday_ = call (getSymbol "g_date_get_weekday") (GLibDateRecord.PolyML.cPtr --> GLibDateWeekday.PolyML.cVal)
      val getYear_ = call (getSymbol "g_date_get_year") (GLibDateRecord.PolyML.cPtr --> GLibDateYear.PolyML.cVal)
      val isFirstOfMonth_ = call (getSymbol "g_date_is_first_of_month") (GLibDateRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isLastOfMonth_ = call (getSymbol "g_date_is_last_of_month") (GLibDateRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val order_ = call (getSymbol "g_date_order") (GLibDateRecord.PolyML.cPtr &&> GLibDateRecord.PolyML.cPtr --> cVoid)
      val setDay_ = call (getSymbol "g_date_set_day") (GLibDateRecord.PolyML.cPtr &&> GLibDateDay.PolyML.cVal --> cVoid)
      val setDmy_ =
        call (getSymbol "g_date_set_dmy")
          (
            GLibDateRecord.PolyML.cPtr
             &&> GLibDateDay.PolyML.cVal
             &&> GLibDateMonth.PolyML.cVal
             &&> GLibDateYear.PolyML.cVal
             --> cVoid
          )
      val setJulian_ = call (getSymbol "g_date_set_julian") (GLibDateRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setMonth_ = call (getSymbol "g_date_set_month") (GLibDateRecord.PolyML.cPtr &&> GLibDateMonth.PolyML.cVal --> cVoid)
      val setParse_ = call (getSymbol "g_date_set_parse") (GLibDateRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTime_ = call (getSymbol "g_date_set_time") (GLibDateRecord.PolyML.cPtr &&> GLibTime.PolyML.cVal --> cVoid)
      val setTimeT_ = call (getSymbol "g_date_set_time_t") (GLibDateRecord.PolyML.cPtr &&> GLong.PolyML.cVal --> cVoid)
      val setTimeVal_ = call (getSymbol "g_date_set_time_val") (GLibDateRecord.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> cVoid)
      val setYear_ = call (getSymbol "g_date_set_year") (GLibDateRecord.PolyML.cPtr &&> GLibDateYear.PolyML.cVal --> cVoid)
      val subtractDays_ = call (getSymbol "g_date_subtract_days") (GLibDateRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val subtractMonths_ = call (getSymbol "g_date_subtract_months") (GLibDateRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val subtractYears_ = call (getSymbol "g_date_subtract_years") (GLibDateRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val valid_ = call (getSymbol "g_date_valid") (GLibDateRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDaysInMonth_ = call (getSymbol "g_date_get_days_in_month") (GLibDateMonth.PolyML.cVal &&> GLibDateYear.PolyML.cVal --> GUInt8.PolyML.cVal)
      val getMondayWeeksInYear_ = call (getSymbol "g_date_get_monday_weeks_in_year") (GLibDateYear.PolyML.cVal --> GUInt8.PolyML.cVal)
      val getSundayWeeksInYear_ = call (getSymbol "g_date_get_sunday_weeks_in_year") (GLibDateYear.PolyML.cVal --> GUInt8.PolyML.cVal)
      val isLeapYear_ = call (getSymbol "g_date_is_leap_year") (GLibDateYear.PolyML.cVal --> GBool.PolyML.cVal)
      val strftime_ =
        call (getSymbol "g_date_strftime")
          (
            Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibDateRecord.PolyML.cPtr
             --> GSize.PolyML.cVal
          )
      val validDay_ = call (getSymbol "g_date_valid_day") (GLibDateDay.PolyML.cVal --> GBool.PolyML.cVal)
      val validDmy_ =
        call (getSymbol "g_date_valid_dmy")
          (
            GLibDateDay.PolyML.cVal
             &&> GLibDateMonth.PolyML.cVal
             &&> GLibDateYear.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val validJulian_ = call (getSymbol "g_date_valid_julian") (GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val validMonth_ = call (getSymbol "g_date_valid_month") (GLibDateMonth.PolyML.cVal --> GBool.PolyML.cVal)
      val validWeekday_ = call (getSymbol "g_date_valid_weekday") (GLibDateWeekday.PolyML.cVal --> GBool.PolyML.cVal)
      val validYear_ = call (getSymbol "g_date_valid_year") (GLibDateYear.PolyML.cVal --> GBool.PolyML.cVal)
    end
    type t = GLibDateRecord.t
    type time_t = GLibTime.t
    type time_val_t = GLibTimeValRecord.t
    type date_day_t = GLibDateDay.t
    type date_month_t = GLibDateMonth.t
    type date_weekday_t = GLibDateWeekday.t
    type date_year_t = GLibDateYear.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GLibDateRecord.FFI.fromPtr true) new_ ()
    fun newDmy
      (
        day,
        month,
        year
      ) =
      (
        GLibDateDay.FFI.withVal
         &&&> GLibDateMonth.FFI.withVal
         &&&> GLibDateYear.FFI.withVal
         ---> GLibDateRecord.FFI.fromPtr true
      )
        newDmy_
        (
          day
           & month
           & year
        )
    fun newJulian julianDay = (GUInt32.FFI.withVal ---> GLibDateRecord.FFI.fromPtr true) newJulian_ julianDay
    fun addDays self nDays = (GLibDateRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) addDays_ (self & nDays)
    fun addMonths self nMonths = (GLibDateRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) addMonths_ (self & nMonths)
    fun addYears self nYears = (GLibDateRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) addYears_ (self & nYears)
    fun clamp self (minDate, maxDate) =
      (
        GLibDateRecord.FFI.withPtr false
         &&&> GLibDateRecord.FFI.withPtr false
         &&&> GLibDateRecord.FFI.withPtr false
         ---> I
      )
        clamp_
        (
          self
           & minDate
           & maxDate
        )
    fun clear self nDates = (GLibDateRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) clear_ (self & nDates)
    fun compare self rhs = (GLibDateRecord.FFI.withPtr false &&&> GLibDateRecord.FFI.withPtr false ---> GInt.FFI.fromVal) compare_ (self & rhs)
    fun daysBetween self date2 = (GLibDateRecord.FFI.withPtr false &&&> GLibDateRecord.FFI.withPtr false ---> GInt.FFI.fromVal) daysBetween_ (self & date2)
    fun getDay self = (GLibDateRecord.FFI.withPtr false ---> GLibDateDay.FFI.fromVal) getDay_ self
    fun getDayOfYear self = (GLibDateRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) getDayOfYear_ self
    fun getIso8601WeekOfYear self = (GLibDateRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) getIso8601WeekOfYear_ self
    fun getJulian self = (GLibDateRecord.FFI.withPtr false ---> GUInt32.FFI.fromVal) getJulian_ self
    fun getMondayWeekOfYear self = (GLibDateRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) getMondayWeekOfYear_ self
    fun getMonth self = (GLibDateRecord.FFI.withPtr false ---> GLibDateMonth.FFI.fromVal) getMonth_ self
    fun getSundayWeekOfYear self = (GLibDateRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) getSundayWeekOfYear_ self
    fun getWeekday self = (GLibDateRecord.FFI.withPtr false ---> GLibDateWeekday.FFI.fromVal) getWeekday_ self
    fun getYear self = (GLibDateRecord.FFI.withPtr false ---> GLibDateYear.FFI.fromVal) getYear_ self
    fun isFirstOfMonth self = (GLibDateRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isFirstOfMonth_ self
    fun isLastOfMonth self = (GLibDateRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isLastOfMonth_ self
    fun order self date2 = (GLibDateRecord.FFI.withPtr false &&&> GLibDateRecord.FFI.withPtr false ---> I) order_ (self & date2)
    fun setDay self day = (GLibDateRecord.FFI.withPtr false &&&> GLibDateDay.FFI.withVal ---> I) setDay_ (self & day)
    fun setDmy
      self
      (
        day,
        month,
        y
      ) =
      (
        GLibDateRecord.FFI.withPtr false
         &&&> GLibDateDay.FFI.withVal
         &&&> GLibDateMonth.FFI.withVal
         &&&> GLibDateYear.FFI.withVal
         ---> I
      )
        setDmy_
        (
          self
           & day
           & month
           & y
        )
    fun setJulian self julianDate = (GLibDateRecord.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setJulian_ (self & julianDate)
    fun setMonth self month = (GLibDateRecord.FFI.withPtr false &&&> GLibDateMonth.FFI.withVal ---> I) setMonth_ (self & month)
    fun setParse self str = (GLibDateRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setParse_ (self & str)
    fun setTime self time = (GLibDateRecord.FFI.withPtr false &&&> GLibTime.FFI.withVal ---> I) setTime_ (self & time)
    fun setTimeT self timet = (GLibDateRecord.FFI.withPtr false &&&> GLong.FFI.withVal ---> I) setTimeT_ (self & timet)
    fun setTimeVal self timeval = (GLibDateRecord.FFI.withPtr false &&&> GLibTimeValRecord.FFI.withPtr false ---> I) setTimeVal_ (self & timeval)
    fun setYear self year = (GLibDateRecord.FFI.withPtr false &&&> GLibDateYear.FFI.withVal ---> I) setYear_ (self & year)
    fun subtractDays self nDays = (GLibDateRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) subtractDays_ (self & nDays)
    fun subtractMonths self nMonths = (GLibDateRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) subtractMonths_ (self & nMonths)
    fun subtractYears self nYears = (GLibDateRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) subtractYears_ (self & nYears)
    fun valid self = (GLibDateRecord.FFI.withPtr false ---> GBool.FFI.fromVal) valid_ self
    fun getDaysInMonth (month, year) = (GLibDateMonth.FFI.withVal &&&> GLibDateYear.FFI.withVal ---> GUInt8.FFI.fromVal) getDaysInMonth_ (month & year)
    fun getMondayWeeksInYear year = (GLibDateYear.FFI.withVal ---> GUInt8.FFI.fromVal) getMondayWeeksInYear_ year
    fun getSundayWeeksInYear year = (GLibDateYear.FFI.withVal ---> GUInt8.FFI.fromVal) getSundayWeeksInYear_ year
    fun isLeapYear year = (GLibDateYear.FFI.withVal ---> GBool.FFI.fromVal) isLeapYear_ year
    fun strftime
      (
        s,
        slen,
        format,
        date
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibDateRecord.FFI.withPtr false
         ---> GSize.FFI.fromVal
      )
        strftime_
        (
          s
           & slen
           & format
           & date
        )
    fun validDay day = (GLibDateDay.FFI.withVal ---> GBool.FFI.fromVal) validDay_ day
    fun validDmy
      (
        day,
        month,
        year
      ) =
      (
        GLibDateDay.FFI.withVal
         &&&> GLibDateMonth.FFI.withVal
         &&&> GLibDateYear.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        validDmy_
        (
          day
           & month
           & year
        )
    fun validJulian julianDate = (GUInt32.FFI.withVal ---> GBool.FFI.fromVal) validJulian_ julianDate
    fun validMonth month = (GLibDateMonth.FFI.withVal ---> GBool.FFI.fromVal) validMonth_ month
    fun validWeekday weekday = (GLibDateWeekday.FFI.withVal ---> GBool.FFI.fromVal) validWeekday_ weekday
    fun validYear year = (GLibDateYear.FFI.withVal ---> GBool.FFI.fromVal) validYear_ year
  end
