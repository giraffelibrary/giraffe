structure GLibString :>
  G_LIB_STRING
    where type t = GLibStringRecord.t =
  struct
    val getType_ = _import "g_gstring_get_type" : unit -> GObjectType.FFI.val_;
    val append_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_string_append" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val appendC_ = fn x1 & x2 => (_import "g_string_append_c" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p * GUInt8.FFI.val_ -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;) (x1, x2)
    val appendLen_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_string_append_len" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt64.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val appendUnichar_ = fn x1 & x2 => (_import "g_string_append_unichar" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p * GChar.FFI.val_ -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;) (x1, x2)
    val appendUriEscaped_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_string_append_uri_escaped" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val asciiDown_ = _import "g_string_ascii_down" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
    val asciiUp_ = _import "g_string_ascii_up" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
    val assign_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_string_assign" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val down_ = _import "g_string_down" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
    val equal_ = fn x1 & x2 => (_import "g_string_equal" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p * GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val erase_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_string_erase" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * GInt64.FFI.val_
               * GInt64.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val hash_ = _import "g_string_hash" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p -> GUInt32.FFI.val_;
    val insert_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_g_string_insert" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * GInt64.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val insertC_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_string_insert_c" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * GInt64.FFI.val_
               * GUInt8.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val insertLen_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_string_insert_len" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * GInt64.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt64.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val insertUnichar_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_string_insert_unichar" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * GInt64.FFI.val_
               * GChar.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val overwrite_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_g_string_overwrite" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * GUInt64.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val overwriteLen_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_string_overwrite_len" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * GUInt64.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt64.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val prepend_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_string_prepend" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val prependC_ = fn x1 & x2 => (_import "g_string_prepend_c" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p * GUInt8.FFI.val_ -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;) (x1, x2)
    val prependLen_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_string_prepend_len" :
              GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt64.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val prependUnichar_ = fn x1 & x2 => (_import "g_string_prepend_unichar" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p * GChar.FFI.val_ -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;) (x1, x2)
    val setSize_ = fn x1 & x2 => (_import "g_string_set_size" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p * GUInt64.FFI.val_ -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;) (x1, x2)
    val truncate_ = fn x1 & x2 => (_import "g_string_truncate" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p * GUInt64.FFI.val_ -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;) (x1, x2)
    val up_ = _import "g_string_up" : GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
    type t = GLibStringRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun append self val' = (GLibStringRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) append_ (self & val')
    fun appendC self c = (GLibStringRecord.FFI.withPtr &&&> GUInt8.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) appendC_ (self & c)
    fun appendLen self (val', len) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
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
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        erase_
        (
          self
           & pos
           & len
        )
    fun hash self = (GLibStringRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    fun insert self (pos, val') =
      (
        GLibStringRecord.FFI.withPtr
         &&&> GInt64.FFI.withVal
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
         &&&> GInt64.FFI.withVal
         &&&> GUInt8.FFI.withVal
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
         &&&> GInt64.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
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
         &&&> GInt64.FFI.withVal
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
         &&&> GUInt64.FFI.withVal
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
         &&&> GUInt64.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
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
    fun prependC self c = (GLibStringRecord.FFI.withPtr &&&> GUInt8.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) prependC_ (self & c)
    fun prependLen self (val', len) =
      (
        GLibStringRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        prependLen_
        (
          self
           & val'
           & len
        )
    fun prependUnichar self wc = (GLibStringRecord.FFI.withPtr &&&> GChar.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) prependUnichar_ (self & wc)
    fun setSize self len = (GLibStringRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) setSize_ (self & len)
    fun truncate self len = (GLibStringRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) truncate_ (self & len)
    fun up self = (GLibStringRecord.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) up_ self
  end
