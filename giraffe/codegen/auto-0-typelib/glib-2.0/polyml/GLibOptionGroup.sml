structure GLibOptionGroup :>
  G_LIB_OPTION_GROUP
    where type t = GLibOptionGroupRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_option_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val setTranslationDomain_ = call (getSymbol "g_option_group_set_translation_domain") (GLibOptionGroupRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type t = GLibOptionGroupRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun setTranslationDomain self domain = (GLibOptionGroupRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTranslationDomain_ (self & domain)
  end
