structure PangoFontDescription :>
  PANGO_FONT_DESCRIPTION
    where type t = PangoFontDescriptionRecord.t
    where type gravity_t = PangoGravity.t
    where type stretch_t = PangoStretch.t
    where type style_t = PangoStyle.t
    where type variant_t = PangoVariant.t
    where type weight_t = PangoWeight.t
    where type font_mask_t = PangoFontMask.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_description_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libpango "pango_font_description_new") (FFI.PolyML.cVoid --> PangoFontDescriptionRecord.PolyML.cPtr)
      val betterMatch_ =
        call (load_sym libpango "pango_font_description_better_match")
          (
            PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cOptPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val copy_ = call (load_sym libpango "pango_font_description_copy") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val copyStatic_ = call (load_sym libpango "pango_font_description_copy_static") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val equal_ = call (load_sym libpango "pango_font_description_equal") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFamily_ = call (load_sym libpango "pango_font_description_get_family") (PangoFontDescriptionRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getGravity_ = call (load_sym libpango "pango_font_description_get_gravity") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val getSetFields_ = call (load_sym libpango "pango_font_description_get_set_fields") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontMask.PolyML.cVal)
      val getSize_ = call (load_sym libpango "pango_font_description_get_size") (PangoFontDescriptionRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getSizeIsAbsolute_ = call (load_sym libpango "pango_font_description_get_size_is_absolute") (PangoFontDescriptionRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getStretch_ = call (load_sym libpango "pango_font_description_get_stretch") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoStretch.PolyML.cVal)
      val getStyle_ = call (load_sym libpango "pango_font_description_get_style") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoStyle.PolyML.cVal)
      val getVariant_ = call (load_sym libpango "pango_font_description_get_variant") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoVariant.PolyML.cVal)
      val getWeight_ = call (load_sym libpango "pango_font_description_get_weight") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoWeight.PolyML.cVal)
      val hash_ = call (load_sym libpango "pango_font_description_hash") (PangoFontDescriptionRecord.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val merge_ =
        call (load_sym libpango "pango_font_description_merge")
          (
            PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cOptPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val mergeStatic_ =
        call (load_sym libpango "pango_font_description_merge_static")
          (
            PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setAbsoluteSize_ = call (load_sym libpango "pango_font_description_set_absolute_size") (PangoFontDescriptionRecord.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFamily_ = call (load_sym libpango "pango_font_description_set_family") (PangoFontDescriptionRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setFamilyStatic_ = call (load_sym libpango "pango_font_description_set_family_static") (PangoFontDescriptionRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setGravity_ = call (load_sym libpango "pango_font_description_set_gravity") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoGravity.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSize_ = call (load_sym libpango "pango_font_description_set_size") (PangoFontDescriptionRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setStretch_ = call (load_sym libpango "pango_font_description_set_stretch") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoStretch.PolyML.cVal --> FFI.PolyML.cVoid)
      val setStyle_ = call (load_sym libpango "pango_font_description_set_style") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoStyle.PolyML.cVal --> FFI.PolyML.cVoid)
      val setVariant_ = call (load_sym libpango "pango_font_description_set_variant") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoVariant.PolyML.cVal --> FFI.PolyML.cVoid)
      val setWeight_ = call (load_sym libpango "pango_font_description_set_weight") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoWeight.PolyML.cVal --> FFI.PolyML.cVoid)
      val toFilename_ = call (load_sym libpango "pango_font_description_to_filename") (PangoFontDescriptionRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val toString_ = call (load_sym libpango "pango_font_description_to_string") (PangoFontDescriptionRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unsetFields_ = call (load_sym libpango "pango_font_description_unset_fields") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoFontMask.PolyML.cVal --> FFI.PolyML.cVoid)
      val fromString_ = call (load_sym libpango "pango_font_description_from_string") (Utf8.PolyML.cInPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
    end
    type t = PangoFontDescriptionRecord.t
    type gravity_t = PangoGravity.t
    type stretch_t = PangoStretch.t
    type style_t = PangoStyle.t
    type variant_t = PangoVariant.t
    type weight_t = PangoWeight.t
    type font_mask_t = PangoFontMask.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> PangoFontDescriptionRecord.C.fromPtr true) new_ ()
    fun betterMatch self oldMatch newMatch =
      (
        PangoFontDescriptionRecord.C.withPtr
         &&&> PangoFontDescriptionRecord.C.withOptPtr
         &&&> PangoFontDescriptionRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        betterMatch_
        (
          self
           & oldMatch
           & newMatch
        )
    fun copy self = (PangoFontDescriptionRecord.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) copy_ self
    fun copyStatic self = (PangoFontDescriptionRecord.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) copyStatic_ self
    fun equal self desc2 = (PangoFontDescriptionRecord.C.withPtr &&&> PangoFontDescriptionRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & desc2)
    fun getFamily self = (PangoFontDescriptionRecord.C.withPtr ---> Utf8.C.fromPtr false) getFamily_ self
    fun getGravity self = (PangoFontDescriptionRecord.C.withPtr ---> PangoGravity.C.fromVal) getGravity_ self
    fun getSetFields self = (PangoFontDescriptionRecord.C.withPtr ---> PangoFontMask.C.fromVal) getSetFields_ self
    fun getSize self = (PangoFontDescriptionRecord.C.withPtr ---> FFI.Int.C.fromVal) getSize_ self
    fun getSizeIsAbsolute self = (PangoFontDescriptionRecord.C.withPtr ---> FFI.Bool.C.fromVal) getSizeIsAbsolute_ self
    fun getStretch self = (PangoFontDescriptionRecord.C.withPtr ---> PangoStretch.C.fromVal) getStretch_ self
    fun getStyle self = (PangoFontDescriptionRecord.C.withPtr ---> PangoStyle.C.fromVal) getStyle_ self
    fun getVariant self = (PangoFontDescriptionRecord.C.withPtr ---> PangoVariant.C.fromVal) getVariant_ self
    fun getWeight self = (PangoFontDescriptionRecord.C.withPtr ---> PangoWeight.C.fromVal) getWeight_ self
    fun hash self = (PangoFontDescriptionRecord.C.withPtr ---> FFI.UInt.C.fromVal) hash_ self
    fun merge self descToMerge replaceExisting =
      (
        PangoFontDescriptionRecord.C.withPtr
         &&&> PangoFontDescriptionRecord.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        merge_
        (
          self
           & descToMerge
           & replaceExisting
        )
    fun mergeStatic self descToMerge replaceExisting =
      (
        PangoFontDescriptionRecord.C.withPtr
         &&&> PangoFontDescriptionRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        mergeStatic_
        (
          self
           & descToMerge
           & replaceExisting
        )
    fun setAbsoluteSize self size = (PangoFontDescriptionRecord.C.withPtr &&&> FFI.Double.C.withVal ---> I) setAbsoluteSize_ (self & size)
    fun setFamily self family = (PangoFontDescriptionRecord.C.withPtr &&&> Utf8.C.withPtr ---> I) setFamily_ (self & family)
    fun setFamilyStatic self family = (PangoFontDescriptionRecord.C.withPtr &&&> Utf8.C.withPtr ---> I) setFamilyStatic_ (self & family)
    fun setGravity self gravity = (PangoFontDescriptionRecord.C.withPtr &&&> PangoGravity.C.withVal ---> I) setGravity_ (self & gravity)
    fun setSize self size = (PangoFontDescriptionRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSize_ (self & size)
    fun setStretch self stretch = (PangoFontDescriptionRecord.C.withPtr &&&> PangoStretch.C.withVal ---> I) setStretch_ (self & stretch)
    fun setStyle self style = (PangoFontDescriptionRecord.C.withPtr &&&> PangoStyle.C.withVal ---> I) setStyle_ (self & style)
    fun setVariant self variant = (PangoFontDescriptionRecord.C.withPtr &&&> PangoVariant.C.withVal ---> I) setVariant_ (self & variant)
    fun setWeight self weight = (PangoFontDescriptionRecord.C.withPtr &&&> PangoWeight.C.withVal ---> I) setWeight_ (self & weight)
    fun toFilename self = (PangoFontDescriptionRecord.C.withPtr ---> Utf8.C.fromPtr true) toFilename_ self
    fun toString self = (PangoFontDescriptionRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
    fun unsetFields self toUnset = (PangoFontDescriptionRecord.C.withPtr &&&> PangoFontMask.C.withVal ---> I) unsetFields_ (self & toUnset)
    fun fromString str = (Utf8.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) fromString_ str
  end
