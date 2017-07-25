structure GLibTimeZone :>
  G_LIB_TIME_ZONE
    where type t = GLibTimeZoneRecord.t
    where type time_type_t = GLibTimeType.t =
  struct
    local
      open PolyMLFFI
    in
      val findInterval_ =
        call (getSymbol "g_time_zone_find_interval")
          (
            GLibTimeZoneRecord.PolyML.cPtr
             &&> GLibTimeType.PolyML.cVal
             &&> GInt64.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val getAbbreviation_ = call (getSymbol "g_time_zone_get_abbreviation") (GLibTimeZoneRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getOffset_ = call (getSymbol "g_time_zone_get_offset") (GLibTimeZoneRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val isDst_ = call (getSymbol "g_time_zone_is_dst") (GLibTimeZoneRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
    end
    type t = GLibTimeZoneRecord.t
    type time_type_t = GLibTimeType.t
    fun findInterval self (type', time) =
      (
        GLibTimeZoneRecord.FFI.withPtr
         &&&> GLibTimeType.FFI.withVal
         &&&> GInt64.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        findInterval_
        (
          self
           & type'
           & time
        )
    fun getAbbreviation self interval = (GLibTimeZoneRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getAbbreviation_ (self & interval)
    fun getOffset self interval = (GLibTimeZoneRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getOffset_ (self & interval)
    fun isDst self interval = (GLibTimeZoneRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) isDst_ (self & interval)
  end
