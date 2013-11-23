structure PangoFontDescription :>
  PANGO_FONT_DESCRIPTION
    where type record_t = PangoFontDescriptionRecord.t
    where type gravity_t = PangoGravity.t
    where type stretch_t = PangoStretch.t
    where type style_t = PangoStyle.t
    where type variant_t = PangoVariant.t
    where type weight_t = PangoWeight.t
    where type fontmask_t = PangoFontMask.t =
  struct
    val getType_ = _import "pango_font_description_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "pango_font_description_new" : unit -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val betterMatch_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_font_description_better_match" :
              PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               * unit PangoFontDescriptionRecord.C.p
               * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ = _import "pango_font_description_copy" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val copyStatic_ = _import "pango_font_description_copy_static" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val equal_ = fn x1 & x2 => (_import "pango_font_description_equal" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getFamily_ = _import "pango_font_description_get_family" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getGravity_ = _import "pango_font_description_get_gravity" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> PangoGravity.C.val_;
    val getSetFields_ = _import "pango_font_description_get_set_fields" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> PangoFontMask.C.val_;
    val getSize_ = _import "pango_font_description_get_size" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> FFI.Int.C.val_;
    val getSizeIsAbsolute_ = _import "pango_font_description_get_size_is_absolute" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> FFI.Bool.C.val_;
    val getStretch_ = _import "pango_font_description_get_stretch" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> PangoStretch.C.val_;
    val getStyle_ = _import "pango_font_description_get_style" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> PangoStyle.C.val_;
    val getVariant_ = _import "pango_font_description_get_variant" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> PangoVariant.C.val_;
    val getWeight_ = _import "pango_font_description_get_weight" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> PangoWeight.C.val_;
    val hash_ = _import "pango_font_description_hash" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> FFI.UInt.C.val_;
    val merge_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_font_description_merge" :
              PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               * unit PangoFontDescriptionRecord.C.p
               * FFI.Bool.C.val_
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
              PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAbsoluteSize_ = fn x1 & x2 => (_import "pango_font_description_set_absolute_size" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setFamily_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_pango_font_description_set_family" :
              PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               * cstring
               * unit CPointer.t
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
              PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setGravity_ = fn x1 & x2 => (_import "pango_font_description_set_gravity" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * PangoGravity.C.val_ -> unit;) (x1, x2)
    val setSize_ = fn x1 & x2 => (_import "pango_font_description_set_size" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setStretch_ = fn x1 & x2 => (_import "pango_font_description_set_stretch" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * PangoStretch.C.val_ -> unit;) (x1, x2)
    val setStyle_ = fn x1 & x2 => (_import "pango_font_description_set_style" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * PangoStyle.C.val_ -> unit;) (x1, x2)
    val setVariant_ = fn x1 & x2 => (_import "pango_font_description_set_variant" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * PangoVariant.C.val_ -> unit;) (x1, x2)
    val setWeight_ = fn x1 & x2 => (_import "pango_font_description_set_weight" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * PangoWeight.C.val_ -> unit;) (x1, x2)
    val toFilename_ = _import "pango_font_description_to_filename" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val toString_ = _import "pango_font_description_to_string" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val unsetFields_ = fn x1 & x2 => (_import "pango_font_description_unset_fields" : PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p * PangoFontMask.C.val_ -> unit;) (x1, x2)
    val fromString_ = _import "mlton_pango_font_description_from_string" : cstring * unit CPointer.t -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    type record_t = PangoFontDescriptionRecord.t
    type gravity_t = PangoGravity.t
    type stretch_t = PangoStretch.t
    type style_t = PangoStyle.t
    type variant_t = PangoVariant.t
    type weight_t = PangoWeight.t
    type fontmask_t = PangoFontMask.t
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
    fun getFamily self = (PangoFontDescriptionRecord.C.withPtr ---> FFI.String.C.fromPtr false) getFamily_ self
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
    fun setFamily self family = (PangoFontDescriptionRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setFamily_ (self & family)
    fun setFamilyStatic self family = (PangoFontDescriptionRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setFamilyStatic_ (self & family)
    fun setGravity self gravity = (PangoFontDescriptionRecord.C.withPtr &&&> PangoGravity.C.withVal ---> I) setGravity_ (self & gravity)
    fun setSize self size = (PangoFontDescriptionRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSize_ (self & size)
    fun setStretch self stretch = (PangoFontDescriptionRecord.C.withPtr &&&> PangoStretch.C.withVal ---> I) setStretch_ (self & stretch)
    fun setStyle self style = (PangoFontDescriptionRecord.C.withPtr &&&> PangoStyle.C.withVal ---> I) setStyle_ (self & style)
    fun setVariant self variant = (PangoFontDescriptionRecord.C.withPtr &&&> PangoVariant.C.withVal ---> I) setVariant_ (self & variant)
    fun setWeight self weight = (PangoFontDescriptionRecord.C.withPtr &&&> PangoWeight.C.withVal ---> I) setWeight_ (self & weight)
    fun toFilename self = (PangoFontDescriptionRecord.C.withPtr ---> FFI.String.C.fromPtr true) toFilename_ self
    fun toString self = (PangoFontDescriptionRecord.C.withPtr ---> FFI.String.C.fromPtr true) toString_ self
    fun unsetFields self toUnset = (PangoFontDescriptionRecord.C.withPtr &&&> PangoFontMask.C.withVal ---> I) unsetFields_ (self & toUnset)
    fun fromString str = (FFI.String.C.withConstPtr ---> PangoFontDescriptionRecord.C.fromPtr true) fromString_ str
  end
