structure GLibOptionGroup :>
  G_LIB_OPTION_GROUP
    where type t = GLibOptionGroupRecord.t
    where type option_entry_t = GLibOptionEntryRecord.t =
  struct
    val getType_ = _import "g_option_group_get_type" : unit -> GObjectType.FFI.val_;
    val addEntries_ = fn x1 & x2 => (_import "g_option_group_add_entries" : GLibOptionGroupRecord.FFI.notnull GLibOptionGroupRecord.FFI.p * GLibOptionEntryRecord.FFI.notnull GLibOptionEntryRecord.FFI.p -> unit;) (x1, x2)
    val setTranslationDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_option_group_set_translation_domain" :
              GLibOptionGroupRecord.FFI.notnull GLibOptionGroupRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibOptionGroupRecord.t
    type option_entry_t = GLibOptionEntryRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addEntries self entries = (GLibOptionGroupRecord.FFI.withPtr &&&> GLibOptionEntryRecord.FFI.withPtr ---> I) addEntries_ (self & entries)
    fun setTranslationDomain self domain = (GLibOptionGroupRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTranslationDomain_ (self & domain)
  end
