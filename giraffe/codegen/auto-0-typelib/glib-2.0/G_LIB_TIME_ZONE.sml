signature G_LIB_TIME_ZONE =
  sig
    type t
    type time_type_t
    val findInterval :
      t
       -> time_type_t * LargeInt.int
       -> LargeInt.int
    val getAbbreviation :
      t
       -> LargeInt.int
       -> string
    val getOffset :
      t
       -> LargeInt.int
       -> LargeInt.int
    val isDst :
      t
       -> LargeInt.int
       -> bool
  end
