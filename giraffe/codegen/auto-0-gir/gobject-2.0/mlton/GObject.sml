structure GObject :
  G_OBJECT
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    where type 'a signal_t = 'a Signal.t
    where type 'object_class property_t = 'object_class Property.t =
  struct
    structure GObjectTypeCVectorNType =
      CValueCVectorNType(
        structure CElemType = GObjectType.C.ValueType
        structure ElemSequence = CValueVectorSequence(GObjectType.C.ValueType)
      )
    structure GObjectTypeCVectorN = CVectorN(GObjectTypeCVectorNType)
    structure GUIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GUIntType
        structure ElemSequence = CValueVectorSequence(GUIntType)
      )
    structure GUIntCVectorN = CVectorN(GUIntCVectorNType)
    val enumGetValue_ = fn x1 & x2 => (_import "g_enum_get_value" : GObjectEnumClassRecord.FFI.notnull GObjectEnumClassRecord.FFI.p * GInt.FFI.val_ -> GObjectEnumValueRecord.FFI.notnull GObjectEnumValueRecord.FFI.p;) (x1, x2)
    val enumGetValueByName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_enum_get_value_by_name" :
              GObjectEnumClassRecord.FFI.notnull GObjectEnumClassRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GObjectEnumValueRecord.FFI.notnull GObjectEnumValueRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val enumGetValueByNick_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_enum_get_value_by_nick" :
              GObjectEnumClassRecord.FFI.notnull GObjectEnumClassRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GObjectEnumValueRecord.FFI.notnull GObjectEnumValueRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val enumRegisterStatic_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_enum_register_static" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectEnumValueRecord.FFI.notnull GObjectEnumValueRecord.FFI.p
               -> GObjectType.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val flagsGetFirstValue_ = fn x1 & x2 => (_import "g_flags_get_first_value" : GObjectFlagsClassRecord.FFI.notnull GObjectFlagsClassRecord.FFI.p * GUInt.FFI.val_ -> GObjectFlagsValueRecord.FFI.notnull GObjectFlagsValueRecord.FFI.p;) (x1, x2)
    val flagsGetValueByName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_flags_get_value_by_name" :
              GObjectFlagsClassRecord.FFI.notnull GObjectFlagsClassRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GObjectFlagsValueRecord.FFI.notnull GObjectFlagsValueRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val flagsGetValueByNick_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_flags_get_value_by_nick" :
              GObjectFlagsClassRecord.FFI.notnull GObjectFlagsClassRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GObjectFlagsValueRecord.FFI.notnull GObjectFlagsValueRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val flagsRegisterStatic_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_flags_register_static" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectFlagsValueRecord.FFI.notnull GObjectFlagsValueRecord.FFI.p
               -> GObjectType.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt8.FFI.val_
               * GInt8.FFI.val_
               * GInt8.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GInt.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GUInt.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt64.FFI.val_
               * GInt64.FFI.val_
               * GInt64.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLong.FFI.val_
               * GLong.FFI.val_
               * GLong.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectType.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt8.FFI.val_
               * GUInt8.FFI.val_
               * GUInt8.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt64.FFI.val_
               * GUInt64.FFI.val_
               * GUInt64.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GULong.FFI.val_
               * GULong.FFI.val_
               * GULong.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GChar.FFI.val_
               * GObjectParamFlags.FFI.val_
               -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
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
    val pointerTypeRegisterStatic_ = _import "mlton_g_pointer_type_register_static" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GObjectType.FFI.val_;
    val signalListIds_ = fn x1 & x2 => (_import "g_signal_list_ids" : GObjectType.FFI.val_ * GUInt.FFI.ref_ -> GUIntCVectorN.FFI.notnull GUIntCVectorN.FFI.out_p;) (x1, x2)
    val signalLookup_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_signal_lookup" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
               * GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p
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
               * Utf8.FFI.notnull Utf8.MLton.p2
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
    val signalTypeCclosureNew_ = fn x1 & x2 => (_import "g_signal_type_cclosure_new" : GObjectType.FFI.val_ * GUInt.FFI.val_ -> GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p;) (x1, x2)
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
               * GObjectTypePluginClass.FFI.notnull GObjectTypePluginClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val typeCheckIsValueType_ = _import "g_type_check_is_value_type" : GObjectType.FFI.val_ -> GBool.FFI.val_;
    val typeCheckValueHolds_ = fn x1 & x2 => (_import "g_type_check_value_holds" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val typeChildren_ = fn x1 & x2 => (_import "g_type_children" : GObjectType.FFI.val_ * GUInt.FFI.ref_ -> GObjectTypeCVectorN.FFI.notnull GObjectTypeCVectorN.FFI.out_p;) (x1, x2)
    val typeDepth_ = _import "g_type_depth" : GObjectType.FFI.val_ -> GUInt.FFI.val_;
    val typeEnsure_ = _import "g_type_ensure" : GObjectType.FFI.val_ -> unit;
    val typeFromName_ = _import "mlton_g_type_from_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GObjectType.FFI.val_;
    val typeFundamental_ = _import "g_type_fundamental" : GObjectType.FFI.val_ -> GObjectType.FFI.val_;
    val typeFundamentalNext_ = _import "g_type_fundamental_next" : unit -> GObjectType.FFI.val_;
    val typeGetInstanceCount_ = _import "g_type_get_instance_count" : GObjectType.FFI.val_ -> GInt.FFI.val_;
    val typeGetPlugin_ = _import "g_type_get_plugin" : GObjectType.FFI.val_ -> GObjectTypePluginClass.FFI.notnull GObjectTypePluginClass.FFI.p;
    val typeGetTypeRegistrationSerial_ = _import "g_type_get_type_registration_serial" : unit -> GUInt.FFI.val_;
    val typeInit_ = _import "g_type_init" : unit -> unit;
    val typeInitWithDebugFlags_ = _import "g_type_init_with_debug_flags" : GObjectTypeDebugFlags.FFI.val_ -> unit;
    val typeInterfaces_ = fn x1 & x2 => (_import "g_type_interfaces" : GObjectType.FFI.val_ * GUInt.FFI.ref_ -> GObjectTypeCVectorN.FFI.notnull GObjectTypeCVectorN.FFI.out_p;) (x1, x2)
    val typeIsA_ = fn x1 & x2 => (_import "g_type_is_a" : GObjectType.FFI.val_ * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val typeName_ = _import "g_type_name" : GObjectType.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val typeNextBase_ = fn x1 & x2 => (_import "g_type_next_base" : GObjectType.FFI.val_ * GObjectType.FFI.val_ -> GObjectType.FFI.val_;) (x1, x2)
    val typeParent_ = _import "g_type_parent" : GObjectType.FFI.val_ -> GObjectType.FFI.val_;
    val typeQname_ = _import "g_type_qname" : GObjectType.FFI.val_ -> GLibQuark.FFI.val_;
    val typeQuery_ = fn x1 & x2 => (_import "g_type_query" : GObjectType.FFI.val_ * GObjectTypeQueryRecord.FFI.notnull GObjectTypeQueryRecord.FFI.p -> unit;) (x1, x2)
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectTypePluginClass.FFI.notnull GObjectTypePluginClass.FFI.p
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
    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    type 'a signal_t = 'a Signal.t
    type 'object_class property_t = 'object_class Property.t
    structure Type = GObjectType
    structure ConnectFlags = GObjectConnectFlags
    structure EnumClassRecord = GObjectEnumClassRecord
    structure EnumValueRecord = GObjectEnumValueRecord
    structure FlagsClassRecord = GObjectFlagsClassRecord
    structure FlagsValueRecord = GObjectFlagsValueRecord
    structure ParamFlags = GObjectParamFlags
    structure SignalFlags = GObjectSignalFlags
    structure SignalInvocationHintRecord = GObjectSignalInvocationHintRecord
    structure SignalMatchType = GObjectSignalMatchType
    structure SignalQueryRecord = GObjectSignalQueryRecord
    structure TypeDebugFlags = GObjectTypeDebugFlags
    structure TypeFlags = GObjectTypeFlags
    structure TypeFundamentalFlags = GObjectTypeFundamentalFlags
    structure TypeQueryRecord = GObjectTypeQueryRecord
    structure ValueArrayRecord = GObjectValueArrayRecord
    structure BindingFlags = GObjectBindingFlags
    structure EnumClass = GObjectEnumClass
    structure EnumValue = GObjectEnumValue
    structure FlagsClass = GObjectFlagsClass
    structure FlagsValue = GObjectFlagsValue
    structure SignalInvocationHint = GObjectSignalInvocationHint
    structure SignalQuery = GObjectSignalQuery
    structure TypeQuery = GObjectTypeQuery
    structure ValueRecord = GObjectValueRecord
    structure Value = GObjectValue
    structure ValueArray = GObjectValueArray
    structure ClosureRecord = GObjectClosureRecord
    structure ObjectClass = GObjectObjectClass
    structure ParamSpecClass = GObjectParamSpecClass
    structure BindingClass = GObjectBindingClass
    structure Closure = GObjectClosure
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
    structure Binding = GObjectBinding
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
    structure Object = GObjectObject
    val PARAM_MASK = 255
    val PARAM_STATIC_STRINGS = 0
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
    val VALUE_COLLECT_FORMAT_MAX_LENGTH = 8
    val VALUE_NOCOPY_CONTENTS = 134217728
    fun enumGetValue (enumClass, value) = (GObjectEnumClassRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GObjectEnumValueRecord.FFI.fromPtr false) enumGetValue_ (enumClass & value)
    fun enumGetValueByName (enumClass, name) = (GObjectEnumClassRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectEnumValueRecord.FFI.fromPtr false) enumGetValueByName_ (enumClass & name)
    fun enumGetValueByNick (enumClass, nick) = (GObjectEnumClassRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectEnumValueRecord.FFI.fromPtr false) enumGetValueByNick_ (enumClass & nick)
    fun enumRegisterStatic (name, constStaticValues) = (Utf8.FFI.withPtr &&&> GObjectEnumValueRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) enumRegisterStatic_ (name & constStaticValues)
    fun flagsGetFirstValue (flagsClass, value) = (GObjectFlagsClassRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> GObjectFlagsValueRecord.FFI.fromPtr false) flagsGetFirstValue_ (flagsClass & value)
    fun flagsGetValueByName (flagsClass, name) = (GObjectFlagsClassRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectFlagsValueRecord.FFI.fromPtr false) flagsGetValueByName_ (flagsClass & name)
    fun flagsGetValueByNick (flagsClass, nick) = (GObjectFlagsClassRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectFlagsValueRecord.FFI.fromPtr false) flagsGetValueByNick_ (flagsClass & nick)
    fun flagsRegisterStatic (name, constStaticValues) = (Utf8.FFI.withPtr &&&> GObjectFlagsValueRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) flagsRegisterStatic_ (name & constStaticValues)
    fun gtypeGetType () = (I ---> GObjectType.FFI.fromVal) gtypeGetType_ ()
    fun paramSpecBoolean
      (
        name,
        nick,
        blurb,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecBoolean_
        (
          name
           & nick
           & blurb
           & defaultValue
           & flags
        )
    fun paramSpecBoxed
      (
        name,
        nick,
        blurb,
        boxedType,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecBoxed_
        (
          name
           & nick
           & blurb
           & boxedType
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt8.FFI.withVal
         &&&> GInt8.FFI.withVal
         &&&> GInt8.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecChar_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecDouble_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
    fun paramSpecEnum
      (
        name,
        nick,
        blurb,
        enumType,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecEnum_
        (
          name
           & nick
           & blurb
           & enumType
           & defaultValue
           & flags
        )
    fun paramSpecFlags
      (
        name,
        nick,
        blurb,
        flagsType,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecFlags_
        (
          name
           & nick
           & blurb
           & flagsType
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecFloat_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
    fun paramSpecGtype
      (
        name,
        nick,
        blurb,
        isAType,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecGtype_
        (
          name
           & nick
           & blurb
           & isAType
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecInt_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecInt64_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecLong_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
    fun paramSpecObject
      (
        name,
        nick,
        blurb,
        objectType,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecObject_
        (
          name
           & nick
           & blurb
           & objectType
           & flags
        )
    fun paramSpecParam
      (
        name,
        nick,
        blurb,
        paramType,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecParam_
        (
          name
           & nick
           & blurb
           & paramType
           & flags
        )
    fun paramSpecPointer
      (
        name,
        nick,
        blurb,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecPointer_
        (
          name
           & nick
           & blurb
           & flags
        )
    fun paramSpecString
      (
        name,
        nick,
        blurb,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecString_
        (
          name
           & nick
           & blurb
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUchar_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUint_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUint64_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GULong.FFI.withVal
         &&&> GULong.FFI.withVal
         &&&> GULong.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUlong_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
    fun paramSpecUnichar
      (
        name,
        nick,
        blurb,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GChar.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUnichar_
        (
          name
           & nick
           & blurb
           & defaultValue
           & flags
        )
    fun pointerTypeRegisterStatic name = (Utf8.FFI.withPtr ---> GObjectType.FFI.fromVal) pointerTypeRegisterStatic_ name
    fun signalListIds itype =
      let
        val nIds & retVal = (GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GUIntCVectorN.FFI.fromPtr 1) signalListIds_ (itype & GUInt.null)
      in
        retVal (LargeInt.toInt nIds)
      end
    fun signalLookup (name, itype) = (Utf8.FFI.withPtr &&&> GObjectType.FFI.withVal ---> GUInt.FFI.fromVal) signalLookup_ (name & itype)
    fun signalOverrideClassClosure
      (
        signalId,
        instanceType,
        classClosure
      ) =
      (
        GUInt.FFI.withVal
         &&&> GObjectType.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withPtr
         ---> I
      )
        signalOverrideClassClosure_
        (
          signalId
           & instanceType
           & classClosure
        )
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
          (
            Utf8.FFI.withPtr
             &&&> GObjectType.FFI.withVal
             &&&> GUInt.FFI.withRefVal
             &&&> GLibQuark.FFI.withRefVal
             &&&> GBool.FFI.withVal
             ---> GUInt.FFI.fromVal
                   && GLibQuark.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            signalParseName_
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
    fun signalTypeCclosureNew (itype, structOffset) = (GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> GObjectClosureRecord.FFI.fromPtr true) signalTypeCclosureNew_ (itype & structOffset)
    fun typeAddClassPrivate (classType, privateSize) = (GObjectType.FFI.withVal &&&> GSize.FFI.withVal ---> I) typeAddClassPrivate_ (classType & privateSize)
    fun typeAddInstancePrivate (classType, privateSize) = (GObjectType.FFI.withVal &&&> GSize.FFI.withVal ---> GInt.FFI.fromVal) typeAddInstancePrivate_ (classType & privateSize)
    fun typeAddInterfaceDynamic
      (
        instanceType,
        interfaceType,
        plugin
      ) =
      (
        GObjectType.FFI.withVal
         &&&> GObjectType.FFI.withVal
         &&&> GObjectTypePluginClass.FFI.withPtr
         ---> I
      )
        typeAddInterfaceDynamic_
        (
          instanceType
           & interfaceType
           & plugin
        )
    fun typeCheckIsValueType type' = (GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeCheckIsValueType_ type'
    fun typeCheckValueHolds (value, type') = (GObjectValueRecord.FFI.withPtr &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeCheckValueHolds_ (value & type')
    fun typeChildren type' =
      let
        val nChildren & retVal = (GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GObjectTypeCVectorN.FFI.fromPtr 1) typeChildren_ (type' & GUInt.null)
      in
        retVal (LargeInt.toInt nChildren)
      end
    fun typeDepth type' = (GObjectType.FFI.withVal ---> GUInt.FFI.fromVal) typeDepth_ type'
    fun typeEnsure type' = (GObjectType.FFI.withVal ---> I) typeEnsure_ type'
    fun typeFromName name = (Utf8.FFI.withPtr ---> GObjectType.FFI.fromVal) typeFromName_ name
    fun typeFundamental typeId = (GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal) typeFundamental_ typeId
    fun typeFundamentalNext () = (I ---> GObjectType.FFI.fromVal) typeFundamentalNext_ ()
    fun typeGetInstanceCount type' = (GObjectType.FFI.withVal ---> GInt.FFI.fromVal) typeGetInstanceCount_ type'
    fun typeGetPlugin type' = (GObjectType.FFI.withVal ---> GObjectTypePluginClass.FFI.fromPtr false) typeGetPlugin_ type'
    fun typeGetTypeRegistrationSerial () = (I ---> GUInt.FFI.fromVal) typeGetTypeRegistrationSerial_ ()
    fun typeInit () = (I ---> I) typeInit_ ()
    fun typeInitWithDebugFlags debugFlags = (GObjectTypeDebugFlags.FFI.withVal ---> I) typeInitWithDebugFlags_ debugFlags
    fun typeInterfaces type' =
      let
        val nInterfaces & retVal = (GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GObjectTypeCVectorN.FFI.fromPtr 1) typeInterfaces_ (type' & GUInt.null)
      in
        retVal (LargeInt.toInt nInterfaces)
      end
    fun typeIsA (type', isAType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeIsA_ (type' & isAType)
    fun typeName type' = (GObjectType.FFI.withVal ---> Utf8.FFI.fromPtr 0) typeName_ type'
    fun typeNextBase (leafType, rootType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal) typeNextBase_ (leafType & rootType)
    fun typeParent type' = (GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal) typeParent_ type'
    fun typeQname type' = (GObjectType.FFI.withVal ---> GLibQuark.FFI.fromVal) typeQname_ type'
    fun typeQuery type' =
      let
        val query & () = (GObjectType.FFI.withVal &&&> GObjectTypeQueryRecord.FFI.withNewPtr ---> GObjectTypeQueryRecord.FFI.fromPtr true && I) typeQuery_ (type' & ())
      in
        query
      end
    fun typeRegisterDynamic
      (
        parentType,
        typeName,
        plugin,
        flags
      ) =
      (
        GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GObjectTypePluginClass.FFI.withPtr
         &&&> GObjectTypeFlags.FFI.withVal
         ---> GObjectType.FFI.fromVal
      )
        typeRegisterDynamic_
        (
          parentType
           & typeName
           & plugin
           & flags
        )
    fun typeTestFlags (type', flags) = (GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> GBool.FFI.fromVal) typeTestFlags_ (type' & flags)
  end
