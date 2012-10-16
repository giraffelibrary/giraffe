functor Word32BitFlags (val allFlags : Word32.word list) :>
  BIT_FLAGS
    where type flags = Word32.word =
  struct
    type flags = Word32.word

    val toWord = SysWord.fromLarge o Word32.toLarge
    val fromWord = Word32.fromLarge o SysWord.toLarge

    val flags = foldl (Word32.orb) 0w0

    val all = flags allFlags

    val intersect = foldl (Word32.andb) all

    fun clear (flags1, flags2) = Word32.andb (Word32.notb flags1, flags2)

    fun allSet (flags1, flags2) = Word32.andb (flags1, flags2) = flags1

    fun anySet (flags1, flags2) = Word32.andb (flags1, flags2) <> 0w0
  end
