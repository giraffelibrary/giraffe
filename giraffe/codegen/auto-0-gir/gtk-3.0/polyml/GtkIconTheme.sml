structure GtkIconTheme :>
  GTK_ICON_THEME
    where type 'a class_t = 'a GtkIconThemeClass.t
    where type icon_info_record_t = GtkIconInfoRecord.t
    where type icon_lookup_flags_t = GtkIconLookupFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_theme_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_icon_theme_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addBuiltinIcon_ =
        call (load_sym libgtk "gtk_icon_theme_add_builtin_icon")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getDefault_ = call (load_sym libgtk "gtk_icon_theme_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getForScreen_ = call (load_sym libgtk "gtk_icon_theme_get_for_screen") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val appendSearchPath_ = call (load_sym libgtk "gtk_icon_theme_append_search_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val getExampleIconName_ = call (load_sym libgtk "gtk_icon_theme_get_example_icon_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasIcon_ = call (load_sym libgtk "gtk_icon_theme_has_icon") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val loadIcon_ =
        call (load_sym libgtk "gtk_icon_theme_load_icon")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val lookupByGicon_ =
        call (load_sym libgtk "gtk_icon_theme_lookup_by_gicon")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoRecord.PolyML.cPtr
          )
      val lookupIcon_ =
        call (load_sym libgtk "gtk_icon_theme_lookup_icon")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoRecord.PolyML.cPtr
          )
      val prependSearchPath_ = call (load_sym libgtk "gtk_icon_theme_prepend_search_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val rescanIfNeeded_ = call (load_sym libgtk "gtk_icon_theme_rescan_if_needed") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setCustomTheme_ = call (load_sym libgtk "gtk_icon_theme_set_custom_theme") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setScreen_ = call (load_sym libgtk "gtk_icon_theme_set_screen") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkIconThemeClass.t
    type icon_info_record_t = GtkIconInfoRecord.t
    type icon_lookup_flags_t = GtkIconLookupFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconThemeClass.C.fromPtr true) new_ ()
    fun addBuiltinIcon iconName size pixbuf =
      (
        Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
    fun appendSearchPath self path = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) appendSearchPath_ (self & path)
    fun getExampleIconName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getExampleIconName_ self
    fun hasIcon self iconName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasIcon_ (self & iconName)
    fun loadIcon self iconName size flags =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun prependSearchPath self path = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) prependSearchPath_ (self & path)
    fun rescanIfNeeded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) rescanIfNeeded_ self
    fun setCustomTheme self themeName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setCustomTheme_ (self & themeName)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
