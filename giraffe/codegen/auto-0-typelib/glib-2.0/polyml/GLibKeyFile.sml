structure GLibKeyFile :>
  G_LIB_KEY_FILE
    where type record_t = GLibKeyFileRecord.t
    where type key_file_flags_t = GLibKeyFileFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getBoolean_ =
        call (load_sym libglib "g_key_file_get_boolean")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getComment_ =
        call (load_sym libglib "g_key_file_get_comment")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val getDouble_ =
        call (load_sym libglib "g_key_file_get_double")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Double.PolyML.VAL
          )
      val getInt64_ =
        call (load_sym libglib "g_key_file_get_int64")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Int64.PolyML.VAL
          )
      val getInteger_ =
        call (load_sym libglib "g_key_file_get_integer")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Int32.PolyML.VAL
          )
      val getLocaleString_ =
        call (load_sym libglib "g_key_file_get_locale_string")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val getStartGroup_ = call (load_sym libglib "g_key_file_get_start_group") (GLibKeyFileRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getString_ =
        call (load_sym libglib "g_key_file_get_string")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val getUint64_ =
        call (load_sym libglib "g_key_file_get_uint64")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.UInt64.PolyML.VAL
          )
      val getValue_ =
        call (load_sym libglib "g_key_file_get_value")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val hasGroup_ = call (load_sym libglib "g_key_file_has_group") (GLibKeyFileRecord.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val loadFromData_ =
        call (load_sym libglib "g_key_file_load_from_data")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.UInt64.PolyML.VAL
             &&> GLibKeyFileFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val loadFromDataDirs_ =
        call (load_sym libglib "g_key_file_load_from_data_dirs")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibKeyFileFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val loadFromDirs_ =
        call (load_sym libglib "g_key_file_load_from_dirs")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibKeyFileFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val loadFromFile_ =
        call (load_sym libglib "g_key_file_load_from_file")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibKeyFileFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val removeComment_ =
        call (load_sym libglib "g_key_file_remove_comment")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val removeGroup_ =
        call (load_sym libglib "g_key_file_remove_group")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val removeKey_ =
        call (load_sym libglib "g_key_file_remove_key")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setBoolean_ =
        call (load_sym libglib "g_key_file_set_boolean")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setBooleanList_ =
        call (load_sym libglib "g_key_file_set_boolean_list")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.UInt64.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setComment_ =
        call (load_sym libglib "g_key_file_set_comment")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setDouble_ =
        call (load_sym libglib "g_key_file_set_double")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setDoubleList_ =
        call (load_sym libglib "g_key_file_set_double_list")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.UInt64.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setInt64_ =
        call (load_sym libglib "g_key_file_set_int64")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int64.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setInteger_ =
        call (load_sym libglib "g_key_file_set_integer")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setIntegerList_ =
        call (load_sym libglib "g_key_file_set_integer_list")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.UInt64.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setListSeparator_ = call (load_sym libglib "g_key_file_set_list_separator") (GLibKeyFileRecord.PolyML.PTR &&> FFI.UInt8.PolyML.VAL --> FFI.PolyML.VOID)
      val setLocaleString_ =
        call (load_sym libglib "g_key_file_set_locale_string")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val setLocaleStringList_ =
        call (load_sym libglib "g_key_file_set_locale_string_list")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.UInt64.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setString_ =
        call (load_sym libglib "g_key_file_set_string")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val setUint64_ =
        call (load_sym libglib "g_key_file_set_uint64")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.UInt64.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setValue_ =
        call (load_sym libglib "g_key_file_set_value")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
    end
    type record_t = GLibKeyFileRecord.t
    type key_file_flags_t = GLibKeyFileFlags.t
    type t = record_t
    fun getBoolean self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        getBoolean_
        (
          self
           & groupName
           & key
           & []
        )
    fun getComment self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        getComment_
        (
          self
           & groupName
           & key
           & []
        )
    fun getDouble self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Double.C.fromVal
      )
        getDouble_
        (
          self
           & groupName
           & key
           & []
        )
    fun getInt64 self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int64.C.fromVal
      )
        getInt64_
        (
          self
           & groupName
           & key
           & []
        )
    fun getInteger self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int32.C.fromVal
      )
        getInteger_
        (
          self
           & groupName
           & key
           & []
        )
    fun getLocaleString self groupName key locale =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        getLocaleString_
        (
          self
           & groupName
           & key
           & locale
           & []
        )
    fun getStartGroup self = (GLibKeyFileRecord.C.withPtr ---> FFI.String.C.fromPtr true) getStartGroup_ self
    fun getString self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        getString_
        (
          self
           & groupName
           & key
           & []
        )
    fun getUint64 self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.UInt64.C.fromVal
      )
        getUint64_
        (
          self
           & groupName
           & key
           & []
        )
    fun getValue self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        getValue_
        (
          self
           & groupName
           & key
           & []
        )
    fun hasGroup self groupName = (GLibKeyFileRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasGroup_ (self & groupName)
    fun loadFromData self data length flags =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GLibKeyFileFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFromData_
        (
          self
           & data
           & length
           & flags
           & []
        )
    fun loadFromDataDirs self file fullPath flags =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibKeyFileFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFromDataDirs_
        (
          self
           & file
           & fullPath
           & flags
           & []
        )
    fun loadFromDirs self file searchDirs fullPath flags =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibKeyFileFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFromDirs_
        (
          self
           & file
           & searchDirs
           & fullPath
           & flags
           & []
        )
    fun loadFromFile self file flags =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibKeyFileFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFromFile_
        (
          self
           & file
           & flags
           & []
        )
    fun removeComment self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeComment_
        (
          self
           & groupName
           & key
           & []
        )
    fun removeGroup self groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeGroup_
        (
          self
           & groupName
           & []
        )
    fun removeKey self groupName key =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeKey_
        (
          self
           & groupName
           & key
           & []
        )
    fun setBoolean self groupName key value =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setBoolean_
        (
          self
           & groupName
           & key
           & value
        )
    fun setBooleanList self groupName key list length =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        setBooleanList_
        (
          self
           & groupName
           & key
           & list
           & length
        )
    fun setComment self groupName key comment =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        setComment_
        (
          self
           & groupName
           & key
           & comment
           & []
        )
    fun setDouble self groupName key value =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setDouble_
        (
          self
           & groupName
           & key
           & value
        )
    fun setDoubleList self groupName key list length =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        setDoubleList_
        (
          self
           & groupName
           & key
           & list
           & length
        )
    fun setInt64 self groupName key value =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int64.C.withVal
         ---> I
      )
        setInt64_
        (
          self
           & groupName
           & key
           & value
        )
    fun setInteger self groupName key value =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setInteger_
        (
          self
           & groupName
           & key
           & value
        )
    fun setIntegerList self groupName key list length =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        setIntegerList_
        (
          self
           & groupName
           & key
           & list
           & length
        )
    fun setListSeparator self separator = (GLibKeyFileRecord.C.withPtr &&&> FFI.UInt8.C.withVal ---> I) setListSeparator_ (self & separator)
    fun setLocaleString self groupName key locale string =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        setLocaleString_
        (
          self
           & groupName
           & key
           & locale
           & string
        )
    fun setLocaleStringList self groupName key locale list length =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        setLocaleStringList_
        (
          self
           & groupName
           & key
           & locale
           & list
           & length
        )
    fun setString self groupName key string =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        setString_
        (
          self
           & groupName
           & key
           & string
        )
    fun setUint64 self groupName key value =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        setUint64_
        (
          self
           & groupName
           & key
           & value
        )
    fun setValue self groupName key value =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        setValue_
        (
          self
           & groupName
           & key
           & value
        )
  end
