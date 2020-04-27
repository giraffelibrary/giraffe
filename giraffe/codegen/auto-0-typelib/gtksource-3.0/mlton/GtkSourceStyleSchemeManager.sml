structure GtkSourceStyleSchemeManager :>
  GTK_SOURCE_STYLE_SCHEME_MANAGER
    where type 'a class = 'a GtkSourceStyleSchemeManagerClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class =
  struct
    val getType_ = _import "gtk_source_style_scheme_manager_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_style_scheme_manager_new" : unit -> GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p;
    val getDefault_ = _import "gtk_source_style_scheme_manager_get_default" : unit -> GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p;
    val appendSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_append_search_path" :
              GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val forceRescan_ = _import "gtk_source_style_scheme_manager_force_rescan" : GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p -> unit;
    val getScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_get_scheme" :
              GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GtkSourceStyleSchemeClass.FFI.notnull GtkSourceStyleSchemeClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getSchemeIds_ = _import "gtk_source_style_scheme_manager_get_scheme_ids" : GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p -> unit Utf8CPtrArray.FFI.out_p;
    val getSearchPath_ = _import "gtk_source_style_scheme_manager_get_search_path" : GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p -> Utf8CPtrArray.FFI.notnull Utf8CPtrArray.FFI.out_p;
    val prependSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_prepend_search_path" :
              GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_set_search_path" :
              GtkSourceStyleSchemeManagerClass.FFI.notnull GtkSourceStyleSchemeManagerClass.FFI.p
               * Utf8CPtrArray.MLton.p1
               * unit Utf8CPtrArray.MLton.p2
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeManagerClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceStyleSchemeManagerClass.FFI.fromPtr false) getDefault_ ()
    fun appendSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) appendSearchPath_ (self & path)
    fun forceRescan self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr ---> I) forceRescan_ self
    fun getScheme self schemeId = (GtkSourceStyleSchemeManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceStyleSchemeClass.FFI.fromPtr false) getScheme_ (self & schemeId)
    fun getSchemeIds self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr ---> Utf8CPtrArray.FFI.fromOptPtr 0) getSchemeIds_ self
    fun getSearchPath self = (GtkSourceStyleSchemeManagerClass.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 0) getSearchPath_ self
    fun prependSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) prependSearchPath_ (self & path)
    fun setSearchPath self path = (GtkSourceStyleSchemeManagerClass.FFI.withPtr &&&> Utf8CPtrArray.FFI.withOptPtr ---> I) setSearchPath_ (self & path)
  end
