signature G_LIB_KEY_FILE =
  sig
    type t
    type key_file_flags_t
    val getBoolean :
      t
       -> string * string
       -> bool
    val getBooleanList :
      t
       -> string * string
       -> bool vector
    val getComment :
      t
       -> string * string
       -> string
    val getDouble :
      t
       -> string * string
       -> real
    val getDoubleList :
      t
       -> string * string
       -> real vector
    val getInt64 :
      t
       -> string * string
       -> LargeInt.int
    val getInteger :
      t
       -> string * string
       -> LargeInt.int
    val getIntegerList :
      t
       -> string * string
       -> LargeInt.int vector
    val getLocaleString :
      t
       -> string
           * string
           * string option
       -> string
    val getLocaleStringList :
      t
       -> string
           * string
           * string option
       -> string list
    val getStartGroup : t -> string
    val getString :
      t
       -> string * string
       -> string
    val getStringList :
      t
       -> string * string
       -> string list
    val getUint64 :
      t
       -> string * string
       -> LargeInt.int
    val getValue :
      t
       -> string * string
       -> string
    val hasGroup :
      t
       -> string
       -> bool
    val loadFromData :
      t
       -> string
           * LargeInt.int
           * key_file_flags_t
       -> bool
    val loadFromDataDirs :
      t
       -> string
           * string
           * key_file_flags_t
       -> bool
    val loadFromDirs :
      t
       -> string
           * string
           * string
           * key_file_flags_t
       -> bool
    val loadFromFile :
      t
       -> string * key_file_flags_t
       -> bool
    val removeComment :
      t
       -> string * string
       -> bool
    val removeGroup :
      t
       -> string
       -> bool
    val removeKey :
      t
       -> string * string
       -> bool
    val setBoolean :
      t
       -> string
           * string
           * bool
       -> unit
    val setBooleanList :
      t
       -> string
           * string
           * bool
           * LargeInt.int
       -> unit
    val setComment :
      t
       -> string
           * string
           * string
       -> bool
    val setDouble :
      t
       -> string
           * string
           * real
       -> unit
    val setDoubleList :
      t
       -> string
           * string
           * real
           * LargeInt.int
       -> unit
    val setInt64 :
      t
       -> string
           * string
           * LargeInt.int
       -> unit
    val setInteger :
      t
       -> string
           * string
           * LargeInt.int
       -> unit
    val setIntegerList :
      t
       -> string
           * string
           * LargeInt.int
           * LargeInt.int
       -> unit
    val setListSeparator :
      t
       -> char
       -> unit
    val setLocaleString :
      t
       -> string
           * string
           * string
           * string
       -> unit
    val setLocaleStringList :
      t
       -> string
           * string
           * string
           * string
           * LargeInt.int
       -> unit
    val setString :
      t
       -> string
           * string
           * string
       -> unit
    val setStringList :
      t
       -> string
           * string
           * string list
       -> unit
    val setUint64 :
      t
       -> string
           * string
           * LargeInt.int
       -> unit
    val setValue :
      t
       -> string
           * string
           * string
       -> unit
  end
