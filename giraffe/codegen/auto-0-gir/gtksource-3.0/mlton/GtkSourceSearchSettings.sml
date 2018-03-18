structure GtkSourceSearchSettings :>
  GTK_SOURCE_SEARCH_SETTINGS
    where type 'a class = 'a GtkSourceSearchSettingsClass.class =
  struct
    val getType_ = _import "gtk_source_search_settings_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_search_settings_new" : unit -> GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p;
    val getAtWordBoundaries_ = _import "gtk_source_search_settings_get_at_word_boundaries" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p -> GBool.FFI.val_;
    val getCaseSensitive_ = _import "gtk_source_search_settings_get_case_sensitive" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p -> GBool.FFI.val_;
    val getRegexEnabled_ = _import "gtk_source_search_settings_get_regex_enabled" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p -> GBool.FFI.val_;
    val getSearchText_ = _import "gtk_source_search_settings_get_search_text" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p -> unit Utf8.FFI.out_p;
    val getWrapAround_ = _import "gtk_source_search_settings_get_wrap_around" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p -> GBool.FFI.val_;
    val setAtWordBoundaries_ = fn x1 & x2 => (_import "gtk_source_search_settings_set_at_word_boundaries" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCaseSensitive_ = fn x1 & x2 => (_import "gtk_source_search_settings_set_case_sensitive" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRegexEnabled_ = fn x1 & x2 => (_import "gtk_source_search_settings_set_regex_enabled" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSearchText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_search_settings_set_search_text" :
              GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapAround_ = fn x1 & x2 => (_import "gtk_source_search_settings_set_wrap_around" : GtkSourceSearchSettingsClass.FFI.notnull GtkSourceSearchSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
          set = fn x => set "at-word-boundaries" boolean x,
          new = fn x => new "at-word-boundaries" boolean x
        }
      val caseSensitiveProp =
        {
          get = fn x => get "case-sensitive" boolean x,
          set = fn x => set "case-sensitive" boolean x,
          new = fn x => new "case-sensitive" boolean x
        }
      val regexEnabledProp =
        {
          get = fn x => get "regex-enabled" boolean x,
          set = fn x => set "regex-enabled" boolean x,
          new = fn x => new "regex-enabled" boolean x
        }
      val searchTextProp =
        {
          get = fn x => get "search-text" stringOpt x,
          set = fn x => set "search-text" stringOpt x,
          new = fn x => new "search-text" stringOpt x
        }
      val wrapAroundProp =
        {
          get = fn x => get "wrap-around" boolean x,
          set = fn x => set "wrap-around" boolean x,
          new = fn x => new "wrap-around" boolean x
        }
    end
  end
