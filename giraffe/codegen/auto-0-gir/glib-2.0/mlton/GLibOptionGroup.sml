structure GLibOptionGroup :>
  G_LIB_OPTION_GROUP
    where type t = GLibOptionGroupRecord.t =
  struct
    val getType_ = _import "g_option_group_get_type" : unit -> GObjectType.FFI.val_;
    val setTranslationDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_option_group_set_translation_domain" :
              GLibOptionGroupRecord.FFI.non_opt GLibOptionGroupRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibOptionGroupRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun setTranslationDomain self domain = (GLibOptionGroupRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTranslationDomain_ (self & domain)
  end
