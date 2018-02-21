structure GtkSourceSearchSettings :>
  GTK_SOURCE_SEARCH_SETTINGS
    where type 'a class = 'a GtkSourceSearchSettingsClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_search_settings_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_search_settings_new") (cVoid --> GtkSourceSearchSettingsClass.PolyML.cPtr)
      val getAtWordBoundaries_ = call (getSymbol "gtk_source_search_settings_get_at_word_boundaries") (GtkSourceSearchSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCaseSensitive_ = call (getSymbol "gtk_source_search_settings_get_case_sensitive") (GtkSourceSearchSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRegexEnabled_ = call (getSymbol "gtk_source_search_settings_get_regex_enabled") (GtkSourceSearchSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSearchText_ = call (getSymbol "gtk_source_search_settings_get_search_text") (GtkSourceSearchSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getWrapAround_ = call (getSymbol "gtk_source_search_settings_get_wrap_around") (GtkSourceSearchSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAtWordBoundaries_ = call (getSymbol "gtk_source_search_settings_set_at_word_boundaries") (GtkSourceSearchSettingsClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCaseSensitive_ = call (getSymbol "gtk_source_search_settings_set_case_sensitive") (GtkSourceSearchSettingsClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRegexEnabled_ = call (getSymbol "gtk_source_search_settings_set_regex_enabled") (GtkSourceSearchSettingsClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSearchText_ = call (getSymbol "gtk_source_search_settings_set_search_text") (GtkSourceSearchSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setWrapAround_ = call (getSymbol "gtk_source_search_settings_set_wrap_around") (GtkSourceSearchSettingsClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkSourceSearchSettingsClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceSearchSettingsClass.FFI.fromPtr true) new_ ()
    fun getAtWordBoundaries self = (GtkSourceSearchSettingsClass.FFI.withPtr ---> GBool.FFI.fromVal) getAtWordBoundaries_ self
    fun getCaseSensitive self = (GtkSourceSearchSettingsClass.FFI.withPtr ---> GBool.FFI.fromVal) getCaseSensitive_ self
    fun getRegexEnabled self = (GtkSourceSearchSettingsClass.FFI.withPtr ---> GBool.FFI.fromVal) getRegexEnabled_ self
    fun getSearchText self = (GtkSourceSearchSettingsClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getSearchText_ self
    fun getWrapAround self = (GtkSourceSearchSettingsClass.FFI.withPtr ---> GBool.FFI.fromVal) getWrapAround_ self
    fun setAtWordBoundaries self atWordBoundaries = (GtkSourceSearchSettingsClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAtWordBoundaries_ (self & atWordBoundaries)
    fun setCaseSensitive self caseSensitive = (GtkSourceSearchSettingsClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCaseSensitive_ (self & caseSensitive)
    fun setRegexEnabled self regexEnabled = (GtkSourceSearchSettingsClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRegexEnabled_ (self & regexEnabled)
    fun setSearchText self searchText = (GtkSourceSearchSettingsClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setSearchText_ (self & searchText)
    fun setWrapAround self wrapAround = (GtkSourceSearchSettingsClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setWrapAround_ (self & wrapAround)
    local
      open Property
    in
      val atWordBoundariesProp =
        {
          get = fn x => get "at-word-boundaries" boolean x,
          set = fn x => set "at-word-boundaries" boolean x
        }
      val caseSensitiveProp =
        {
          get = fn x => get "case-sensitive" boolean x,
          set = fn x => set "case-sensitive" boolean x
        }
      val regexEnabledProp =
        {
          get = fn x => get "regex-enabled" boolean x,
          set = fn x => set "regex-enabled" boolean x
        }
      val searchTextProp =
        {
          get = fn x => get "search-text" stringOpt x,
          set = fn x => set "search-text" stringOpt x
        }
      val wrapAroundProp =
        {
          get = fn x => get "wrap-around" boolean x,
          set = fn x => set "wrap-around" boolean x
        }
    end
  end
