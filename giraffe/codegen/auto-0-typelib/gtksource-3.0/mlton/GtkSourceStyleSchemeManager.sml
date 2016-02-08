structure GtkSourceStyleSchemeManager :>
  GTK_SOURCE_STYLE_SCHEME_MANAGER
    where type 'a class_t = 'a GtkSourceStyleSchemeManagerClass.t
    where type 'a style_scheme_class_t = 'a GtkSourceStyleSchemeClass.t =
  struct
    val getType_ = _import "gtk_source_style_scheme_manager_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_style_scheme_manager_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDefault_ = _import "gtk_source_style_scheme_manager_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val appendSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_append_search_path" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val forceRescan_ = _import "gtk_source_style_scheme_manager_force_rescan" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_style_scheme_manager_get_scheme" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkSourceStyleSchemeManagerClass.t
    type 'a style_scheme_class_t = 'a GtkSourceStyleSchemeClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceStyleSchemeManagerClass.C.fromPtr false) getDefault_ ()
    fun appendSearchPath self path = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) appendSearchPath_ (self & path)
    fun forceRescan self = (GObjectObjectClass.C.withPtr ---> I) forceRescan_ self
    fun getScheme self schemeId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> GtkSourceStyleSchemeClass.C.fromPtr false) getScheme_ (self & schemeId)
    fun prependSearchPath self path = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) prependSearchPath_ (self & path)
  end
