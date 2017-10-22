structure GLibOptionGroup :>
  G_LIB_OPTION_GROUP
    where type t = GLibOptionGroupRecord.t
    where type option_entry_t = GLibOptionEntryRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_option_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addEntries_ = call (getSymbol "g_option_group_add_entries") (GLibOptionGroupRecord.PolyML.cPtr &&> GLibOptionEntryRecord.PolyML.cPtr --> cVoid)
      val setTranslationDomain_ = call (getSymbol "g_option_group_set_translation_domain") (GLibOptionGroupRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type t = GLibOptionGroupRecord.t
    type option_entry_t = GLibOptionEntryRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addEntries self entries = (GLibOptionGroupRecord.FFI.withPtr &&&> GLibOptionEntryRecord.FFI.withPtr ---> I) addEntries_ (self & entries)
    fun setTranslationDomain self domain = (GLibOptionGroupRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTranslationDomain_ (self & domain)
  end
