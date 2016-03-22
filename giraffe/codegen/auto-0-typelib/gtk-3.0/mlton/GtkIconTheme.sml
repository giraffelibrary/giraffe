structure GtkIconTheme :>
  GTK_ICON_THEME
    where type 'a class = 'a GtkIconThemeClass.class
    where type icon_info_t = GtkIconInfoRecord.t
    where type icon_lookup_flags_t = GtkIconLookupFlags.t =
  struct
    val getType_ = _import "gtk_icon_theme_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_icon_theme_new" : unit -> GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p;
    val addBuiltinIcon_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_icon_theme_add_builtin_icon" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDefault_ = _import "gtk_icon_theme_get_default" : unit -> GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p;
    val getForScreen_ = _import "gtk_icon_theme_get_for_screen" : GdkScreenClass.C.notnull GdkScreenClass.C.p -> GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p;
    val appendSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_append_search_path" :
              GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getExampleIconName_ = _import "gtk_icon_theme_get_example_icon_name" : GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val hasIcon_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_has_icon" :
              GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val loadIcon_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_gtk_icon_theme_load_icon" :
              GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               * GtkIconLookupFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val lookupByGicon_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_theme_lookup_by_gicon" :
              GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p
               * GioIconClass.C.notnull GioIconClass.C.p
               * FFI.Int32.C.val_
               * GtkIconLookupFlags.C.val_
               -> GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val lookupIcon_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_icon_theme_lookup_icon" :
              GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               * GtkIconLookupFlags.C.val_
               -> GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val prependSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_prepend_search_path" :
              GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rescanIfNeeded_ = _import "gtk_icon_theme_rescan_if_needed" : GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p -> FFI.Bool.C.val_;
    val setCustomTheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_set_custom_theme" :
              GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gtk_icon_theme_set_screen" : GtkIconThemeClass.C.notnull GtkIconThemeClass.C.p * GdkScreenClass.C.notnull GdkScreenClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkIconThemeClass.class
    type icon_info_t = GtkIconInfoRecord.t
    type icon_lookup_flags_t = GtkIconLookupFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconThemeClass.C.fromPtr true) new_ ()
    fun addBuiltinIcon iconName size pixbuf =
      (
        Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GdkPixbufPixbufClass.C.withPtr
         ---> I
      )
        addBuiltinIcon_
        (
          iconName
           & size
           & pixbuf
        )
    fun getDefault () = (I ---> GtkIconThemeClass.C.fromPtr false) getDefault_ ()
    fun getForScreen screen = (GdkScreenClass.C.withPtr ---> GtkIconThemeClass.C.fromPtr false) getForScreen_ screen
    fun appendSearchPath self path = (GtkIconThemeClass.C.withPtr &&&> Utf8.C.withPtr ---> I) appendSearchPath_ (self & path)
    fun getExampleIconName self = (GtkIconThemeClass.C.withPtr ---> Utf8.C.fromPtr true) getExampleIconName_ self
    fun hasIcon self iconName = (GtkIconThemeClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasIcon_ (self & iconName)
    fun loadIcon self iconName size flags =
      (
        GtkIconThemeClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GtkIconLookupFlags.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        loadIcon_
        (
          self
           & iconName
           & size
           & flags
           & []
        )
    fun lookupByGicon self icon size flags =
      (
        GtkIconThemeClass.C.withPtr
         &&&> GioIconClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GtkIconLookupFlags.C.withVal
         ---> GtkIconInfoRecord.C.fromPtr true
      )
        lookupByGicon_
        (
          self
           & icon
           & size
           & flags
        )
    fun lookupIcon self iconName size flags =
      (
        GtkIconThemeClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GtkIconLookupFlags.C.withVal
         ---> GtkIconInfoRecord.C.fromPtr true
      )
        lookupIcon_
        (
          self
           & iconName
           & size
           & flags
        )
    fun prependSearchPath self path = (GtkIconThemeClass.C.withPtr &&&> Utf8.C.withPtr ---> I) prependSearchPath_ (self & path)
    fun rescanIfNeeded self = (GtkIconThemeClass.C.withPtr ---> FFI.Bool.C.fromVal) rescanIfNeeded_ self
    fun setCustomTheme self themeName = (GtkIconThemeClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setCustomTheme_ (self & themeName)
    fun setScreen self screen = (GtkIconThemeClass.C.withPtr &&&> GdkScreenClass.C.withPtr ---> I) setScreen_ (self & screen)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
