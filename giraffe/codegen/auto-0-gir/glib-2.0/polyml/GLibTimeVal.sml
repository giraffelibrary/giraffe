structure GLibTimeVal :>
  G_LIB_TIME_VAL
    where type t = GLibTimeValRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val add_ = call (getSymbol "g_time_val_add") (GLibTimeValRecord.PolyML.cPtr &&> GLong.PolyML.cVal --> PolyMLFFI.cVoid)
      val toIso8601_ = call (getSymbol "g_time_val_to_iso8601") (GLibTimeValRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val fromIso8601_ = call (getSymbol "g_time_val_from_iso8601") (Utf8.PolyML.cInPtr &&> GLibTimeValRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GLibTimeValRecord.t
    fun add self microseconds = (GLibTimeValRecord.FFI.withPtr &&&> GLong.FFI.withVal ---> I) add_ (self & microseconds)
    fun toIso8601 self = (GLibTimeValRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toIso8601_ self
    fun fromIso8601 isoDate time = (Utf8.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> GBool.FFI.fromVal) fromIso8601_ (isoDate & time)
  end
