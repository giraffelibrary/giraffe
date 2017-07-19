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
      val getType_ = call (getSymbol "pango_font_description_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_font_description_new") (cVoid --> PangoFontDescriptionRecord.PolyML.cPtr)
      val betterMatch_ =
        call (getSymbol "pango_font_description_better_match")
          (
            PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cOptPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val copy_ = call (getSymbol "pango_font_description_copy") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val copyStatic_ = call (getSymbol "pango_font_description_copy_static") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val equal_ = call (getSymbol "pango_font_description_equal") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFamily_ = call (getSymbol "pango_font_description_get_family") (PangoFontDescriptionRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getGravity_ = call (getSymbol "pango_font_description_get_gravity") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val getSetFields_ = call (getSymbol "pango_font_description_get_set_fields") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontMask.PolyML.cVal)
      val getSize_ = call (getSymbol "pango_font_description_get_size") (PangoFontDescriptionRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSizeIsAbsolute_ = call (getSymbol "pango_font_description_get_size_is_absolute") (PangoFontDescriptionRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getStretch_ = call (getSymbol "pango_font_description_get_stretch") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoStretch.PolyML.cVal)
      val getStyle_ = call (getSymbol "pango_font_description_get_style") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoStyle.PolyML.cVal)
      val getVariant_ = call (getSymbol "pango_font_description_get_variant") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoVariant.PolyML.cVal)
      val getWeight_ = call (getSymbol "pango_font_description_get_weight") (PangoFontDescriptionRecord.PolyML.cPtr --> PangoWeight.PolyML.cVal)
      val hash_ = call (getSymbol "pango_font_description_hash") (PangoFontDescriptionRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val merge_ =
        call (getSymbol "pango_font_description_merge")
          (
            PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val mergeStatic_ =
        call (getSymbol "pango_font_description_merge_static")
          (
            PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setAbsoluteSize_ = call (getSymbol "pango_font_description_set_absolute_size") (PangoFontDescriptionRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setFamily_ = call (getSymbol "pango_font_description_set_family") (PangoFontDescriptionRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setFamilyStatic_ = call (getSymbol "pango_font_description_set_family_static") (PangoFontDescriptionRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setGravity_ = call (getSymbol "pango_font_description_set_gravity") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoGravity.PolyML.cVal --> cVoid)
      val setSize_ = call (getSymbol "pango_font_description_set_size") (PangoFontDescriptionRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setStretch_ = call (getSymbol "pango_font_description_set_stretch") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoStretch.PolyML.cVal --> cVoid)
      val setStyle_ = call (getSymbol "pango_font_description_set_style") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoStyle.PolyML.cVal --> cVoid)
      val setVariant_ = call (getSymbol "pango_font_description_set_variant") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoVariant.PolyML.cVal --> cVoid)
      val setWeight_ = call (getSymbol "pango_font_description_set_weight") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoWeight.PolyML.cVal --> cVoid)
      val toFilename_ = call (getSymbol "pango_font_description_to_filename") (PangoFontDescriptionRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val toString_ = call (getSymbol "pango_font_description_to_string") (PangoFontDescriptionRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unsetFields_ = call (getSymbol "pango_font_description_unset_fields") (PangoFontDescriptionRecord.PolyML.cPtr &&> PangoFontMask.PolyML.cVal --> cVoid)
      val fromString_ = call (getSymbol "pango_font_description_from_string") (Utf8.PolyML.cInPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
    end
    type t = PangoFontDescriptionRecord.t
    type gravity_t = PangoGravity.t
    type stretch_t = PangoStretch.t
    type style_t = PangoStyle.t
    type variant_t = PangoVariant.t
    type weight_t = PangoWeight.t
    type font_mask_t = PangoFontMask.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoFontDescriptionRecord.FFI.fromPtr true) new_ ()
    fun betterMatch self (oldMatch, newMatch) =
      (
        PangoFontDescriptionRecord.FFI.withPtr
         &&&> PangoFontDescriptionRecord.FFI.withOptPtr
         &&&> PangoFontDescriptionRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        betterMatch_
        (
          self
           & oldMatch
           & newMatch
        )
    fun copy self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) copy_ self
    fun copyStatic self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) copyStatic_ self
    fun equal self desc2 = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoFontDescriptionRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & desc2)
    fun getFamily self = (PangoFontDescriptionRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFamily_ self
    fun getGravity self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoGravity.FFI.fromVal) getGravity_ self
    fun getSetFields self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoFontMask.FFI.fromVal) getSetFields_ self
    fun getSize self = (PangoFontDescriptionRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getSize_ self
    fun getSizeIsAbsolute self = (PangoFontDescriptionRecord.FFI.withPtr ---> GBool.FFI.fromVal) getSizeIsAbsolute_ self
    fun getStretch self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoStretch.FFI.fromVal) getStretch_ self
    fun getStyle self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoStyle.FFI.fromVal) getStyle_ self
    fun getVariant self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoVariant.FFI.fromVal) getVariant_ self
    fun getWeight self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoWeight.FFI.fromVal) getWeight_ self
    fun hash self = (PangoFontDescriptionRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    fun merge self (descToMerge, replaceExisting) =
      (
        PangoFontDescriptionRecord.FFI.withPtr
         &&&> PangoFontDescriptionRecord.FFI.withOptPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        merge_
        (
          self
           & descToMerge
           & replaceExisting
        )
    fun mergeStatic self (descToMerge, replaceExisting) =
      (
        PangoFontDescriptionRecord.FFI.withPtr
         &&&> PangoFontDescriptionRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        mergeStatic_
        (
          self
           & descToMerge
           & replaceExisting
        )
    fun setAbsoluteSize self size = (PangoFontDescriptionRecord.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setAbsoluteSize_ (self & size)
    fun setFamily self family = (PangoFontDescriptionRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFamily_ (self & family)
    fun setFamilyStatic self family = (PangoFontDescriptionRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFamilyStatic_ (self & family)
    fun setGravity self gravity = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoGravity.FFI.withVal ---> I) setGravity_ (self & gravity)
    fun setSize self size = (PangoFontDescriptionRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSize_ (self & size)
    fun setStretch self stretch = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoStretch.FFI.withVal ---> I) setStretch_ (self & stretch)
    fun setStyle self style = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoStyle.FFI.withVal ---> I) setStyle_ (self & style)
    fun setVariant self variant = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoVariant.FFI.withVal ---> I) setVariant_ (self & variant)
    fun setWeight self weight = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoWeight.FFI.withVal ---> I) setWeight_ (self & weight)
    fun toFilename self = (PangoFontDescriptionRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toFilename_ self
    fun toString self = (PangoFontDescriptionRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    fun unsetFields self toUnset = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoFontMask.FFI.withVal ---> I) unsetFields_ (self & toUnset)
    fun fromString str = (Utf8.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) fromString_ str
  end
