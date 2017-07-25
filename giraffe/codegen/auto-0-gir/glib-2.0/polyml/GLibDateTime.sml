structure GLibDateTime :>
  G_LIB_DATE_TIME
    where type t = GLibDateTimeRecord.t
    where type time_span_t = GLibTimeSpan.t
    where type time_val_t = GLibTimeValRecord.t
    where type time_zone_t = GLibTimeZoneRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_date_time_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_date_time_new")
          (
            GLibTimeZoneRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GLibDateTimeRecord.PolyML.cPtr
          )
      val newFromTimevalLocal_ = call (getSymbol "g_date_time_new_from_timeval_local") (GLibTimeValRecord.PolyML.cPtr --> GLibDateTimeRecord.PolyML.cPtr)
      val newFromTimevalUtc_ = call (getSymbol "g_date_time_new_from_timeval_utc") (GLibTimeValRecord.PolyML.cPtr --> GLibDateTimeRecord.PolyML.cPtr)
      val newFromUnixLocal_ = call (getSymbol "g_date_time_new_from_unix_local") (GInt64.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val newFromUnixUtc_ = call (getSymbol "g_date_time_new_from_unix_utc") (GInt64.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val newLocal_ =
        call (getSymbol "g_date_time_new_local")
          (
            GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GLibDateTimeRecord.PolyML.cPtr
          )
      val newNow_ = call (getSymbol "g_date_time_new_now") (GLibTimeZoneRecord.PolyML.cPtr --> GLibDateTimeRecord.PolyML.cPtr)
      val newNowLocal_ = call (getSymbol "g_date_time_new_now_local") (cVoid --> GLibDateTimeRecord.PolyML.cPtr)
      val newNowUtc_ = call (getSymbol "g_date_time_new_now_utc") (cVoid --> GLibDateTimeRecord.PolyML.cPtr)
      val newUtc_ =
        call (getSymbol "g_date_time_new_utc")
          (
            GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GLibDateTimeRecord.PolyML.cPtr
          )
      val add_ = call (getSymbol "g_date_time_add") (GLibDateTimeRecord.PolyML.cPtr &&> GLibTimeSpan.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val addDays_ = call (getSymbol "g_date_time_add_days") (GLibDateTimeRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val addFull_ =
        call (getSymbol "g_date_time_add_full")
          (
            GLibDateTimeRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GLibDateTimeRecord.PolyML.cPtr
          )
      val addHours_ = call (getSymbol "g_date_time_add_hours") (GLibDateTimeRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val addMinutes_ = call (getSymbol "g_date_time_add_minutes") (GLibDateTimeRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val addMonths_ = call (getSymbol "g_date_time_add_months") (GLibDateTimeRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val addSeconds_ = call (getSymbol "g_date_time_add_seconds") (GLibDateTimeRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val addWeeks_ = call (getSymbol "g_date_time_add_weeks") (GLibDateTimeRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val addYears_ = call (getSymbol "g_date_time_add_years") (GLibDateTimeRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GLibDateTimeRecord.PolyML.cPtr)
      val difference_ = call (getSymbol "g_date_time_difference") (GLibDateTimeRecord.PolyML.cPtr &&> GLibDateTimeRecord.PolyML.cPtr --> GLibTimeSpan.PolyML.cVal)
      val format_ = call (getSymbol "g_date_time_format") (GLibDateTimeRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getDayOfMonth_ = call (getSymbol "g_date_time_get_day_of_month") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getDayOfWeek_ = call (getSymbol "g_date_time_get_day_of_week") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getDayOfYear_ = call (getSymbol "g_date_time_get_day_of_year") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getHour_ = call (getSymbol "g_date_time_get_hour") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMicrosecond_ = call (getSymbol "g_date_time_get_microsecond") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMinute_ = call (getSymbol "g_date_time_get_minute") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMonth_ = call (getSymbol "g_date_time_get_month") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSecond_ = call (getSymbol "g_date_time_get_second") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSeconds_ = call (getSymbol "g_date_time_get_seconds") (GLibDateTimeRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getTimezoneAbbreviation_ = call (getSymbol "g_date_time_get_timezone_abbreviation") (GLibDateTimeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUtcOffset_ = call (getSymbol "g_date_time_get_utc_offset") (GLibDateTimeRecord.PolyML.cPtr --> GLibTimeSpan.PolyML.cVal)
      val getWeekNumberingYear_ = call (getSymbol "g_date_time_get_week_numbering_year") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getWeekOfYear_ = call (getSymbol "g_date_time_get_week_of_year") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getYear_ = call (getSymbol "g_date_time_get_year") (GLibDateTimeRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getYmd_ =
        call (getSymbol "g_date_time_get_ymd")
          (
            GLibDateTimeRecord.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val isDaylightSavings_ = call (getSymbol "g_date_time_is_daylight_savings") (GLibDateTimeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val toLocal_ = call (getSymbol "g_date_time_to_local") (GLibDateTimeRecord.PolyML.cPtr --> GLibDateTimeRecord.PolyML.cPtr)
      val toTimeval_ = call (getSymbol "g_date_time_to_timeval") (GLibDateTimeRecord.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val toTimezone_ = call (getSymbol "g_date_time_to_timezone") (GLibDateTimeRecord.PolyML.cPtr &&> GLibTimeZoneRecord.PolyML.cPtr --> GLibDateTimeRecord.PolyML.cPtr)
      val toUnix_ = call (getSymbol "g_date_time_to_unix") (GLibDateTimeRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val toUtc_ = call (getSymbol "g_date_time_to_utc") (GLibDateTimeRecord.PolyML.cPtr --> GLibDateTimeRecord.PolyML.cPtr)
    end
    type t = GLibDateTimeRecord.t
    type time_span_t = GLibTimeSpan.t
    type time_val_t = GLibTimeValRecord.t
    type time_zone_t = GLibTimeZoneRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        tz,
        year,
        month,
        day,
        hour,
        minute,
        seconds
      ) =
      (
        GLibTimeZoneRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GLibDateTimeRecord.FFI.fromPtr true
      )
        new_
        (
          tz
           & year
           & month
           & day
           & hour
           & minute
           & seconds
        )
    fun newFromTimevalLocal tv = (GLibTimeValRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) newFromTimevalLocal_ tv
    fun newFromTimevalUtc tv = (GLibTimeValRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) newFromTimevalUtc_ tv
    fun newFromUnixLocal t = (GInt64.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) newFromUnixLocal_ t
    fun newFromUnixUtc t = (GInt64.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) newFromUnixUtc_ t
    fun newLocal
      (
        year,
        month,
        day,
        hour,
        minute,
        seconds
      ) =
      (
        GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GLibDateTimeRecord.FFI.fromPtr true
      )
        newLocal_
        (
          year
           & month
           & day
           & hour
           & minute
           & seconds
        )
    fun newNow tz = (GLibTimeZoneRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) newNow_ tz
    fun newNowLocal () = (I ---> GLibDateTimeRecord.FFI.fromPtr true) newNowLocal_ ()
    fun newNowUtc () = (I ---> GLibDateTimeRecord.FFI.fromPtr true) newNowUtc_ ()
    fun newUtc
      (
        year,
        month,
        day,
        hour,
        minute,
        seconds
      ) =
      (
        GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GLibDateTimeRecord.FFI.fromPtr true
      )
        newUtc_
        (
          year
           & month
           & day
           & hour
           & minute
           & seconds
        )
    fun add self timespan = (GLibDateTimeRecord.FFI.withPtr &&&> GLibTimeSpan.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) add_ (self & timespan)
    fun addDays self days = (GLibDateTimeRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addDays_ (self & days)
    fun addFull
      self
      (
        years,
        months,
        days,
        hours,
        minutes,
        seconds
      ) =
      (
        GLibDateTimeRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GLibDateTimeRecord.FFI.fromPtr true
      )
        addFull_
        (
          self
           & years
           & months
           & days
           & hours
           & minutes
           & seconds
        )
    fun addHours self hours = (GLibDateTimeRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addHours_ (self & hours)
    fun addMinutes self minutes = (GLibDateTimeRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addMinutes_ (self & minutes)
    fun addMonths self months = (GLibDateTimeRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addMonths_ (self & months)
    fun addSeconds self seconds = (GLibDateTimeRecord.FFI.withPtr &&&> GDouble.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addSeconds_ (self & seconds)
    fun addWeeks self weeks = (GLibDateTimeRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addWeeks_ (self & weeks)
    fun addYears self years = (GLibDateTimeRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GLibDateTimeRecord.FFI.fromPtr true) addYears_ (self & years)
    fun difference self begin = (GLibDateTimeRecord.FFI.withPtr &&&> GLibDateTimeRecord.FFI.withPtr ---> GLibTimeSpan.FFI.fromVal) difference_ (self & begin)
    fun format self format = (GLibDateTimeRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) format_ (self & format)
    fun getDayOfMonth self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getDayOfMonth_ self
    fun getDayOfWeek self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getDayOfWeek_ self
    fun getDayOfYear self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getDayOfYear_ self
    fun getHour self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getHour_ self
    fun getMicrosecond self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getMicrosecond_ self
    fun getMinute self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getMinute_ self
    fun getMonth self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getMonth_ self
    fun getSecond self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getSecond_ self
    fun getSeconds self = (GLibDateTimeRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getSeconds_ self
    fun getTimezoneAbbreviation self = (GLibDateTimeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTimezoneAbbreviation_ self
    fun getUtcOffset self = (GLibDateTimeRecord.FFI.withPtr ---> GLibTimeSpan.FFI.fromVal) getUtcOffset_ self
    fun getWeekNumberingYear self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getWeekNumberingYear_ self
    fun getWeekOfYear self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getWeekOfYear_ self
    fun getYear self = (GLibDateTimeRecord.FFI.withPtr ---> GInt.FFI.fromVal) getYear_ self
    fun getYmd self =
      let
        val year
         & month
         & day
         & () =
          (
            GLibDateTimeRecord.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getYmd_
            (
              self
               & GInt.null
               & GInt.null
               & GInt.null
            )
      in
        (
          year,
          month,
          day
        )
      end
    fun isDaylightSavings self = (GLibDateTimeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDaylightSavings_ self
    fun toLocal self = (GLibDateTimeRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) toLocal_ self
    fun toTimeval self tv = (GLibDateTimeRecord.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> GBool.FFI.fromVal) toTimeval_ (self & tv)
    fun toTimezone self tz = (GLibDateTimeRecord.FFI.withPtr &&&> GLibTimeZoneRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) toTimezone_ (self & tz)
    fun toUnix self = (GLibDateTimeRecord.FFI.withPtr ---> GInt64.FFI.fromVal) toUnix_ self
    fun toUtc self = (GLibDateTimeRecord.FFI.withPtr ---> GLibDateTimeRecord.FFI.fromPtr true) toUtc_ self
  end
