signature G_LIB_STRING =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val append :
      t
       -> string
       -> t
    val appendC :
      t
       -> Word8.word
       -> t
    val appendLen :
      t
       -> string * LargeInt.int
       -> t
    val appendUnichar :
      t
       -> char
       -> t
    val appendUriEscaped :
      t
       -> string
           * string
           * bool
       -> t
    val asciiDown : t -> t
    val asciiUp : t -> t
    val assign :
      t
       -> string
       -> t
    val down : t -> t
    val equal :
      t
       -> t
       -> bool
    val erase :
      t
       -> LargeInt.int * LargeInt.int
       -> t
    val hash : t -> LargeInt.int
    val insert :
      t
       -> LargeInt.int * string
       -> t
    val insertC :
      t
       -> LargeInt.int * Word8.word
       -> t
    val insertLen :
      t
       -> LargeInt.int
           * string
           * LargeInt.int
       -> t
    val insertUnichar :
      t
       -> LargeInt.int * char
       -> t
    val overwrite :
      t
       -> LargeInt.int * string
       -> t
    val overwriteLen :
      t
       -> LargeInt.int
           * string
           * LargeInt.int
       -> t
    val prepend :
      t
       -> string
       -> t
    val prependC :
      t
       -> Word8.word
       -> t
    val prependLen :
      t
       -> string * LargeInt.int
       -> t
    val prependUnichar :
      t
       -> char
       -> t
    val setSize :
      t
       -> LargeInt.int
       -> t
    val truncate :
      t
       -> LargeInt.int
       -> t
    val up : t -> t
  end
