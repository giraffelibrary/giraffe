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
    val getType_ = _import "gtk_icon_theme_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_icon_theme_new" : unit -> GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p;
    val addBuiltinIcon_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_icon_theme_add_builtin_icon" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDefault_ = _import "gtk_icon_theme_get_default" : unit -> GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p;
    val getForScreen_ = _import "gtk_icon_theme_get_for_screen" : GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p;
    val addResourcePath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_add_resource_path" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val appendSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_append_search_path" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val chooseIcon_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_icon_theme_choose_icon" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * GInt.FFI.val_
               * GtkIconLookupFlags.FFI.val_
               -> unit GtkIconInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val chooseIconForScale_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_gtk_icon_theme_choose_icon_for_scale" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GtkIconLookupFlags.FFI.val_
               -> unit GtkIconInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getExampleIconName_ = _import "gtk_icon_theme_get_example_icon_name" : GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p -> unit Utf8.FFI.out_p;
    val getIconSizes_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_get_icon_sizes" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GIntCVector.FFI.notnull GIntCVector.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getSearchPath_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_theme_get_search_path" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8CVectorN.MLton.r1
               * (unit, Utf8CVectorN.FFI.notnull) Utf8CVectorN.MLton.r2
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val hasIcon_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_has_icon" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GtkIconLookupFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> unit GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val loadIconForScale_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_gtk_icon_theme_load_icon_for_scale" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GtkIconLookupFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> unit GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val loadSurface_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_gtk_icon_theme_load_surface" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               * unit GdkWindowClass.FFI.p
               * GtkIconLookupFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> unit CairoSurfaceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val lookupByGicon_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_theme_lookup_by_gicon" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * GioIconClass.FFI.notnull GioIconClass.FFI.p
               * GInt.FFI.val_
               * GtkIconLookupFlags.FFI.val_
               -> unit GtkIconInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val lookupByGiconForScale_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_icon_theme_lookup_by_gicon_for_scale" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * GioIconClass.FFI.notnull GioIconClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GtkIconLookupFlags.FFI.val_
               -> unit GtkIconInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val lookupIcon_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_icon_theme_lookup_icon" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GtkIconLookupFlags.FFI.val_
               -> unit GtkIconInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val lookupIconForScale_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_gtk_icon_theme_lookup_icon_for_scale" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GtkIconLookupFlags.FFI.val_
               -> unit GtkIconInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val prependSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_prepend_search_path" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rescanIfNeeded_ = _import "gtk_icon_theme_rescan_if_needed" : GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p -> GBool.FFI.val_;
    val setCustomTheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_icon_theme_set_custom_theme" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gtk_icon_theme_set_screen" : GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p * GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p -> unit;) (x1, x2)
    val setSearchPath_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_theme_set_search_path" :
              GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
