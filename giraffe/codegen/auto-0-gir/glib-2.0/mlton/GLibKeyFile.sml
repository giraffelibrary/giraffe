structure GLibKeyFile :>
  G_LIB_KEY_FILE
    where type record_t = GLibKeyFileRecord.t
    where type keyfileflags_t = GLibKeyFileFlags.t =
  struct
    val getBoolean_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_boolean" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getComment_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_comment" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getDouble_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_double" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Double.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getInt64_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_int64" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getInteger_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_integer" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getLocaleString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_key_file_get_locale_string" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val getStartGroup_ = _import "g_key_file_get_start_group" : GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_string" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getUint64_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_uint64" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getValue_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_get_value" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val hasGroup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_key_file_has_group" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val loadFromData_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_key_file_load_from_data" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * FFI.Size.C.val_
               * GLibKeyFileFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val loadFromDataDirs_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_load_from_data_dirs" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GLibKeyFileFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val loadFromDirs_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8
         & x9 =>
          (
            _import "mlton_g_key_file_load_from_dirs" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GLibKeyFileFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val loadFromFile_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_key_file_load_from_file" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * GLibKeyFileFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val removeComment_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_remove_comment" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val removeGroup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_key_file_remove_group" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeKey_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_remove_key" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setBoolean_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_boolean" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setBooleanList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_set_boolean_list" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Bool.C.val_
               * FFI.Size.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setComment_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_key_file_set_comment" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setDouble_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_double" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setDoubleList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_set_double_list" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Double.C.val_
               * FFI.Size.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setInt64_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_int64" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Int64.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setInteger_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_integer" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setIntegerList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_key_file_set_integer_list" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Int.C.val_
               * FFI.Size.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setListSeparator_ = fn x1 & x2 => (_import "g_key_file_set_list_separator" : GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p * FFI.Char.C.val_ -> unit;) (x1, x2)
    val setLocaleString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_g_key_file_set_locale_string" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val setLocaleStringList_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10 =>
          (
            _import "mlton_g_key_file_set_locale_string_list" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Size.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val setString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7) =>
          (
            _import "mlton_g_key_file_set_string" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setUint64_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_key_file_set_uint64" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.UInt64.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setValue_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7) =>
          (
            _import "mlton_g_key_file_set_value" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    type record_t = GLibKeyFileRecord.t
    type keyfileflags_t = GLibKeyFileFlags.t
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
         ---> FFI.Int.C.fromVal
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
         &&&> FFI.Size.C.withVal
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
         &&&> FFI.Size.C.withVal
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
         &&&> FFI.Size.C.withVal
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
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Size.C.withVal
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
    fun setListSeparator self separator = (GLibKeyFileRecord.C.withPtr &&&> FFI.Char.C.withVal ---> I) setListSeparator_ (self & separator)
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
         &&&> FFI.Size.C.withVal
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
