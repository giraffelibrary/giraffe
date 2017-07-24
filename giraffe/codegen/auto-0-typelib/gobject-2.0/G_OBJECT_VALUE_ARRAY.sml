signature G_OBJECT_VALUE_ARRAY =
  sig
    type t
    type type_t
    type value_t
    val getType : unit -> type_t
    val new : LargeInt.int -> t
    val append :
      t
       -> value_t option
       -> t
    val copy : t -> t
    val getNth :
      t
       -> LargeInt.int
       -> value_t
    val insert :
      t
       -> LargeInt.int * value_t option
       -> t
    val prepend :
      t
       -> value_t option
       -> t
    val remove :
      t
       -> LargeInt.int
       -> t
  end
