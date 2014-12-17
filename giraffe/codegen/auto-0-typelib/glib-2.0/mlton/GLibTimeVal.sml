structure GLibTimeVal :>
  G_LIB_TIME_VAL
    where type record_t = GLibTimeValRecord.t =
  struct
    val add_ = fn x1 & x2 => (_import "g_time_val_add" : GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p * FFI.Int64.C.val_ -> unit;) (x1, x2)
    val toIso8601_ = _import "g_time_val_to_iso8601" : GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val fromIso8601_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_time_val_from_iso8601" :
              cstring
               * unit CPointer.t
               * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type record_t = GLibTimeValRecord.t
    type t = record_t
    fun add self microseconds = (GLibTimeValRecord.C.withPtr &&&> FFI.Int64.C.withVal ---> I) add_ (self & microseconds)
    fun toIso8601 self = (GLibTimeValRecord.C.withPtr ---> FFI.String.C.fromPtr true) toIso8601_ self
    fun fromIso8601 isoDate time = (FFI.String.C.withConstPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.C.fromVal) fromIso8601_ (isoDate & time)
  end
