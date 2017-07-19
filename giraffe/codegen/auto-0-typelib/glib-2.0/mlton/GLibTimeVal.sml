structure GLibTimeVal :>
  G_LIB_TIME_VAL
    where type t = GLibTimeValRecord.t =
  struct
    val add_ = fn x1 & x2 => (_import "g_time_val_add" : GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p * GInt64.FFI.val_ -> unit;) (x1, x2)
    val toIso8601_ = _import "g_time_val_to_iso8601" : GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val fromIso8601_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_time_val_from_iso8601" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibTimeValRecord.t
    fun add self microseconds = (GLibTimeValRecord.FFI.withPtr &&&> GInt64.FFI.withVal ---> I) add_ (self & microseconds)
    fun toIso8601 self = (GLibTimeValRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toIso8601_ self
    fun fromIso8601 (isoDate, time) = (Utf8.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> GBool.FFI.fromVal) fromIso8601_ (isoDate & time)
  end
