structure GLibTimeVal :>
  G_LIB_TIME_VAL
    where type record_t = GLibTimeValRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val add_ = call (load_sym libglib "g_time_val_add") (GLibTimeValRecord.PolyML.PTR &&> FFI.Long.PolyML.VAL --> FFI.PolyML.VOID)
      val toIso8601_ = call (load_sym libglib "g_time_val_to_iso8601") (GLibTimeValRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val fromIso8601_ = call (load_sym libglib "g_time_val_from_iso8601") (Utf8.PolyML.INPTR &&> GLibTimeValRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type record_t = GLibTimeValRecord.t
    type t = record_t
    fun add self microseconds = (GLibTimeValRecord.C.withPtr &&&> FFI.Long.C.withVal ---> I) add_ (self & microseconds)
    fun toIso8601 self = (GLibTimeValRecord.C.withPtr ---> Utf8.C.fromPtr true) toIso8601_ self
    fun fromIso8601 isoDate time = (Utf8.C.withConstPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.C.fromVal) fromIso8601_ (isoDate & time)
  end
