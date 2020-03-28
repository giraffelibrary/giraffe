signature G_LIB_VARIANT_TYPE =
  sig
    type t
    type variant_type_record_c_array_n_t
    val getType : unit -> GObject.Type.t
    val new : string -> t
    val newArray : t -> t
    val newDictEntry : t * t -> t
    val newMaybe : t -> t
    val newTuple : variant_type_record_c_array_n_t -> t
    val copy : t -> t
    val dupString : t -> string
    val element : t -> t
    val equal :
      t
       -> t
       -> bool
    val first : t -> t
    val getStringLength : t -> LargeInt.int
    val hash : t -> LargeInt.int
    val isArray : t -> bool
    val isBasic : t -> bool
    val isContainer : t -> bool
    val isDefinite : t -> bool
    val isDictEntry : t -> bool
    val isMaybe : t -> bool
    val isSubtypeOf :
      t
       -> t
       -> bool
    val isTuple : t -> bool
    val isVariant : t -> bool
    val key : t -> t
    val nItems : t -> LargeInt.int
    val next : t -> t
    val value : t -> t
    val checked : string -> t
    val stringIsValid : string -> bool
    val stringScan : string * string option -> string option
  end
