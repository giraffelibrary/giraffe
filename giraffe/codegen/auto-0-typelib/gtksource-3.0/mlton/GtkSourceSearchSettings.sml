structure GtkSourceSearchSettings :>
  GTK_SOURCE_SEARCH_SETTINGS
    where type 'a class = 'a GtkSourceSearchSettingsClass.class =
  struct
    val getType_ = _import "gtk_source_search_settings_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_search_settings_new" : unit -> GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p;
    val getAtWordBoundaries_ = _import "gtk_source_search_settings_get_at_word_boundaries" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p -> GBool.FFI.val_;
    val getCaseSensitive_ = _import "gtk_source_search_settings_get_case_sensitive" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p -> GBool.FFI.val_;
    val getRegexEnabled_ = _import "gtk_source_search_settings_get_regex_enabled" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p -> GBool.FFI.val_;
    val getSearchText_ = _import "gtk_source_search_settings_get_search_text" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getWrapAround_ = _import "gtk_source_search_settings_get_wrap_around" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p -> GBool.FFI.val_;
    val setAtWordBoundaries_ = fn x1 & x2 => (_import "gtk_source_search_settings_set_at_word_boundaries" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCaseSensitive_ = fn x1 & x2 => (_import "gtk_source_search_settings_set_case_sensitive" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRegexEnabled_ = fn x1 & x2 => (_import "gtk_source_search_settings_set_regex_enabled" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSearchText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_search_settings_set_search_text" :
              GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapAround_ = fn x1 & x2 => (_import "gtk_source_search_settings_set_wrap_around" : GtkSourceSearchSettingsClass.FFI.non_opt GtkSourceSearchSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceSearchSettingsClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceSearchSettingsClass.FFI.fromPtr true) new_ ()
    fun getAtWordBoundaries self = (GtkSourceSearchSettingsClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAtWordBoundaries_ self
    fun getCaseSensitive self = (GtkSourceSearchSettingsClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCaseSensitive_ self
    fun getRegexEnabled self = (GtkSourceSearchSettingsClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRegexEnabled_ self
    fun getSearchText self = (GtkSourceSearchSettingsClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getSearchText_ self before GtkSourceSearchSettingsClass.FFI.touchPtr self
    fun getWrapAround self = (GtkSourceSearchSettingsClass.FFI.withPtr false ---> GBool.FFI.fromVal) getWrapAround_ self
    fun setAtWordBoundaries self atWordBoundaries = (GtkSourceSearchSettingsClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAtWordBoundaries_ (self & atWordBoundaries)
    fun setCaseSensitive self caseSensitive = (GtkSourceSearchSettingsClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCaseSensitive_ (self & caseSensitive)
    fun setRegexEnabled self regexEnabled = (GtkSourceSearchSettingsClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRegexEnabled_ (self & regexEnabled)
    fun setSearchText self searchText = (GtkSourceSearchSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setSearchText_ (self & searchText)
    fun setWrapAround self wrapAround = (GtkSourceSearchSettingsClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setWrapAround_ (self & wrapAround)
    local
      open ValueAccessor
    in
      val atWordBoundariesProp =
        {
          name = "at-word-boundaries",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val caseSensitiveProp =
        {
          name = "case-sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val regexEnabledProp =
        {
          name = "regex-enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val searchTextProp =
        {
          name = "search-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val wrapAroundProp =
        {
          name = "wrap-around",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
