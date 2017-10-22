structure GLibKeyFile :>
  G_LIB_KEY_FILE
    where type t = GLibKeyFileRecord.t
    where type bytes_t = GLibBytesRecord.t
    where type key_file_flags_t = GLibKeyFileFlags.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure GInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt32Type
        structure ElemSequence = CValueVectorSequence(GInt32Type)
      )
    structure GInt32CVectorN = CVectorN(GInt32CVectorNType)
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure GDoubleCVectorNType =
      CValueCVectorNType(
        structure CElemType = GDoubleType
        structure ElemSequence = CValueVectorSequence(GDoubleType)
      )
    structure GDoubleCVectorN = CVectorN(GDoubleCVectorNType)
    structure GBoolCVectorNType =
      CValueCVectorNType(
        structure CElemType = GBoolType
        structure ElemSequence = CValueVectorSequence(GBoolType)
      )
    structure GBoolCVectorN = CVectorN(GBoolCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_key_file_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_key_file_new") (cVoid --> GLibKeyFileRecord.PolyML.cPtr)
      val getBoolean_ =
        call (getSymbol "g_key_file_get_boolean")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getBooleanList_ =
        call (getSymbol "g_key_file_get_boolean_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBoolCVectorN.PolyML.cOutPtr
          )
      val getComment_ =
        call (getSymbol "g_key_file_get_comment")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val getDouble_ =
        call (getSymbol "g_key_file_get_double")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GDouble.PolyML.cVal
          )
      val getDoubleList_ =
        call (getSymbol "g_key_file_get_double_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GDoubleCVectorN.PolyML.cOutPtr
          )
      val getGroups_ = call (getSymbol "g_key_file_get_groups") (GLibKeyFileRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CVector.PolyML.cOutPtr)
      val getInt64_ =
        call (getSymbol "g_key_file_get_int64")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val getInteger_ =
        call (getSymbol "g_key_file_get_integer")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt32.PolyML.cVal
          )
      val getIntegerList_ =
        call (getSymbol "g_key_file_get_integer_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt32CVectorN.PolyML.cOutPtr
          )
      val getKeys_ =
        call (getSymbol "g_key_file_get_keys")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CVector.PolyML.cOutPtr
          )
      val getLocaleString_ =
        call (getSymbol "g_key_file_get_locale_string")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val getLocaleStringList_ =
        call (getSymbol "g_key_file_get_locale_string_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CVectorN.PolyML.cOutPtr
          )
      val getStartGroup_ = call (getSymbol "g_key_file_get_start_group") (GLibKeyFileRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getString_ =
        call (getSymbol "g_key_file_get_string")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val getStringList_ =
        call (getSymbol "g_key_file_get_string_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CVectorN.PolyML.cOutPtr
          )
      val getUint64_ =
        call (getSymbol "g_key_file_get_uint64")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt64.PolyML.cVal
          )
      val getValue_ =
        call (getSymbol "g_key_file_get_value")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val hasGroup_ = call (getSymbol "g_key_file_has_group") (GLibKeyFileRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val loadFromBytes_ =
        call (getSymbol "g_key_file_load_from_bytes")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> GLibBytesRecord.PolyML.cPtr
             &&> GLibKeyFileFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadFromData_ =
        call (getSymbol "g_key_file_load_from_data")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GLibKeyFileFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadFromDataDirs_ =
        call (getSymbol "g_key_file_load_from_data_dirs")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibKeyFileFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadFromDirs_ =
        call (getSymbol "g_key_file_load_from_dirs")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibKeyFileFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadFromFile_ =
        call (getSymbol "g_key_file_load_from_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibKeyFileFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val removeComment_ =
        call (getSymbol "g_key_file_remove_comment")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val removeGroup_ =
        call (getSymbol "g_key_file_remove_group")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val removeKey_ =
        call (getSymbol "g_key_file_remove_key")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val saveToFile_ =
        call (getSymbol "g_key_file_save_to_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setBoolean_ =
        call (getSymbol "g_key_file_set_boolean")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setBooleanList_ =
        call (getSymbol "g_key_file_set_boolean_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBoolCVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setComment_ =
        call (getSymbol "g_key_file_set_comment")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setDouble_ =
        call (getSymbol "g_key_file_set_double")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setDoubleList_ =
        call (getSymbol "g_key_file_set_double_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDoubleCVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setInt64_ =
        call (getSymbol "g_key_file_set_int64")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val setInteger_ =
        call (getSymbol "g_key_file_set_integer")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setIntegerList_ =
        call (getSymbol "g_key_file_set_integer_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setListSeparator_ = call (getSymbol "g_key_file_set_list_separator") (GLibKeyFileRecord.PolyML.cPtr &&> GInt8.PolyML.cVal --> cVoid)
      val setLocaleString_ =
        call (getSymbol "g_key_file_set_locale_string")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val setLocaleStringList_ =
        call (getSymbol "g_key_file_set_locale_string_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setString_ =
        call (getSymbol "g_key_file_set_string")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val setStringList_ =
        call (getSymbol "g_key_file_set_string_list")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setUint64_ =
        call (getSymbol "g_key_file_set_uint64")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setValue_ =
        call (getSymbol "g_key_file_set_value")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val toData_ =
        call (getSymbol "g_key_file_to_data")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
    end
    type t = GLibKeyFileRecord.t
    type bytes_t = GLibBytesRecord.t
    type key_file_flags_t = GLibKeyFileFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GLibKeyFileRecord.FFI.fromPtr true) new_ ()
    fun getBoolean self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        getBoolean_
        (
          self
           & groupName
           & key
           & []
        )
    fun getBooleanList self (groupName, key) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && GBoolCVectorN.FFI.fromPtr 1
          )
            getBooleanList_
            (
              self
               & groupName
               & key
               & GUInt64.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getComment self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        getComment_
        (
          self
           & groupName
           & key
           & []
        )
    fun getDouble self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GDouble.FFI.fromVal
      )
        getDouble_
        (
          self
           & groupName
           & key
           & []
        )
    fun getDoubleList self (groupName, key) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && GDoubleCVectorN.FFI.fromPtr 1
          )
            getDoubleList_
            (
              self
               & groupName
               & key
               & GUInt64.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getGroups self =
      let
        val length & retVal = (GLibKeyFileRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVector.FFI.fromPtr 2) getGroups_ (self & GUInt64.null)
      in
        (retVal, length)
      end
    fun getInt64 self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        getInt64_
        (
          self
           & groupName
           & key
           & []
        )
    fun getInteger self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
      )
        getInteger_
        (
          self
           & groupName
           & key
           & []
        )
    fun getIntegerList self (groupName, key) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && GInt32CVectorN.FFI.fromPtr 1
          )
            getIntegerList_
            (
              self
               & groupName
               & key
               & GUInt64.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getKeys self groupName =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && Utf8CVector.FFI.fromPtr 2
          )
            getKeys_
            (
              self
               & groupName
               & GUInt64.null
               & []
            )
      in
        (retVal, length)
      end
    fun getLocaleString
      self
      (
        groupName,
        key,
        locale
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        getLocaleString_
        (
          self
           & groupName
           & key
           & locale
           & []
        )
    fun getLocaleStringList
      self
      (
        groupName,
        key,
        locale
      ) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withOptPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2
          )
            getLocaleStringList_
            (
              self
               & groupName
               & key
               & locale
               & GUInt64.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getStartGroup self = (GLibKeyFileRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getStartGroup_ self
    fun getString self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        getString_
        (
          self
           & groupName
           & key
           & []
        )
    fun getStringList self (groupName, key) =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2
          )
            getStringList_
            (
              self
               & groupName
               & key
               & GUInt64.null
               & []
            )
      in
        retVal (LargeInt.toInt length)
      end
    fun getUint64 self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GUInt64.FFI.fromVal
      )
        getUint64_
        (
          self
           & groupName
           & key
           & []
        )
    fun getValue self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        getValue_
        (
          self
           & groupName
           & key
           & []
        )
    fun hasGroup self groupName = (GLibKeyFileRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasGroup_ (self & groupName)
    fun loadFromBytes self (bytes, flags) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> GLibBytesRecord.FFI.withPtr
         &&&> GLibKeyFileFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromBytes_
        (
          self
           & bytes
           & flags
           & []
        )
    fun loadFromData
      self
      (
        data,
        length,
        flags
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GLibKeyFileFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromData_
        (
          self
           & data
           & length
           & flags
           & []
        )
    fun loadFromDataDirs self (file, flags) =
      let
        val fullPath & () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibKeyFileFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && ignore
          )
            loadFromDataDirs_
            (
              self
               & file
               & NONE
               & flags
               & []
            )
      in
        fullPath
      end
    fun loadFromDirs
      self
      (
        file,
        searchDirs,
        flags
      ) =
      let
        val fullPath & () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8CVector.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibKeyFileFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && ignore
          )
            loadFromDirs_
            (
              self
               & file
               & searchDirs
               & NONE
               & flags
               & []
            )
      in
        fullPath
      end
    fun loadFromFile self (file, flags) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibKeyFileFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFromFile_
        (
          self
           & file
           & flags
           & []
        )
    fun removeComment self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeGroup_
        (
          self
           & groupName
           & []
        )
    fun removeKey self (groupName, key) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeKey_
        (
          self
           & groupName
           & key
           & []
        )
    fun saveToFile self filename =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        saveToFile_
        (
          self
           & filename
           & []
        )
    fun setBoolean
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setBoolean_
        (
          self
           & groupName
           & key
           & value
        )
    fun setBooleanList
      self
      (
        groupName,
        key,
        list
      ) =
      let
        val length = LargeInt.fromInt (GBoolCVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GBoolCVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
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
      in
        ()
      end
    fun setComment
      self
      (
        groupName,
        key,
        comment
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setComment_
        (
          self
           & groupName
           & key
           & comment
           & []
        )
    fun setDouble
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setDouble_
        (
          self
           & groupName
           & key
           & value
        )
    fun setDoubleList
      self
      (
        groupName,
        key,
        list
      ) =
      let
        val length = LargeInt.fromInt (GDoubleCVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GDoubleCVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
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
      in
        ()
      end
    fun setInt64
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
         ---> I
      )
        setInt64_
        (
          self
           & groupName
           & key
           & value
        )
    fun setInteger
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setInteger_
        (
          self
           & groupName
           & key
           & value
        )
    fun setIntegerList
      self
      (
        groupName,
        key,
        list
      ) =
      let
        val length = LargeInt.fromInt (GInt32CVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GInt32CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
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
      in
        ()
      end
    fun setListSeparator self separator = (GLibKeyFileRecord.FFI.withPtr &&&> GInt8.FFI.withVal ---> I) setListSeparator_ (self & separator)
    fun setLocaleString
      self
      (
        groupName,
        key,
        locale,
        string
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
    fun setLocaleStringList
      self
      (
        groupName,
        key,
        locale,
        list
      ) =
      let
        val length = LargeInt.fromInt (Utf8CVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
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
      in
        ()
      end
    fun setString
      self
      (
        groupName,
        key,
        string
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setString_
        (
          self
           & groupName
           & key
           & string
        )
    fun setStringList
      self
      (
        groupName,
        key,
        list
      ) =
      let
        val length = LargeInt.fromInt (Utf8CVectorN.length list)
        val () =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             ---> I
          )
            setStringList_
            (
              self
               & groupName
               & key
               & list
               & length
            )
      in
        ()
      end
    fun setUint64
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         ---> I
      )
        setUint64_
        (
          self
           & groupName
           & key
           & value
        )
    fun setValue
      self
      (
        groupName,
        key,
        value
      ) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        setValue_
        (
          self
           & groupName
           & key
           & value
        )
    fun toData self =
      let
        val length & retVal =
          (
            GLibKeyFileRecord.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && Utf8.FFI.fromPtr 1
          )
            toData_
            (
              self
               & GUInt64.null
               & []
            )
      in
        (retVal, length)
      end
  end
