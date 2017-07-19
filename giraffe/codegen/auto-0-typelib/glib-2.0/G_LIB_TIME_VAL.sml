signature G_LIB_TIME_VAL =
  sig
    type t
    val add :
      t
       -> LargeInt.int
       -> unit
    val toIso8601 : t -> string
    val fromIso8601 : string * t -> bool
  end
