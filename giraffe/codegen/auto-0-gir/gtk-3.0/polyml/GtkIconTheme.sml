structure GtkIconTheme :>
  GTK_ICON_THEME
    where type 'a class = 'a GtkIconThemeClass.class
    where type icon_info_t = GtkIconInfoRecord.t
    where type icon_lookup_flags_t = GtkIconLookupFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_theme_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_icon_theme_new") (FFI.PolyML.cVoid --> GtkIconThemeClass.PolyML.cPtr)
      val addBuiltinIcon_ =
        call (load_sym libgtk "gtk_icon_theme_add_builtin_icon")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getDefault_ = call (load_sym libgtk "gtk_icon_theme_get_default") (FFI.PolyML.cVoid --> GtkIconThemeClass.PolyML.cPtr)
      val getForScreen_ = call (load_sym libgtk "gtk_icon_theme_get_for_screen") (GdkScreenClass.PolyML.cPtr --> GtkIconThemeClass.PolyML.cPtr)
      val appendSearchPath_ = call (load_sym libgtk "gtk_icon_theme_append_search_path") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val getExampleIconName_ = call (load_sym libgtk "gtk_icon_theme_get_example_icon_name") (GtkIconThemeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasIcon_ = call (load_sym libgtk "gtk_icon_theme_has_icon") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val loadIcon_ =
        call (load_sym libgtk "gtk_icon_theme_load_icon")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val lookupByGicon_ =
        call (load_sym libgtk "gtk_icon_theme_lookup_by_gicon")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoRecord.PolyML.cPtr
          )
      val lookupIcon_ =
        call (load_sym libgtk "gtk_icon_theme_lookup_icon")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoRecord.PolyML.cPtr
          )
      val prependSearchPath_ = call (load_sym libgtk "gtk_icon_theme_prepend_search_path") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val rescanIfNeeded_ = call (load_sym libgtk "gtk_icon_theme_rescan_if_needed") (GtkIconThemeClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setCustomTheme_ = call (load_sym libgtk "gtk_icon_theme_set_custom_theme") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setScreen_ = call (load_sym libgtk "gtk_icon_theme_set_screen") (GtkIconThemeClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkIconThemeClass.class
    type icon_info_t = GtkIconInfoRecord.t
    type icon_lookup_flags_t = GtkIconLookupFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconThemeClass.C.fromPtr true) new_ ()
    fun addBuiltinIcon iconName size pixbuf =
      (
        Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
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
