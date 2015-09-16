signature G_LIB_KEY_FILE =
  sig
    type record_t
    type key_file_flags_t
    type t = record_t
    val getBoolean :
      record_t
       -> string
       -> string
       -> bool
    val getComment :
      record_t
       -> string
       -> string
       -> string
    val getDouble :
      record_t
       -> string
       -> string
       -> real
    val getInt64 :
      record_t
       -> string
       -> string
       -> LargeInt.int
    val getInteger :
      record_t
       -> string
       -> string
       -> LargeInt.int
    val getLocaleString :
      record_t
       -> string
       -> string
       -> string option
       -> string
    val getStartGroup : record_t -> string
    val getString :
      record_t
       -> string
       -> string
       -> string
    val getUint64 :
      record_t
       -> string
       -> string
       -> LargeInt.int
    val getValue :
      record_t
       -> string
       -> string
       -> string
    val hasGroup :
      record_t
       -> string
       -> bool
    val loadFromData :
      record_t
       -> string
       -> LargeInt.int
       -> key_file_flags_t
       -> bool
    val loadFromDataDirs :
      record_t
       -> string
       -> string
       -> key_file_flags_t
       -> bool
    val loadFromDirs :
      record_t
       -> string
       -> string
       -> string
       -> key_file_flags_t
       -> bool
    val loadFromFile :
      record_t
       -> string
       -> key_file_flags_t
       -> bool
    val removeComment :
      record_t
       -> string
       -> string
       -> bool
    val removeGroup :
      record_t
       -> string
       -> bool
    val removeKey :
      record_t
       -> string
       -> string
       -> bool
    val setBoolean :
      record_t
       -> string
       -> string
       -> bool
       -> unit
    val setBooleanList :
      record_t
       -> string
       -> string
       -> bool
       -> LargeInt.int
       -> unit
    val setComment :
      record_t
       -> string
       -> string
       -> string
       -> bool
    val setDouble :
      record_t
       -> string
       -> string
       -> real
       -> unit
    val setDoubleList :
      record_t
       -> string
       -> string
       -> real
       -> LargeInt.int
       -> unit
    val setInt64 :
      record_t
       -> string
       -> string
       -> LargeInt.int
       -> unit
    val setInteger :
      record_t
       -> string
       -> string
       -> LargeInt.int
       -> unit
    val setIntegerList :
      record_t
       -> string
       -> string
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setListSeparator :
      record_t
       -> LargeInt.int
       -> unit
    val setLocaleString :
      record_t
       -> string
       -> string
       -> string
       -> string
       -> unit
    val setLocaleStringList :
      record_t
       -> string
       -> string
       -> string
       -> string
       -> LargeInt.int
       -> unit
    val setString :
      record_t
       -> string
       -> string
       -> string
       -> unit
    val setUint64 :
      record_t
       -> string
       -> string
       -> LargeInt.int
       -> unit
    val setValue :
      record_t
       -> string
       -> string
       -> string
       -> unit
  end
