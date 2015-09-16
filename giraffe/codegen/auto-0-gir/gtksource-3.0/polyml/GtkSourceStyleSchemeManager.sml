structure GtkSourceStyleSchemeManager :>
  GTK_SOURCE_STYLE_SCHEME_MANAGER
    where type 'a class_t = 'a GtkSourceStyleSchemeManagerClass.t
    where type 'a style_scheme_class_t = 'a GtkSourceStyleSchemeClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDefault_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val appendSearchPath_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_append_search_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val forceRescan_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_force_rescan") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getScheme_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_get_scheme") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val prependSearchPath_ = call (load_sym libgtksourceview "gtk_source_style_scheme_manager_prepend_search_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSourceStyleSchemeManagerClass.t
    type 'a style_scheme_class_t = 'a GtkSourceStyleSchemeClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceStyleSchemeManagerClass.C.fromPtr false) getDefault_ ()
    fun appendSearchPath self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) appendSearchPath_ (self & path)
    fun forceRescan self = (GObjectObjectClass.C.withPtr ---> I) forceRescan_ self
    fun getScheme self schemeId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkSourceStyleSchemeClass.C.fromPtr false) getScheme_ (self & schemeId)
    fun prependSearchPath self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) prependSearchPath_ (self & path)
  end
