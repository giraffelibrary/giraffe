structure GtkSourceStyleSchemeManager :>
  GTK_SOURCE_STYLE_SCHEME_MANAGER
    where type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getDefault_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val appendSearchPath_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_append_search_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val forceRescan_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_force_rescan") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getScheme_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_scheme") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val prependSearchPath_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_prepend_search_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceStyleSchemeManagerClass.C.fromPtr false) getDefault_ ()
    fun appendSearchPath self path = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) appendSearchPath_ (self & path)
    fun forceRescan self = (GObjectObjectClass.C.withPtr ---> I) forceRescan_ self
    fun getScheme self schemeId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSourceStyleSchemeClass.C.fromPtr false) getScheme_ (self & schemeId)
    fun prependSearchPath self path = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) prependSearchPath_ (self & path)
  end
