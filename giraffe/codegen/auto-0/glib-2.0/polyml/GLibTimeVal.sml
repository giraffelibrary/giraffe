structure GLibTimeVal :>
  G_LIB_TIME_VAL
    where type record_t = GLibTimeValRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val add_ = call (load_sym libglib "g_time_val_add") (GLibTimeValRecord.PolyML.PTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.VOID)
      val toIso8601_ = call (load_sym libglib "g_time_val_to_iso8601") (GLibTimeValRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val fromIso8601_ = call (load_sym libglib "g_time_val_from_iso8601") (FFI.PolyML.String.INPTR &&> GLibTimeValRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type record_t = GLibTimeValRecord.t
    fun add self microseconds = (GLibTimeValRecord.C.withPtr &&&> FFI.Int64.withVal ---> I) add_ (self & microseconds)
    fun toIso8601 self = (GLibTimeValRecord.C.withPtr ---> FFI.String.fromPtr true) toIso8601_ self
    fun fromIso8601 isoDate time = (FFI.String.withConstPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.fromVal) fromIso8601_ (isoDate & time)
  end
