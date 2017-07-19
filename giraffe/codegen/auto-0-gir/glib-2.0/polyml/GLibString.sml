structure GLibString :>
  G_LIB_STRING
    where type t = GLibStringRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_gstring_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val append_ = call (getSymbol "g_string_append") (GLibStringRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibStringRecord.PolyML.cPtr)
      val appendC_ = call (getSymbol "g_string_append_c") (GLibStringRecord.PolyML.cPtr &&> GChar.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val appendLen_ =
        call (getSymbol "g_string_append_len")
          (
            GLibStringRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
      val appendUnichar_ = call (getSymbol "g_string_append_unichar") (GLibStringRecord.PolyML.cPtr &&> GChar.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val appendUriEscaped_ =
        call (getSymbol "g_string_append_uri_escaped")
          (
            GLibStringRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
      val asciiDown_ = call (getSymbol "g_string_ascii_down") (GLibStringRecord.PolyML.cPtr --> GLibStringRecord.PolyML.cPtr)
      val asciiUp_ = call (getSymbol "g_string_ascii_up") (GLibStringRecord.PolyML.cPtr --> GLibStringRecord.PolyML.cPtr)
      val assign_ = call (getSymbol "g_string_assign") (GLibStringRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibStringRecord.PolyML.cPtr)
      val down_ = call (getSymbol "g_string_down") (GLibStringRecord.PolyML.cPtr --> GLibStringRecord.PolyML.cPtr)
      val equal_ = call (getSymbol "g_string_equal") (GLibStringRecord.PolyML.cPtr &&> GLibStringRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val erase_ =
        call (getSymbol "g_string_erase")
          (
            GLibStringRecord.PolyML.cPtr
             &&> GSSize.PolyML.cVal
             &&> GSSize.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
      val hash_ = call (getSymbol "g_string_hash") (GLibStringRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val insert_ =
        call (getSymbol "g_string_insert")
          (
            GLibStringRecord.PolyML.cPtr
             &&> GSSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GLibStringRecord.PolyML.cPtr
          )
      val insertC_ =
        call (getSymbol "g_string_insert_c")
          (
            GLibStringRecord.PolyML.cPtr
             &&> GSSize.PolyML.cVal
             &&> GChar.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
      val insertLen_ =
        call (getSymbol "g_string_insert_len")
          (
            GLibStringRecord.PolyML.cPtr
             &&> GSSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
      val insertUnichar_ =
        call (getSymbol "g_string_insert_unichar")
          (
            GLibStringRecord.PolyML.cPtr
             &&> GSSize.PolyML.cVal
             &&> GChar.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
      val overwrite_ =
        call (getSymbol "g_string_overwrite")
          (
            GLibStringRecord.PolyML.cPtr
             &&> GSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GLibStringRecord.PolyML.cPtr
          )
      val overwriteLen_ =
        call (getSymbol "g_string_overwrite_len")
          (
            GLibStringRecord.PolyML.cPtr
             &&> GSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
      val prepend_ = call (getSymbol "g_string_prepend") (GLibStringRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibStringRecord.PolyML.cPtr)
      val prependC_ = call (getSymbol "g_string_prepend_c") (GLibStringRecord.PolyML.cPtr &&> GChar.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val prependLen_ =
        call (getSymbol "g_string_prepend_len")
          (
            GLibStringRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
      val prependUnichar_ = call (getSymbol "g_string_prepend_unichar") (GLibStringRecord.PolyML.cPtr &&> GChar.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val setSize_ = call (getSymbol "g_string_set_size") (GLibStringRecord.PolyML.cPtr &&> GSize.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val truncate_ = call (getSymbol "g_string_truncate") (GLibStringRecord.PolyML.cPtr &&> GSize.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val up_ = call (getSymbol "g_string_up") (GLibStringRecord.PolyML.cPtr --> GLibStringRecord.PolyML.cPtr)
    end
    type t = GLibStringRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun append self val' = (GLibStringRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) append_ (self & val')
    fun appendC self c = (GLibStringRecord.FFI.withPtr &&&> GChar.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) appendC_ (self & c)
    fun appendLen self (val', len) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        appendLen_
        (
          self
           & val'
           & len
        )
    fun appendUnichar self wc = (GLibStringRecord.FFI.withPtr &&&> GChar.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) appendUnichar_ (self & wc)
    fun appendUriEscaped
      self
      (
        unescaped,
        reservedCharsAllowed,
        allowUtf8
      ) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        appendUriEscaped_
        (
          self
           & unescaped
           & reservedCharsAllowed
           & allowUtf8
        )
    fun asciiDown self = (GLibStringRecord.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) asciiDown_ self
    fun asciiUp self = (GLibStringRecord.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) asciiUp_ self
    fun assign self rval = (GLibStringRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) assign_ (self & rval)
    fun down self = (GLibStringRecord.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) down_ self
    fun equal self v2 = (GLibStringRecord.FFI.withPtr &&&> GLibStringRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & v2)
    fun erase self (pos, len) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> GSSize.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        erase_
        (
          self
           & pos
           & len
        )
    fun hash self = (GLibStringRecord.FFI.withPtr ---> GUInt.FFI.fromVal) hash_ self
    fun insert self (pos, val') =
      (
        GLibStringRecord.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> GLibStringRecord.FFI.fromPtr true
      )
        insert_
        (
          self
           & pos
           & val'
        )
    fun insertC self (pos, c) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> GChar.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        insertC_
        (
          self
           & pos
           & c
        )
    fun insertLen
      self
      (
        pos,
        val',
        len
      ) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        insertLen_
        (
          self
           & pos
           & val'
           & len
        )
    fun insertUnichar self (pos, wc) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> GChar.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        insertUnichar_
        (
          self
           & pos
           & wc
        )
    fun overwrite self (pos, val') =
      (
        GLibStringRecord.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> GLibStringRecord.FFI.fromPtr true
      )
        overwrite_
        (
          self
           & pos
           & val'
        )
    fun overwriteLen
      self
      (
        pos,
        val',
        len
      ) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        overwriteLen_
        (
          self
           & pos
           & val'
           & len
        )
    fun prepend self val' = (GLibStringRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) prepend_ (self & val')
    fun prependC self c = (GLibStringRecord.FFI.withPtr &&&> GChar.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) prependC_ (self & c)
    fun prependLen self (val', len) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        prependLen_
        (
          self
           & val'
           & len
        )
    fun prependUnichar self wc = (GLibStringRecord.FFI.withPtr &&&> GChar.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) prependUnichar_ (self & wc)
    fun setSize self len = (GLibStringRecord.FFI.withPtr &&&> GSize.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) setSize_ (self & len)
    fun truncate self len = (GLibStringRecord.FFI.withPtr &&&> GSize.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) truncate_ (self & len)
    fun up self = (GLibStringRecord.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) up_ self
  end
