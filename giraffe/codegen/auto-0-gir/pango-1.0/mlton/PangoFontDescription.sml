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
    val getType_ = _import "pango_font_description_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_font_description_new" : unit -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val betterMatch_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_font_description_better_match" :
              PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               * unit PangoFontDescriptionRecord.FFI.p
               * PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ = _import "pango_font_description_copy" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val copyStatic_ = _import "pango_font_description_copy_static" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val equal_ = fn x1 & x2 => (_import "pango_font_description_equal" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getFamily_ = _import "pango_font_description_get_family" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getGravity_ = _import "pango_font_description_get_gravity" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> PangoGravity.FFI.val_;
    val getSetFields_ = _import "pango_font_description_get_set_fields" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> PangoFontMask.FFI.val_;
    val getSize_ = _import "pango_font_description_get_size" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> GInt.FFI.val_;
    val getSizeIsAbsolute_ = _import "pango_font_description_get_size_is_absolute" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> GBool.FFI.val_;
    val getStretch_ = _import "pango_font_description_get_stretch" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> PangoStretch.FFI.val_;
    val getStyle_ = _import "pango_font_description_get_style" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> PangoStyle.FFI.val_;
    val getVariant_ = _import "pango_font_description_get_variant" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> PangoVariant.FFI.val_;
    val getWeight_ = _import "pango_font_description_get_weight" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> PangoWeight.FFI.val_;
    val hash_ = _import "pango_font_description_hash" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> GUInt.FFI.val_;
    val merge_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_font_description_merge" :
              PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               * unit PangoFontDescriptionRecord.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val mergeStatic_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_font_description_merge_static" :
              PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               * PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAbsoluteSize_ = fn x1 & x2 => (_import "pango_font_description_set_absolute_size" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setFamily_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_pango_font_description_set_family" :
              PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFamilyStatic_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_pango_font_description_set_family_static" :
              PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setGravity_ = fn x1 & x2 => (_import "pango_font_description_set_gravity" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * PangoGravity.FFI.val_ -> unit;) (x1, x2)
    val setSize_ = fn x1 & x2 => (_import "pango_font_description_set_size" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setStretch_ = fn x1 & x2 => (_import "pango_font_description_set_stretch" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * PangoStretch.FFI.val_ -> unit;) (x1, x2)
    val setStyle_ = fn x1 & x2 => (_import "pango_font_description_set_style" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * PangoStyle.FFI.val_ -> unit;) (x1, x2)
    val setVariant_ = fn x1 & x2 => (_import "pango_font_description_set_variant" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * PangoVariant.FFI.val_ -> unit;) (x1, x2)
    val setWeight_ = fn x1 & x2 => (_import "pango_font_description_set_weight" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * PangoWeight.FFI.val_ -> unit;) (x1, x2)
    val toFilename_ = _import "pango_font_description_to_filename" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val toString_ = _import "pango_font_description_to_string" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val unsetFields_ = fn x1 & x2 => (_import "pango_font_description_unset_fields" : PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p * PangoFontMask.FFI.val_ -> unit;) (x1, x2)
    val fromString_ = _import "mlton_pango_font_description_from_string" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    type t = PangoFontDescriptionRecord.t
    type gravity_t = PangoGravity.t
    type stretch_t = PangoStretch.t
    type style_t = PangoStyle.t
    type variant_t = PangoVariant.t
    type weight_t = PangoWeight.t
    type font_mask_t = PangoFontMask.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoFontDescriptionRecord.FFI.fromPtr true) new_ ()
    fun betterMatch self oldMatch newMatch =
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
    fun getSize self = (PangoFontDescriptionRecord.FFI.withPtr ---> GInt.FFI.fromVal) getSize_ self
    fun getSizeIsAbsolute self = (PangoFontDescriptionRecord.FFI.withPtr ---> GBool.FFI.fromVal) getSizeIsAbsolute_ self
    fun getStretch self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoStretch.FFI.fromVal) getStretch_ self
    fun getStyle self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoStyle.FFI.fromVal) getStyle_ self
    fun getVariant self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoVariant.FFI.fromVal) getVariant_ self
    fun getWeight self = (PangoFontDescriptionRecord.FFI.withPtr ---> PangoWeight.FFI.fromVal) getWeight_ self
    fun hash self = (PangoFontDescriptionRecord.FFI.withPtr ---> GUInt.FFI.fromVal) hash_ self
    fun merge self descToMerge replaceExisting =
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
    fun mergeStatic self descToMerge replaceExisting =
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
    fun setSize self size = (PangoFontDescriptionRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSize_ (self & size)
    fun setStretch self stretch = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoStretch.FFI.withVal ---> I) setStretch_ (self & stretch)
    fun setStyle self style = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoStyle.FFI.withVal ---> I) setStyle_ (self & style)
    fun setVariant self variant = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoVariant.FFI.withVal ---> I) setVariant_ (self & variant)
    fun setWeight self weight = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoWeight.FFI.withVal ---> I) setWeight_ (self & weight)
    fun toFilename self = (PangoFontDescriptionRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toFilename_ self
    fun toString self = (PangoFontDescriptionRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    fun unsetFields self toUnset = (PangoFontDescriptionRecord.FFI.withPtr &&&> PangoFontMask.FFI.withVal ---> I) unsetFields_ (self & toUnset)
    fun fromString str = (Utf8.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) fromString_ str
  end
