structure GLibTimeZone :>
  G_LIB_TIME_ZONE
    where type t = GLibTimeZoneRecord.t
    where type time_type_t = GLibTimeType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_time_zone_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_time_zone_new") (Utf8.PolyML.cInOptPtr --> GLibTimeZoneRecord.PolyML.cPtr)
      val newLocal_ = call (getSymbol "g_time_zone_new_local") (cVoid --> GLibTimeZoneRecord.PolyML.cPtr)
      val newUtc_ = call (getSymbol "g_time_zone_new_utc") (cVoid --> GLibTimeZoneRecord.PolyML.cPtr)
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new identifier = (Utf8.FFI.withOptPtr 0 ---> GLibTimeZoneRecord.FFI.fromPtr true) new_ identifier
    fun newLocal () = (I ---> GLibTimeZoneRecord.FFI.fromPtr true) newLocal_ ()
    fun newUtc () = (I ---> GLibTimeZoneRecord.FFI.fromPtr true) newUtc_ ()
    fun findInterval self (type', time) =
      (
        GLibTimeZoneRecord.FFI.withPtr false
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
    fun getAbbreviation self interval = (GLibTimeZoneRecord.FFI.withPtr false &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getAbbreviation_ (self & interval)
    fun getOffset self interval = (GLibTimeZoneRecord.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) getOffset_ (self & interval)
    fun isDst self interval = (GLibTimeZoneRecord.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) isDst_ (self & interval)
  end
