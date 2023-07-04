structure GObject :
  G_OBJECT
    where type ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t = ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) Signal.t
    where type ('object_class, 'get, 'set, 'init) property_t = ('object_class, 'get, 'set, 'init) Property.t
    where type 'object_class property_init_t = 'object_class Property.init_t =
  struct
    val enumToString_ = fn x1 & x2 => (_import "g_enum_to_string" : GObjectType.FFI.val_ * GInt.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val flagsToString_ = fn x1 & x2 => (_import "g_flags_to_string" : GObjectType.FFI.val_ * GUInt.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val gtypeGetType_ = _import "g_gtype_get_type" : unit -> GObjectType.FFI.val_;
    val paramSpecBoolean_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8 =>
          (
            _import "mlton_g_param_spec_boolean" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
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
    val paramSpecBoxed_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8 =>
          (
            _import "mlton_g_param_spec_boxed" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
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
    val paramSpecChar_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_char" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt8.FFI.val_
               * GInt8.FFI.val_
               * GInt8.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecDouble_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_double" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecEnum_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_g_param_spec_enum" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GInt.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val paramSpecFlags_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_g_param_spec_flags" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GUInt.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val paramSpecFloat_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_float" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecGtype_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8 =>
          (
            _import "mlton_g_param_spec_gtype" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
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
    val paramSpecInt_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_int" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecInt64_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_int64" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt64.FFI.val_
               * GInt64.FFI.val_
               * GInt64.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecLong_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_long" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLong.FFI.val_
               * GLong.FFI.val_
               * GLong.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecObject_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8 =>
          (
            _import "mlton_g_param_spec_object" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
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
    val paramSpecParam_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8 =>
          (
            _import "mlton_g_param_spec_param" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
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
    val paramSpecPointer_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_param_spec_pointer" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
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
    val paramSpecString_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8)
         & x9 =>
          (
            _import "mlton_g_param_spec_string" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val paramSpecUchar_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_uchar" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt8.FFI.val_
               * GUInt8.FFI.val_
               * GUInt8.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecUint_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_uint" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecUint64_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_uint64" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt64.FFI.val_
               * GUInt64.FFI.val_
               * GUInt64.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecUlong_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_param_spec_ulong" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GULong.FFI.val_
               * GULong.FFI.val_
               * GULong.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val paramSpecUnichar_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8 =>
          (
            _import "mlton_g_param_spec_unichar" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GChar.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
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
    val paramSpecVariant_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_g_param_spec_variant" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val pointerTypeRegisterStatic_ = _import "mlton_g_pointer_type_register_static" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GObjectType.FFI.val_;
    val signalIsValidName_ = _import "mlton_g_signal_is_valid_name" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val signalListIds_ = fn x1 & x2 => (_import "g_signal_list_ids" : GObjectType.FFI.val_ * GUInt.FFI.ref_ -> GUIntCArrayN.FFI.non_opt GUIntCArrayN.FFI.out_p;) (x1, x2)
    val signalLookup_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_signal_lookup" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val signalOverrideClassClosure_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_signal_override_class_closure" :
              GUInt.FFI.val_
               * GObjectType.FFI.val_
               * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val signalParseName_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_signal_parse_name" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GUInt.FFI.ref_
               * GLibQuark.FFI.ref_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val signalTypeCclosureNew_ = fn x1 & x2 => (_import "g_signal_type_cclosure_new" : GObjectType.FFI.val_ * GUInt.FFI.val_ -> GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p;) (x1, x2)
    val typeAddClassPrivate_ = fn x1 & x2 => (_import "g_type_add_class_private" : GObjectType.FFI.val_ * GSize.FFI.val_ -> unit;) (x1, x2)
    val typeAddInstancePrivate_ = fn x1 & x2 => (_import "g_type_add_instance_private" : GObjectType.FFI.val_ * GSize.FFI.val_ -> GInt.FFI.val_;) (x1, x2)
    val typeAddInterfaceDynamic_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_type_add_interface_dynamic" :
              GObjectType.FFI.val_
               * GObjectType.FFI.val_
               * GObjectTypePluginClass.FFI.non_opt GObjectTypePluginClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val typeCheckIsValueType_ = _import "g_type_check_is_value_type" : GObjectType.FFI.val_ -> GBool.FFI.val_;
    val typeCheckValueHolds_ = fn x1 & x2 => (_import "g_type_check_value_holds" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val typeChildren_ = fn x1 & x2 => (_import "g_type_children" : GObjectType.FFI.val_ * GUInt.FFI.ref_ -> GObjectTypeCArrayN.FFI.non_opt GObjectTypeCArrayN.FFI.out_p;) (x1, x2)
    val typeDepth_ = _import "g_type_depth" : GObjectType.FFI.val_ -> GUInt.FFI.val_;
    val typeEnsure_ = _import "g_type_ensure" : GObjectType.FFI.val_ -> unit;
    val typeFromName_ = _import "mlton_g_type_from_name" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GObjectType.FFI.val_;
    val typeFundamental_ = _import "g_type_fundamental" : GObjectType.FFI.val_ -> GObjectType.FFI.val_;
    val typeFundamentalNext_ = _import "g_type_fundamental_next" : unit -> GObjectType.FFI.val_;
    val typeGetInstanceCount_ = _import "g_type_get_instance_count" : GObjectType.FFI.val_ -> GInt.FFI.val_;
    val typeGetPlugin_ = _import "g_type_get_plugin" : GObjectType.FFI.val_ -> GObjectTypePluginClass.FFI.non_opt GObjectTypePluginClass.FFI.p;
    val typeGetTypeRegistrationSerial_ = _import "g_type_get_type_registration_serial" : unit -> GUInt.FFI.val_;
    val typeInit_ = _import "g_type_init" : unit -> unit;
    val typeInitWithDebugFlags_ = _import "g_type_init_with_debug_flags" : GObjectTypeDebugFlags.FFI.val_ -> unit;
    val typeInterfaces_ = fn x1 & x2 => (_import "g_type_interfaces" : GObjectType.FFI.val_ * GUInt.FFI.ref_ -> GObjectTypeCArrayN.FFI.non_opt GObjectTypeCArrayN.FFI.out_p;) (x1, x2)
    val typeIsA_ = fn x1 & x2 => (_import "g_type_is_a" : GObjectType.FFI.val_ * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val typeName_ = _import "g_type_name" : GObjectType.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val typeNextBase_ = fn x1 & x2 => (_import "g_type_next_base" : GObjectType.FFI.val_ * GObjectType.FFI.val_ -> GObjectType.FFI.val_;) (x1, x2)
    val typeParent_ = _import "g_type_parent" : GObjectType.FFI.val_ -> GObjectType.FFI.val_;
    val typeQname_ = _import "g_type_qname" : GObjectType.FFI.val_ -> GLibQuark.FFI.val_;
    val typeRegisterDynamic_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_type_register_dynamic" :
              GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectTypePluginClass.FFI.non_opt GObjectTypePluginClass.FFI.p
               * GObjectTypeFlags.FFI.val_
               -> GObjectType.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val typeTestFlags_ = fn x1 & x2 => (_import "g_type_test_flags" : GObjectType.FFI.val_ * GUInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    type ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t = ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) Signal.t
    type ('object_class, 'get, 'set, 'init) property_t = ('object_class, 'get, 'set, 'init) Property.t
    type 'object_class property_init_t = 'object_class Property.init_t
    structure Type = GObjectType
    structure ConnectFlags = GObjectConnectFlags
    structure ParamFlags = GObjectParamFlags
    structure SignalFlags = GObjectSignalFlags
    structure SignalInvocationHintRecord = GObjectSignalInvocationHintRecord
    structure SignalMatchType = GObjectSignalMatchType
    structure TypeDebugFlags = GObjectTypeDebugFlags
    structure TypeFlags = GObjectTypeFlags
    structure TypeFundamentalFlags = GObjectTypeFundamentalFlags
    structure ValueRecord = GObjectValueRecord
    structure ValueArrayRecord = GObjectValueArrayRecord
    structure WeakRefRecord = GObjectWeakRefRecord
    structure BindingFlags = GObjectBindingFlags
    structure ValueRecordCArrayN = GObjectValueRecordCArrayN
    structure SignalInvocationHint = GObjectSignalInvocationHint
    structure Value = GObjectValue
    structure ValueArray = GObjectValueArray
    structure TypeCArrayN = GObjectTypeCArrayN
    structure ClosureRecord = GObjectClosureRecord
    structure ObjectClass = GObjectObjectClass
    structure ParamSpecClass = GObjectParamSpecClass
    structure BindingClass = GObjectBindingClass
    structure InitiallyUnownedClass = GObjectInitiallyUnownedClass
    structure ParamSpec = GObjectParamSpec
    structure ParamSpecBooleanClass = GObjectParamSpecBooleanClass
    structure ParamSpecBoxedClass = GObjectParamSpecBoxedClass
    structure ParamSpecCharClass = GObjectParamSpecCharClass
    structure ParamSpecDoubleClass = GObjectParamSpecDoubleClass
    structure ParamSpecEnumClass = GObjectParamSpecEnumClass
    structure ParamSpecFlagsClass = GObjectParamSpecFlagsClass
    structure ParamSpecFloatClass = GObjectParamSpecFloatClass
    structure ParamSpecGTypeClass = GObjectParamSpecGTypeClass
    structure ParamSpecIntClass = GObjectParamSpecIntClass
    structure ParamSpecInt64Class = GObjectParamSpecInt64Class
    structure ParamSpecLongClass = GObjectParamSpecLongClass
    structure ParamSpecObjectClass = GObjectParamSpecObjectClass
    structure ParamSpecOverrideClass = GObjectParamSpecOverrideClass
    structure ParamSpecParamClass = GObjectParamSpecParamClass
    structure ParamSpecPointerClass = GObjectParamSpecPointerClass
    structure ParamSpecStringClass = GObjectParamSpecStringClass
    structure ParamSpecUCharClass = GObjectParamSpecUCharClass
    structure ParamSpecUIntClass = GObjectParamSpecUIntClass
    structure ParamSpecUInt64Class = GObjectParamSpecUInt64Class
    structure ParamSpecULongClass = GObjectParamSpecULongClass
    structure ParamSpecUnicharClass = GObjectParamSpecUnicharClass
    structure ParamSpecValueArrayClass = GObjectParamSpecValueArrayClass
    structure ParamSpecVariantClass = GObjectParamSpecVariantClass
    structure TypeModuleClass = GObjectTypeModuleClass
    structure TypePluginClass = GObjectTypePluginClass
    structure WeakRef = GObjectWeakRef
    structure Closure = GObjectClosure
    structure InitiallyUnowned = GObjectInitiallyUnowned
    structure ParamSpecBoolean = GObjectParamSpecBoolean
    structure ParamSpecBoxed = GObjectParamSpecBoxed
    structure ParamSpecChar = GObjectParamSpecChar
    structure ParamSpecDouble = GObjectParamSpecDouble
    structure ParamSpecEnum = GObjectParamSpecEnum
    structure ParamSpecFlags = GObjectParamSpecFlags
    structure ParamSpecFloat = GObjectParamSpecFloat
    structure ParamSpecGType = GObjectParamSpecGType
    structure ParamSpecInt = GObjectParamSpecInt
    structure ParamSpecInt64 = GObjectParamSpecInt64
    structure ParamSpecLong = GObjectParamSpecLong
    structure ParamSpecObject = GObjectParamSpecObject
    structure ParamSpecOverride = GObjectParamSpecOverride
    structure ParamSpecParam = GObjectParamSpecParam
    structure ParamSpecPointer = GObjectParamSpecPointer
    structure ParamSpecString = GObjectParamSpecString
    structure ParamSpecUChar = GObjectParamSpecUChar
    structure ParamSpecUInt = GObjectParamSpecUInt
    structure ParamSpecUInt64 = GObjectParamSpecUInt64
    structure ParamSpecULong = GObjectParamSpecULong
    structure ParamSpecUnichar = GObjectParamSpecUnichar
    structure ParamSpecValueArray = GObjectParamSpecValueArray
    structure ParamSpecVariant = GObjectParamSpecVariant
    structure TypeModule = GObjectTypeModule
    structure TypePlugin = GObjectTypePlugin
    structure Binding = GObjectBinding
    structure Object = GObjectObject
    val PARAM_MASK = 255
    val PARAM_STATIC_STRINGS = 224
    val PARAM_USER_SHIFT = 8
    val SIGNAL_FLAGS_MASK = 511
    val SIGNAL_MATCH_MASK = 63
    val TYPE_FUNDAMENTAL_MAX = 255
    val TYPE_FUNDAMENTAL_SHIFT = 2
    val TYPE_RESERVED_BSE_FIRST = 32
    val TYPE_RESERVED_BSE_LAST = 48
    val TYPE_RESERVED_GLIB_FIRST = 22
    val TYPE_RESERVED_GLIB_LAST = 31
    val TYPE_RESERVED_USER_FIRST = 49
    val VALUE_INTERNED_STRING = 268435456
    val VALUE_NOCOPY_CONTENTS = 134217728
    local
      val call = GObjectType.FFI.withVal &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun enumToString (gEnumType, value) = call enumToString_ (gEnumType & value)
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun flagsToString (flagsType, value) = call flagsToString_ (flagsType & value)
    end
    local
      val call = I ---> GObjectType.FFI.fromVal
    in
      fun gtypeGetType () = call gtypeGetType_ ()
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecBoolean
        (
          name,
          nick,
          blurb,
          defaultValue,
          flags
        ) =
        call paramSpecBoolean_
          (
            name
             & nick
             & blurb
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecBoxed
        (
          name,
          nick,
          blurb,
          boxedType,
          flags
        ) =
        call paramSpecBoxed_
          (
            name
             & nick
             & blurb
             & boxedType
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt8.FFI.withVal
         &&&> GInt8.FFI.withVal
         &&&> GInt8.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecChar
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecChar_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecDouble
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecDouble_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecEnum
        (
          name,
          nick,
          blurb,
          enumType,
          defaultValue,
          flags
        ) =
        call paramSpecEnum_
          (
            name
             & nick
             & blurb
             & enumType
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecFlags
        (
          name,
          nick,
          blurb,
          flagsType,
          defaultValue,
          flags
        ) =
        call paramSpecFlags_
          (
            name
             & nick
             & blurb
             & flagsType
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecFloat
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecFloat_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecGtype
        (
          name,
          nick,
          blurb,
          isAType,
          flags
        ) =
        call paramSpecGtype_
          (
            name
             & nick
             & blurb
             & isAType
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecInt
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecInt_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecInt64
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecInt64_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecLong
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecLong_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecObject
        (
          name,
          nick,
          blurb,
          objectType,
          flags
        ) =
        call paramSpecObject_
          (
            name
             & nick
             & blurb
             & objectType
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecParam
        (
          name,
          nick,
          blurb,
          paramType,
          flags
        ) =
        call paramSpecParam_
          (
            name
             & nick
             & blurb
             & paramType
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecPointer
        (
          name,
          nick,
          blurb,
          flags
        ) =
        call paramSpecPointer_
          (
            name
             & nick
             & blurb
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecString
        (
          name,
          nick,
          blurb,
          defaultValue,
          flags
        ) =
        call paramSpecString_
          (
            name
             & nick
             & blurb
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUchar
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecUchar_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUint
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecUint_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUint64
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecUint64_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GULong.FFI.withVal
         &&&> GULong.FFI.withVal
         &&&> GULong.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUlong
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecUlong_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GChar.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUnichar
        (
          name,
          nick,
          blurb,
          defaultValue,
          flags
        ) =
        call paramSpecUnichar_
          (
            name
             & nick
             & blurb
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantTypeRecord.FFI.withPtr false
         &&&> GLibVariantRecord.FFI.withOptPtr true
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecVariant
        (
          name,
          nick,
          blurb,
          type',
          defaultValue,
          flags
        ) =
        call paramSpecVariant_
          (
            name
             & nick
             & blurb
             & type'
             & defaultValue
             & flags
          )
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GObjectType.FFI.fromVal
    in
      fun pointerTypeRegisterStatic name = call pointerTypeRegisterStatic_ name
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal
    in
      fun signalIsValidName name = call signalIsValidName_ name
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GUIntCArrayN.FFI.fromPtr ~1
    in
      fun signalListIds itype =
        let
          val nIds & retVal = call signalListIds_ (itype & GUInt.null)
        in
          retVal (LargeInt.toInt nIds)
        end
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GObjectType.FFI.withVal ---> GUInt.FFI.fromVal
    in
      fun signalLookup (name, itype) = call signalLookup_ (name & itype)
    end
    local
      val call =
        GUInt.FFI.withVal
         &&&> GObjectType.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withPtr false
         ---> I
    in
      fun signalOverrideClassClosure
        (
          signalId,
          instanceType,
          classClosure
        ) =
        call signalOverrideClassClosure_
          (
            signalId
             & instanceType
             & classClosure
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GUInt.FFI.withRefVal
         &&&> GLibQuark.FFI.withRefVal
         &&&> GBool.FFI.withVal
         ---> GUInt.FFI.fromVal
               && GLibQuark.FFI.fromVal
               && GBool.FFI.fromVal
    in
      fun signalParseName
        (
          detailedSignal,
          itype,
          forceDetailQuark
        ) =
        let
          val signalIdP
           & detailP
           & retVal =
            call signalParseName_
              (
                detailedSignal
                 & itype
                 & GUInt.null
                 & GLibQuark.null
                 & forceDetailQuark
              )
        in
          if retVal then SOME (signalIdP, detailP) else NONE
        end
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> GObjectClosureRecord.FFI.fromPtr false
    in
      fun signalTypeCclosureNew (itype, structOffset) = call signalTypeCclosureNew_ (itype & structOffset)
    end
    local
      val call = GObjectType.FFI.withVal &&&> GSize.FFI.withVal ---> I
    in
      fun typeAddClassPrivate (classType, privateSize) = call typeAddClassPrivate_ (classType & privateSize)
    end
    local
      val call = GObjectType.FFI.withVal &&&> GSize.FFI.withVal ---> GInt.FFI.fromVal
    in
      fun typeAddInstancePrivate (classType, privateSize) = call typeAddInstancePrivate_ (classType & privateSize)
    end
    local
      val call =
        GObjectType.FFI.withVal
         &&&> GObjectType.FFI.withVal
         &&&> GObjectTypePluginClass.FFI.withPtr false
         ---> I
    in
      fun typeAddInterfaceDynamic
        (
          instanceType,
          interfaceType,
          plugin
        ) =
        call typeAddInterfaceDynamic_
          (
            instanceType
             & interfaceType
             & GObjectTypePluginClass.toBase plugin
          )
    end
    local
      val call = GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeCheckIsValueType type' = call typeCheckIsValueType_ type'
    end
    local
      val call = GObjectValueRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeCheckValueHolds (value, type') = call typeCheckValueHolds_ (value & type')
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GObjectTypeCArrayN.FFI.fromPtr ~1
    in
      fun typeChildren type' =
        let
          val nChildren & retVal = call typeChildren_ (type' & GUInt.null)
        in
          retVal (LargeInt.toInt nChildren)
        end
    end
    local
      val call = GObjectType.FFI.withVal ---> GUInt.FFI.fromVal
    in
      fun typeDepth type' = call typeDepth_ type'
    end
    local
      val call = GObjectType.FFI.withVal ---> I
    in
      fun typeEnsure type' = call typeEnsure_ type'
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GObjectType.FFI.fromVal
    in
      fun typeFromName name = call typeFromName_ name
    end
    local
      val call = GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal
    in
      fun typeFundamental typeId = call typeFundamental_ typeId
    end
    local
      val call = I ---> GObjectType.FFI.fromVal
    in
      fun typeFundamentalNext () = call typeFundamentalNext_ ()
    end
    local
      val call = GObjectType.FFI.withVal ---> GInt.FFI.fromVal
    in
      fun typeGetInstanceCount type' = call typeGetInstanceCount_ type'
    end
    local
      val call = GObjectType.FFI.withVal ---> GObjectTypePluginClass.FFI.fromPtr false
    in
      fun typeGetPlugin type' = call typeGetPlugin_ type'
    end
    local
      val call = I ---> GUInt.FFI.fromVal
    in
      fun typeGetTypeRegistrationSerial () = call typeGetTypeRegistrationSerial_ ()
    end
    local
      val call = I ---> I
    in
      fun typeInit () = call typeInit_ ()
    end
    local
      val call = GObjectTypeDebugFlags.FFI.withVal ---> I
    in
      fun typeInitWithDebugFlags debugFlags = call typeInitWithDebugFlags_ debugFlags
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GObjectTypeCArrayN.FFI.fromPtr ~1
    in
      fun typeInterfaces type' =
        let
          val nInterfaces & retVal = call typeInterfaces_ (type' & GUInt.null)
        in
          retVal (LargeInt.toInt nInterfaces)
        end
    end
    local
      val call = GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeIsA (type', isAType) = call typeIsA_ (type' & isAType)
    end
    local
      val call = GObjectType.FFI.withVal ---> Utf8.FFI.fromPtr 0
    in
      fun typeName type' = call typeName_ type'
    end
    local
      val call = GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal
    in
      fun typeNextBase (leafType, rootType) = call typeNextBase_ (leafType & rootType)
    end
    local
      val call = GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal
    in
      fun typeParent type' = call typeParent_ type'
    end
    local
      val call = GObjectType.FFI.withVal ---> GLibQuark.FFI.fromVal
    in
      fun typeQname type' = call typeQname_ type'
    end
    local
      val call =
        GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectTypePluginClass.FFI.withPtr false
         &&&> GObjectTypeFlags.FFI.withVal
         ---> GObjectType.FFI.fromVal
    in
      fun typeRegisterDynamic
        (
          parentType,
          typeName,
          plugin,
          flags
        ) =
        call typeRegisterDynamic_
          (
            parentType
             & typeName
             & GObjectTypePluginClass.toBase plugin
             & flags
          )
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeTestFlags (type', flags) = call typeTestFlags_ (type' & flags)
    end
  end
