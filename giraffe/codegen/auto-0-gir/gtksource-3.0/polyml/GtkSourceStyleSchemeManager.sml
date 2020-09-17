structure GtkSourceStyleSchemeManager :>
  GTK_SOURCE_STYLE_SCHEME_MANAGER
    where type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_style_scheme_manager_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_style_scheme_manager_new") (cVoid --> GtkSourceStyleSchemeManagerClass.PolyML.cPtr)
      val getDefault_ = call (getSymbol "gtk_source_style_scheme_manager_get_default") (cVoid --> GtkSourceStyleSchemeManagerClass.PolyML.cPtr)
      val appendSearchPath_ = call (getSymbol "gtk_source_style_scheme_manager_append_search_path") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val forceRescan_ = call (getSymbol "gtk_source_style_scheme_manager_force_rescan") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr --> cVoid)
      val getScheme_ = call (getSymbol "gtk_source_style_scheme_manager_get_scheme") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceStyleSchemeClass.PolyML.cPtr)
      val getSchemeIds_ = call (getSymbol "gtk_source_style_scheme_manager_get_scheme_ids") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutOptPtr)
      val getSearchPath_ = call (getSymbol "gtk_source_style_scheme_manager_get_search_path") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val prependSearchPath_ = call (getSymbol "gtk_source_style_scheme_manager_prepend_search_path") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setSearchPath_ = call (getSymbol "gtk_source_style_scheme_manager_set_search_path") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr &&> Utf8CPtrArray.PolyML.cInOptPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeManagerClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceStyleSchemeManagerClass.FFI.fromPtr false) getDefault_ ()
    fun appendSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) appendSearchPath_ (self & path)
    fun forceRescan self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr false ---> I) forceRescan_ self
    fun getScheme self schemeId = (GtkSourceStyleSchemeManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkSourceStyleSchemeClass.FFI.fromPtr false) getScheme_ (self & schemeId) before GtkSourceStyleSchemeManagerClass.FFI.touchPtr self before Utf8.FFI.touchPtr schemeId
    fun getSchemeIds self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromOptPtr 0) getSchemeIds_ self before GtkSourceStyleSchemeManagerClass.FFI.touchPtr self
    fun getSearchPath self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getSearchPath_ self before GtkSourceStyleSchemeManagerClass.FFI.touchPtr self
    fun prependSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) prependSearchPath_ (self & path)
    fun setSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withOptPtr 0 ---> I) setSearchPath_ (self & path)
  end
