structure GtkSourceStyleSchemeManager :>
  GTK_SOURCE_STYLE_SCHEME_MANAGER
    where type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class =
  struct
    val getType_ = _import "gtk_source_style_scheme_manager_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_style_scheme_manager_new" : unit -> GtkSourceStyleSchemeManagerClass.C.notnull GtkSourceStyleSchemeManagerClass.C.p;
    val getDefault_ = _import "gtk_source_style_scheme_manager_get_default" : unit -> GtkSourceStyleSchemeManagerClass.C.notnull GtkSourceStyleSchemeManagerClass.C.p;
    val appendSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_append_search_path" :
              GtkSourceStyleSchemeManagerClass.C.notnull GtkSourceStyleSchemeManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val forceRescan_ = _import "gtk_source_style_scheme_manager_force_rescan" : GtkSourceStyleSchemeManagerClass.C.notnull GtkSourceStyleSchemeManagerClass.C.p -> unit;
    val getScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_get_scheme" :
              GtkSourceStyleSchemeManagerClass.C.notnull GtkSourceStyleSchemeManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkSourceStyleSchemeClass.C.notnull GtkSourceStyleSchemeClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val prependSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_prepend_search_path" :
              GtkSourceStyleSchemeManagerClass.C.notnull GtkSourceStyleSchemeManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceStyleSchemeManagerClass.C.fromPtr false) getDefault_ ()
    fun appendSearchPath self path = (GtkSourceStyleSchemeManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> I) appendSearchPath_ (self & path)
    fun forceRescan self = (GtkSourceStyleSchemeManagerClass.C.withPtr ---> I) forceRescan_ self
    fun getScheme self schemeId = (GtkSourceStyleSchemeManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSourceStyleSchemeClass.C.fromPtr false) getScheme_ (self & schemeId)
    fun prependSearchPath self path = (GtkSourceStyleSchemeManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> I) prependSearchPath_ (self & path)
  end
