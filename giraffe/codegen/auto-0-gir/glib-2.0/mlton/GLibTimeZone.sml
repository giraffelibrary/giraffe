structure GLibTimeZone :>
  G_LIB_TIME_ZONE
    where type t = GLibTimeZoneRecord.t
    where type time_type_t = GLibTimeType.t =
  struct
    val getType_ = _import "g_time_zone_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_time_zone_new" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> GLibTimeZoneRecord.FFI.non_opt GLibTimeZoneRecord.FFI.p;
    val newLocal_ = _import "g_time_zone_new_local" : unit -> GLibTimeZoneRecord.FFI.non_opt GLibTimeZoneRecord.FFI.p;
    val newUtc_ = _import "g_time_zone_new_utc" : unit -> GLibTimeZoneRecord.FFI.non_opt GLibTimeZoneRecord.FFI.p;
    val findInterval_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_time_zone_find_interval" :
              GLibTimeZoneRecord.FFI.non_opt GLibTimeZoneRecord.FFI.p
               * GLibTimeType.FFI.val_
               * GInt64.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAbbreviation_ = fn x1 & x2 => (_import "g_time_zone_get_abbreviation" : GLibTimeZoneRecord.FFI.non_opt GLibTimeZoneRecord.FFI.p * GInt.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val getOffset_ = fn x1 & x2 => (_import "g_time_zone_get_offset" : GLibTimeZoneRecord.FFI.non_opt GLibTimeZoneRecord.FFI.p * GInt.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val isDst_ = fn x1 & x2 => (_import "g_time_zone_is_dst" : GLibTimeZoneRecord.FFI.non_opt GLibTimeZoneRecord.FFI.p * GInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
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
         ---> GInt.FFI.fromVal
      )
        findInterval_
        (
          self
           & type'
           & time
        )
    fun getAbbreviation self interval = (GLibTimeZoneRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) getAbbreviation_ (self & interval) before GLibTimeZoneRecord.FFI.touchPtr self
    fun getOffset self interval = (GLibTimeZoneRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GInt32.FFI.fromVal) getOffset_ (self & interval)
    fun isDst self interval = (GLibTimeZoneRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) isDst_ (self & interval)
  end
