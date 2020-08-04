structure GLibOptionGroup :>
  G_LIB_OPTION_GROUP
    where type t = GLibOptionGroupRecord.t
    where type option_entry_t = GLibOptionEntryRecord.t =
  struct
    val getType_ = _import "g_option_group_get_type" : unit -> GObjectType.FFI.val_;
    val addEntries_ = fn x1 & x2 => (_import "g_option_group_add_entries" : GLibOptionGroupRecord.FFI.non_opt GLibOptionGroupRecord.FFI.p * GLibOptionEntryRecord.FFI.non_opt GLibOptionEntryRecord.FFI.p -> unit;) (x1, x2)
    val setTranslationDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_option_group_set_translation_domain" :
              GLibOptionGroupRecord.FFI.non_opt GLibOptionGroupRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    fun addEntries self entries = (GLibOptionGroupRecord.FFI.withPtr false &&&> GLibOptionEntryRecord.FFI.withPtr false ---> I) addEntries_ (self & entries)
    fun setTranslationDomain self domain = (GLibOptionGroupRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTranslationDomain_ (self & domain)
  end
