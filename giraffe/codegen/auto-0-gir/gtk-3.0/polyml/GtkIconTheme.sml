structure GtkIconTheme :>
  GTK_ICON_THEME
    where type 'a class = 'a GtkIconThemeClass.class
    where type 'a icon_info_class = 'a GtkIconInfoClass.class
    where type icon_lookup_flags_t = GtkIconLookupFlags.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure GIntCVectorType =
      CValueCVectorType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVector = CVector(GIntCVectorType)
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_theme_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_icon_theme_new") (cVoid --> GtkIconThemeClass.PolyML.cPtr)
      val addBuiltinIcon_ =
        call (getSymbol "gtk_icon_theme_add_builtin_icon")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             --> cVoid
          )
      val getDefault_ = call (getSymbol "gtk_icon_theme_get_default") (cVoid --> GtkIconThemeClass.PolyML.cPtr)
      val getForScreen_ = call (getSymbol "gtk_icon_theme_get_for_screen") (GdkScreenClass.PolyML.cPtr --> GtkIconThemeClass.PolyML.cPtr)
      val addResourcePath_ = call (getSymbol "gtk_icon_theme_add_resource_path") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val appendSearchPath_ = call (getSymbol "gtk_icon_theme_append_search_path") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val chooseIcon_ =
        call (getSymbol "gtk_icon_theme_choose_icon")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoClass.PolyML.cOptPtr
          )
      val chooseIconForScale_ =
        call (getSymbol "gtk_icon_theme_choose_icon_for_scale")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoClass.PolyML.cOptPtr
          )
      val getExampleIconName_ = call (getSymbol "gtk_icon_theme_get_example_icon_name") (GtkIconThemeClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getIconSizes_ = call (getSymbol "gtk_icon_theme_get_icon_sizes") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIntCVector.PolyML.cOutPtr)
      val getSearchPath_ =
        call (getSymbol "gtk_icon_theme_get_search_path")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8CVectorN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val hasIcon_ = call (getSymbol "gtk_icon_theme_has_icon") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val loadIcon_ =
        call (getSymbol "gtk_icon_theme_load_icon")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cOptPtr
          )
      val loadIconForScale_ =
        call (getSymbol "gtk_icon_theme_load_icon_for_scale")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cOptPtr
          )
      val loadSurface_ =
        call (getSymbol "gtk_icon_theme_load_surface")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GdkWindowClass.PolyML.cOptPtr
             &&> GtkIconLookupFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> CairoSurfaceRecord.PolyML.cOptPtr
          )
      val lookupByGicon_ =
        call (getSymbol "gtk_icon_theme_lookup_by_gicon")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoClass.PolyML.cOptPtr
          )
      val lookupByGiconForScale_ =
        call (getSymbol "gtk_icon_theme_lookup_by_gicon_for_scale")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoClass.PolyML.cOptPtr
          )
      val lookupIcon_ =
        call (getSymbol "gtk_icon_theme_lookup_icon")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoClass.PolyML.cOptPtr
          )
      val lookupIconForScale_ =
        call (getSymbol "gtk_icon_theme_lookup_icon_for_scale")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkIconLookupFlags.PolyML.cVal
             --> GtkIconInfoClass.PolyML.cOptPtr
          )
      val prependSearchPath_ = call (getSymbol "gtk_icon_theme_prepend_search_path") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val rescanIfNeeded_ = call (getSymbol "gtk_icon_theme_rescan_if_needed") (GtkIconThemeClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setCustomTheme_ = call (getSymbol "gtk_icon_theme_set_custom_theme") (GtkIconThemeClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setScreen_ = call (getSymbol "gtk_icon_theme_set_screen") (GtkIconThemeClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> cVoid)
      val setSearchPath_ =
        call (getSymbol "gtk_icon_theme_set_search_path")
          (
            GtkIconThemeClass.PolyML.cPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkIconThemeClass.class
    type 'a icon_info_class = 'a GtkIconInfoClass.class
    type icon_lookup_flags_t = GtkIconLookupFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconThemeClass.FFI.fromPtr true) new_ ()
    fun addBuiltinIcon
      (
        iconName,
        size,
        pixbuf
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         ---> I
      )
        addBuiltinIcon_
        (
          iconName
           & size
           & pixbuf
        )
    fun getDefault () = (I ---> GtkIconThemeClass.FFI.fromPtr false) getDefault_ ()
    fun getForScreen screen = (GdkScreenClass.FFI.withPtr ---> GtkIconThemeClass.FFI.fromPtr false) getForScreen_ screen
    fun addResourcePath self path = (GtkIconThemeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addResourcePath_ (self & path)
    fun appendSearchPath self path = (GtkIconThemeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) appendSearchPath_ (self & path)
    fun chooseIcon
      self
      (
        iconNames,
        size,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> Utf8CVector.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GtkIconLookupFlags.FFI.withVal
         ---> GtkIconInfoClass.FFI.fromOptPtr true
      )
        chooseIcon_
        (
          self
           & iconNames
           & size
           & flags
        )
    fun chooseIconForScale
      self
      (
        iconNames,
        size,
        scale,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> Utf8CVector.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GtkIconLookupFlags.FFI.withVal
         ---> GtkIconInfoClass.FFI.fromOptPtr true
      )
        chooseIconForScale_
        (
          self
           & iconNames
           & size
           & scale
           & flags
        )
    fun getExampleIconName self = (GtkIconThemeClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getExampleIconName_ self
    fun getIconSizes self iconName = (GtkIconThemeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIntCVector.FFI.fromPtr 1) getIconSizes_ (self & iconName)
    fun getSearchPath self =
      let
        val path
         & nElements
         & () =
          (
            GtkIconThemeClass.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> Utf8CVectorN.FFI.fromPtr 2
                   && GInt.FFI.fromVal
                   && I
          )
            getSearchPath_
            (
              self
               & NONE
               & GInt.null
            )
      in
        path (LargeInt.toInt nElements)
      end
    fun hasIcon self iconName = (GtkIconThemeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasIcon_ (self & iconName)
    fun loadIcon
      self
      (
        iconName,
        size,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GtkIconLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromOptPtr true
      )
        loadIcon_
        (
          self
           & iconName
           & size
           & flags
           & []
        )
    fun loadIconForScale
      self
      (
        iconName,
        size,
        scale,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GtkIconLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromOptPtr true
      )
        loadIconForScale_
        (
          self
           & iconName
           & size
           & scale
           & flags
           & []
        )
    fun loadSurface
      self
      (
        iconName,
        size,
        scale,
        forWindow,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkWindowClass.FFI.withOptPtr
         &&&> GtkIconLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> CairoSurfaceRecord.FFI.fromOptPtr true
      )
        loadSurface_
        (
          self
           & iconName
           & size
           & scale
           & forWindow
           & flags
           & []
        )
    fun lookupByGicon
      self
      (
        icon,
        size,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> GioIconClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GtkIconLookupFlags.FFI.withVal
         ---> GtkIconInfoClass.FFI.fromOptPtr true
      )
        lookupByGicon_
        (
          self
           & icon
           & size
           & flags
        )
    fun lookupByGiconForScale
      self
      (
        icon,
        size,
        scale,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> GioIconClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GtkIconLookupFlags.FFI.withVal
         ---> GtkIconInfoClass.FFI.fromOptPtr true
      )
        lookupByGiconForScale_
        (
          self
           & icon
           & size
           & scale
           & flags
        )
    fun lookupIcon
      self
      (
        iconName,
        size,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GtkIconLookupFlags.FFI.withVal
         ---> GtkIconInfoClass.FFI.fromOptPtr true
      )
        lookupIcon_
        (
          self
           & iconName
           & size
           & flags
        )
    fun lookupIconForScale
      self
      (
        iconName,
        size,
        scale,
        flags
      ) =
      (
        GtkIconThemeClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GtkIconLookupFlags.FFI.withVal
         ---> GtkIconInfoClass.FFI.fromOptPtr true
      )
        lookupIconForScale_
        (
          self
           & iconName
           & size
           & scale
           & flags
        )
    fun prependSearchPath self path = (GtkIconThemeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) prependSearchPath_ (self & path)
    fun rescanIfNeeded self = (GtkIconThemeClass.FFI.withPtr ---> GBool.FFI.fromVal) rescanIfNeeded_ self
    fun setCustomTheme self themeName = (GtkIconThemeClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setCustomTheme_ (self & themeName)
    fun setScreen self screen = (GtkIconThemeClass.FFI.withPtr &&&> GdkScreenClass.FFI.withPtr ---> I) setScreen_ (self & screen)
    fun setSearchPath self path =
      let
        val nElements = LargeInt.fromInt (Utf8CVectorN.length path)
        val () =
          (
            GtkIconThemeClass.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
             ---> I
          )
            setSearchPath_
            (
              self
               & path
               & nElements
            )
      in
        ()
      end
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
