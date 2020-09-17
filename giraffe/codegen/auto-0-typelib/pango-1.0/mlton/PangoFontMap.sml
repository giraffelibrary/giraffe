structure PangoFontMap :>
  PANGO_FONT_MAP
    where type 'a class = 'a PangoFontMapClass.class
    where type font_family_class_c_ptr_array_n_t = PangoFontFamilyClassCPtrArrayN.t
    where type 'a font_class = 'a PangoFontClass.class
    where type 'a fontset_class = 'a PangoFontsetClass.class
    where type language_t = PangoLanguageRecord.t
    where type font_description_t = PangoFontDescriptionRecord.t
    where type 'a context_class = 'a PangoContextClass.class =
  struct
    val getType_ = _import "pango_font_map_get_type" : unit -> GObjectType.FFI.val_;
    val changed_ = _import "pango_font_map_changed" : PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p -> unit;
    val createContext_ = _import "pango_font_map_create_context" : PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p -> PangoContextClass.FFI.non_opt PangoContextClass.FFI.p;
    val getSerial_ = _import "pango_font_map_get_serial" : PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p -> GUInt32.FFI.val_;
    val getShapeEngineType_ = _import "pango_font_map_get_shape_engine_type" : PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val listFamilies_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_font_map_list_families" :
              PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p
               * PangoFontFamilyClassCPtrArrayN.MLton.r1
               * (PangoFontFamilyClassCPtrArrayN.FFI.opt, PangoFontFamilyClassCPtrArrayN.FFI.non_opt) PangoFontFamilyClassCPtrArrayN.MLton.r2
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadFont_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_font_map_load_font" :
              PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p
               * PangoContextClass.FFI.non_opt PangoContextClass.FFI.p
               * PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p
               -> PangoFontClass.FFI.opt PangoFontClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val loadFontset_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_font_map_load_fontset" :
              PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p
               * PangoContextClass.FFI.non_opt PangoContextClass.FFI.p
               * PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p
               * PangoLanguageRecord.FFI.non_opt PangoLanguageRecord.FFI.p
               -> PangoFontsetClass.FFI.opt PangoFontsetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a PangoFontMapClass.class
    type font_family_class_c_ptr_array_n_t = PangoFontFamilyClassCPtrArrayN.t
    type 'a font_class = 'a PangoFontClass.class
    type 'a fontset_class = 'a PangoFontsetClass.class
    type language_t = PangoLanguageRecord.t
    type font_description_t = PangoFontDescriptionRecord.t
    type 'a context_class = 'a PangoContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun changed self = (PangoFontMapClass.FFI.withPtr false ---> I) changed_ self
    fun createContext self = (PangoFontMapClass.FFI.withPtr false ---> PangoContextClass.FFI.fromPtr true) createContext_ self
    fun getSerial self = (PangoFontMapClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getSerial_ self
    fun getShapeEngineType self = (PangoFontMapClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getShapeEngineType_ self before PangoFontMapClass.FFI.touchPtr self
    fun listFamilies self =
      let
        val families
         & nFamilies
         & () =
          (
            PangoFontMapClass.FFI.withPtr false
             &&&> PangoFontFamilyClassCPtrArrayN.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> PangoFontFamilyClassCPtrArrayN.FFI.fromPtr 1
                   && GInt32.FFI.fromVal
                   && I
          )
            listFamilies_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        families (LargeInt.toInt nFamilies) before PangoFontMapClass.FFI.touchPtr self
      end
    fun loadFont self (context, desc) =
      (
        PangoFontMapClass.FFI.withPtr false
         &&&> PangoContextClass.FFI.withPtr false
         &&&> PangoFontDescriptionRecord.FFI.withPtr false
         ---> PangoFontClass.FFI.fromOptPtr true
      )
        loadFont_
        (
          self
           & context
           & desc
        )
    fun loadFontset
      self
      (
        context,
        desc,
        language
      ) =
      (
        PangoFontMapClass.FFI.withPtr false
         &&&> PangoContextClass.FFI.withPtr false
         &&&> PangoFontDescriptionRecord.FFI.withPtr false
         &&&> PangoLanguageRecord.FFI.withPtr false
         ---> PangoFontsetClass.FFI.fromOptPtr true
      )
        loadFontset_
        (
          self
           & context
           & desc
           & language
        )
  end
