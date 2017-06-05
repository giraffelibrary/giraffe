structure GtkSourceStyleSchemeManager :>
  GTK_SOURCE_STYLE_SCHEME_MANAGER
    where type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_new") (PolyMLFFI.cVoid --> GtkSourceStyleSchemeManagerClass.PolyML.cPtr)
      val getDefault_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_default") (PolyMLFFI.cVoid --> GtkSourceStyleSchemeManagerClass.PolyML.cPtr)
      val appendSearchPath_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_append_search_path") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val forceRescan_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_force_rescan") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getScheme_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_scheme") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceStyleSchemeClass.PolyML.cPtr)
      val getSchemeIds_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_scheme_ids") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getSearchPath_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_search_path") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val prependSearchPath_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_prepend_search_path") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setSearchPath_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_set_search_path") (GtkSourceStyleSchemeManagerClass.PolyML.cPtr &&> Utf8CVector.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeManagerClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceStyleSchemeManagerClass.FFI.fromPtr false) getDefault_ ()
    fun appendSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) appendSearchPath_ (self & path)
    fun forceRescan self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr ---> I) forceRescan_ self
    fun getScheme self schemeId = (GtkSourceStyleSchemeManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceStyleSchemeClass.FFI.fromPtr false) getScheme_ (self & schemeId)
    fun getSchemeIds self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getSchemeIds_ self
    fun getSearchPath self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getSearchPath_ self
    fun prependSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) prependSearchPath_ (self & path)
    fun setSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr &&&> Utf8CVector.FFI.withOptPtr ---> I) setSearchPath_ (self & path)
  end
