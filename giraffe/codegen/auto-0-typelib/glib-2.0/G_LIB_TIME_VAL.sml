signature G_LIB_TIME_VAL =
  sig
    type record_t
    type t = record_t
    val add :
      record_t
       -> LargeInt.int
       -> unit
    val toIso8601 : record_t -> string
    val fromIso8601 :
      string
       -> record_t
       -> bool
  end
