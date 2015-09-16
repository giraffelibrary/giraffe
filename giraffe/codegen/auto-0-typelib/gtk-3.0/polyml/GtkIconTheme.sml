structure GtkIconTheme :>
  GTK_ICON_THEME
    where type 'a class_t = 'a GtkIconThemeClass.t
    where type icon_info_record_t = GtkIconInfoRecord.t
    where type icon_lookup_flags_t = GtkIconLookupFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_theme_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_icon_theme_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addBuiltinIcon_ =
        call (load_sym libgtk "gtk_icon_theme_add_builtin_icon")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getDefault_ = call (load_sym libgtk "gtk_icon_theme_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getForScreen_ = call (load_sym libgtk "gtk_icon_theme_get_for_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val appendSearchPath_ = call (load_sym libgtk "gtk_icon_theme_append_search_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val getExampleIconName_ = call (load_sym libgtk "gtk_icon_theme_get_example_icon_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val hasIcon_ = call (load_sym libgtk "gtk_icon_theme_has_icon") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val loadIcon_ =
        call (load_sym libgtk "gtk_icon_theme_load_icon")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> GtkIconLookupFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val lookupByGicon_ =
        call (load_sym libgtk "gtk_icon_theme_lookup_by_gicon")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GtkIconLookupFlags.PolyML.VAL
             --> GtkIconInfoRecord.PolyML.PTR
          )
      val lookupIcon_ =
        call (load_sym libgtk "gtk_icon_theme_lookup_icon")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> GtkIconLookupFlags.PolyML.VAL
             --> GtkIconInfoRecord.PolyML.PTR
          )
      val prependSearchPath_ = call (load_sym libgtk "gtk_icon_theme_prepend_search_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val rescanIfNeeded_ = call (load_sym libgtk "gtk_icon_theme_rescan_if_needed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setCustomTheme_ = call (load_sym libgtk "gtk_icon_theme_set_custom_theme") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setScreen_ = call (load_sym libgtk "gtk_icon_theme_set_screen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkIconThemeClass.t
    type icon_info_record_t = GtkIconInfoRecord.t
    type icon_lookup_flags_t = GtkIconLookupFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkIconThemeClass.C.fromPtr true) new_ ()
    fun addBuiltinIcon iconName size pixbuf =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
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
    fun appendSearchPath self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) appendSearchPath_ (self & path)
    fun getExampleIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getExampleIconName_ self
    fun hasIcon self iconName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasIcon_ (self & iconName)
    fun loadIcon self iconName size flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
    fun prependSearchPath self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) prependSearchPath_ (self & path)
    fun rescanIfNeeded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) rescanIfNeeded_ self
    fun setCustomTheme self themeName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setCustomTheme_ (self & themeName)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
