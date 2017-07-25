structure GLibTimeZone :>
  G_LIB_TIME_ZONE
    where type t = GLibTimeZoneRecord.t
    where type time_type_t = GLibTimeType.t =
  struct
    val findInterval_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_time_zone_find_interval" :
              GLibTimeZoneRecord.FFI.notnull GLibTimeZoneRecord.FFI.p
               * GLibTimeType.FFI.val_
               * GInt64.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAbbreviation_ = fn x1 & x2 => (_import "g_time_zone_get_abbreviation" : GLibTimeZoneRecord.FFI.notnull GLibTimeZoneRecord.FFI.p * GInt32.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getOffset_ = fn x1 & x2 => (_import "g_time_zone_get_offset" : GLibTimeZoneRecord.FFI.notnull GLibTimeZoneRecord.FFI.p * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val isDst_ = fn x1 & x2 => (_import "g_time_zone_is_dst" : GLibTimeZoneRecord.FFI.notnull GLibTimeZoneRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
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
