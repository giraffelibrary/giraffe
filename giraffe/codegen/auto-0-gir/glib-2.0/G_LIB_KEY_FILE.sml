signature G_LIB_KEY_FILE =
  sig
    type t
    type bytes_t
    type key_file_flags_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val getBoolean :
      t
       -> string * string
       -> unit
    val getBooleanList :
      t
       -> string * string
       -> bool vector
    val getComment :
      t
       -> string option * string
       -> string
    val getDouble :
      t
       -> string * string
       -> real
    val getDoubleList :
      t
       -> string * string
       -> real vector
    val getGroups : t -> string list * LargeInt.int
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
    val getKeys :
      t
       -> string
       -> string list * LargeInt.int
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
    val loadFromBytes :
      t
       -> bytes_t * key_file_flags_t
       -> unit
    val loadFromData :
      t
       -> string
           * LargeInt.int
           * key_file_flags_t
       -> unit
    val loadFromDataDirs :
      t
       -> string * key_file_flags_t
       -> string
    val loadFromDirs :
      t
       -> string
           * string list
           * key_file_flags_t
       -> string
    val loadFromFile :
      t
       -> string * key_file_flags_t
       -> unit
    val removeComment :
      t
       -> string option * string option
       -> unit
    val removeGroup :
      t
       -> string
       -> unit
    val removeKey :
      t
       -> string * string
       -> unit
    val saveToFile :
      t
       -> string
       -> unit
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
           * bool vector
       -> unit
    val setComment :
      t
       -> string option
           * string option
           * string
       -> unit
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
           * real vector
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
           * LargeInt.int vector
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
           * string list
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
    val toData : t -> string * LargeInt.int
  end
