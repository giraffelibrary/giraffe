structure GtkIconTheme :>
  GTK_ICON_THEME
    where type 'a class_t = 'a GtkIconThemeClass.t
    where type iconinforecord_t = GtkIconInfoRecord.t
    where type iconlookupflags_t = GtkIconLookupFlags.t =
  struct
    val getType_ = _import "gtk_icon_theme_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_icon_theme_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addBuiltinIcon_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_icon_theme_add_builtin_icon" :
              cstring
               * unit CPointer.t
               * FFI.Int32.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDefault_ = _import "gtk_icon_theme_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getForScreen_ = _import "gtk_icon_theme_get_for_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val appendSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_append_search_path" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getExampleIconName_ = _import "gtk_icon_theme_get_example_icon_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val hasIcon_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_has_icon" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
               * GtkIconLookupFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rescanIfNeeded_ = _import "gtk_icon_theme_rescan_if_needed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val setCustomTheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_set_custom_theme" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gtk_icon_theme_set_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkIconThemeClass.t
    type iconinforecord_t = GtkIconInfoRecord.t
    type iconlookupflags_t = GtkIconLookupFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconThemeClass.C.fromPtr true) new_ ()
    fun addBuiltinIcon iconName size pixbuf =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        addBuiltinIcon_
        (
          iconName
           & size
           & pixbuf
        )
    fun getDefault () = (I ---> GtkIconThemeClass.C.fromPtr false) getDefault_ ()
    fun getForScreen screen = (GObjectObjectClass.C.withPtr ---> GtkIconThemeClass.C.fromPtr false) getForScreen_ screen
    fun appendSearchPath self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) appendSearchPath_ (self & path)
    fun getExampleIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getExampleIconName_ self
    fun hasIcon self iconName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) hasIcon_ (self & iconName)
    fun loadIcon self iconName size flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> GtkIconLookupFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
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
    fun prependSearchPath self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) prependSearchPath_ (self & path)
    fun rescanIfNeeded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) rescanIfNeeded_ self
    fun setCustomTheme self themeName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setCustomTheme_ (self & themeName)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
