signature G_OBJECT =
  sig
    type ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t
    type ('object_class, 'get, 'set, 'init) property_t
    type 'object_class property_init_t
    structure Type : G_OBJECT_TYPE
    structure ConnectFlags : G_OBJECT_CONNECT_FLAGS
    structure ParamFlags : G_OBJECT_PARAM_FLAGS
    structure SignalFlags : G_OBJECT_SIGNAL_FLAGS
    structure SignalInvocationHintRecord : G_OBJECT_SIGNAL_INVOCATION_HINT_RECORD
    structure SignalMatchType : G_OBJECT_SIGNAL_MATCH_TYPE
    structure TypeDebugFlags : G_OBJECT_TYPE_DEBUG_FLAGS
    structure TypeFlags : G_OBJECT_TYPE_FLAGS
    structure TypeFundamentalFlags : G_OBJECT_TYPE_FUNDAMENTAL_FLAGS
    structure ValueRecord : G_OBJECT_VALUE_RECORD
    structure ValueArrayRecord : G_OBJECT_VALUE_ARRAY_RECORD
    structure BindingFlags :
      G_OBJECT_BINDING_FLAGS
        where type type_t = Type.t
    structure ValueRecordCArrayN :
      C_ARRAY_N
        where type elem = ValueRecord.t
    structure SignalInvocationHint :
      G_OBJECT_SIGNAL_INVOCATION_HINT
        where type t = SignalInvocationHintRecord.t
        where type signal_flags_t = SignalFlags.t
    structure Value :
      G_OBJECT_VALUE
        where type t = ValueRecord.t
        where type type_t = Type.t
    structure ValueArray :
      G_OBJECT_VALUE_ARRAY
        where type t = ValueArrayRecord.t
        where type type_t = Type.t
        where type value_t = ValueRecord.t
    structure TypeCArrayN :
      C_ARRAY_N
        where type elem = Type.t
    structure ClosureRecord : G_OBJECT_CLOSURE_RECORD
    structure ObjectClass : G_OBJECT_OBJECT_CLASS
    structure ParamSpecClass : G_OBJECT_PARAM_SPEC_CLASS
    structure BindingClass :
      G_OBJECT_BINDING_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure InitiallyUnownedClass :
      G_OBJECT_INITIALLY_UNOWNED_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure ParamSpec :
      G_OBJECT_PARAM_SPEC
        where type 'a class = 'a ParamSpecClass.class
        where type value_t = ValueRecord.t
    structure ParamSpecBooleanClass :
      G_OBJECT_PARAM_SPEC_BOOLEAN_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecBoxedClass :
      G_OBJECT_PARAM_SPEC_BOXED_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecCharClass :
      G_OBJECT_PARAM_SPEC_CHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecDoubleClass :
      G_OBJECT_PARAM_SPEC_DOUBLE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecEnumClass :
      G_OBJECT_PARAM_SPEC_ENUM_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecFlagsClass :
      G_OBJECT_PARAM_SPEC_FLAGS_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecFloatClass :
      G_OBJECT_PARAM_SPEC_FLOAT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecGTypeClass :
      G_OBJECT_PARAM_SPEC_G_TYPE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecIntClass :
      G_OBJECT_PARAM_SPEC_INT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecInt64Class :
      G_OBJECT_PARAM_SPEC_INT_64_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecLongClass :
      G_OBJECT_PARAM_SPEC_LONG_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecObjectClass :
      G_OBJECT_PARAM_SPEC_OBJECT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecOverrideClass :
      G_OBJECT_PARAM_SPEC_OVERRIDE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecParamClass :
      G_OBJECT_PARAM_SPEC_PARAM_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecPointerClass :
      G_OBJECT_PARAM_SPEC_POINTER_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecStringClass :
      G_OBJECT_PARAM_SPEC_STRING_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecUCharClass :
      G_OBJECT_PARAM_SPEC_U_CHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecUIntClass :
      G_OBJECT_PARAM_SPEC_U_INT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecUInt64Class :
      G_OBJECT_PARAM_SPEC_U_INT_64_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecULongClass :
      G_OBJECT_PARAM_SPEC_U_LONG_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecUnicharClass :
      G_OBJECT_PARAM_SPEC_UNICHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecValueArrayClass :
      G_OBJECT_PARAM_SPEC_VALUE_ARRAY_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpecVariantClass :
      G_OBJECT_PARAM_SPEC_VARIANT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure TypeModuleClass :
      G_OBJECT_TYPE_MODULE_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure TypePluginClass :
      G_OBJECT_TYPE_PLUGIN_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure Closure :
      G_OBJECT_CLOSURE
        where type t = ClosureRecord.t
        where type type_t = Type.t
    structure InitiallyUnowned :
      G_OBJECT_INITIALLY_UNOWNED
        where type 'a class = 'a InitiallyUnownedClass.class
        where type type_t = Type.t
    structure ParamSpecBoolean :
      G_OBJECT_PARAM_SPEC_BOOLEAN
        where type 'a class = 'a ParamSpecBooleanClass.class
    structure ParamSpecBoxed :
      G_OBJECT_PARAM_SPEC_BOXED
        where type 'a class = 'a ParamSpecBoxedClass.class
    structure ParamSpecChar :
      G_OBJECT_PARAM_SPEC_CHAR
        where type 'a class = 'a ParamSpecCharClass.class
    structure ParamSpecDouble :
      G_OBJECT_PARAM_SPEC_DOUBLE
        where type 'a class = 'a ParamSpecDoubleClass.class
    structure ParamSpecEnum :
      G_OBJECT_PARAM_SPEC_ENUM
        where type 'a class = 'a ParamSpecEnumClass.class
    structure ParamSpecFlags :
      G_OBJECT_PARAM_SPEC_FLAGS
        where type 'a class = 'a ParamSpecFlagsClass.class
    structure ParamSpecFloat :
      G_OBJECT_PARAM_SPEC_FLOAT
        where type 'a class = 'a ParamSpecFloatClass.class
    structure ParamSpecGType :
      G_OBJECT_PARAM_SPEC_G_TYPE
        where type 'a class = 'a ParamSpecGTypeClass.class
    structure ParamSpecInt :
      G_OBJECT_PARAM_SPEC_INT
        where type 'a class = 'a ParamSpecIntClass.class
    structure ParamSpecInt64 :
      G_OBJECT_PARAM_SPEC_INT_64
        where type 'a class = 'a ParamSpecInt64Class.class
    structure ParamSpecLong :
      G_OBJECT_PARAM_SPEC_LONG
        where type 'a class = 'a ParamSpecLongClass.class
    structure ParamSpecObject :
      G_OBJECT_PARAM_SPEC_OBJECT
        where type 'a class = 'a ParamSpecObjectClass.class
    structure ParamSpecOverride :
      G_OBJECT_PARAM_SPEC_OVERRIDE
        where type 'a class = 'a ParamSpecOverrideClass.class
    structure ParamSpecParam :
      G_OBJECT_PARAM_SPEC_PARAM
        where type 'a class = 'a ParamSpecParamClass.class
    structure ParamSpecPointer :
      G_OBJECT_PARAM_SPEC_POINTER
        where type 'a class = 'a ParamSpecPointerClass.class
    structure ParamSpecString :
      G_OBJECT_PARAM_SPEC_STRING
        where type 'a class = 'a ParamSpecStringClass.class
    structure ParamSpecUChar :
      G_OBJECT_PARAM_SPEC_U_CHAR
        where type 'a class = 'a ParamSpecUCharClass.class
    structure ParamSpecUInt :
      G_OBJECT_PARAM_SPEC_U_INT
        where type 'a class = 'a ParamSpecUIntClass.class
    structure ParamSpecUInt64 :
      G_OBJECT_PARAM_SPEC_U_INT_64
        where type 'a class = 'a ParamSpecUInt64Class.class
    structure ParamSpecULong :
      G_OBJECT_PARAM_SPEC_U_LONG
        where type 'a class = 'a ParamSpecULongClass.class
    structure ParamSpecUnichar :
      G_OBJECT_PARAM_SPEC_UNICHAR
        where type 'a class = 'a ParamSpecUnicharClass.class
    structure ParamSpecValueArray :
      G_OBJECT_PARAM_SPEC_VALUE_ARRAY
        where type 'a class = 'a ParamSpecValueArrayClass.class
    structure ParamSpecVariant :
      G_OBJECT_PARAM_SPEC_VARIANT
        where type 'a class = 'a ParamSpecVariantClass.class
    structure TypeModule :
      G_OBJECT_TYPE_MODULE
        where type 'a class = 'a TypeModuleClass.class
        where type 'a type_plugin_class = 'a TypePluginClass.class
        where type type_t = Type.t
    structure TypePlugin :
      G_OBJECT_TYPE_PLUGIN
        where type 'a class = 'a TypePluginClass.class
        where type type_t = Type.t
    structure Binding :
      G_OBJECT_BINDING
        where type 'a class = 'a BindingClass.class
        where type type_t = Type.t
        where type binding_flags_t = BindingFlags.t
        where type 'a object_class = 'a ObjectClass.class
        where type ('object_class, 'get, 'set, 'init) property_t = ('object_class, 'get, 'set, 'init) property_t
    structure Object :
      G_OBJECT_OBJECT
        where type 'a class = 'a ObjectClass.class
        where type type_t = Type.t
        where type 'a binding_class = 'a BindingClass.class
        where type binding_flags_t = BindingFlags.t
        where type value_record_c_array_n_t = ValueRecordCArrayN.t
        where type value_t = ValueRecord.t
        where type closure_t = ClosureRecord.t
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type 'a property_init_t = 'a property_init_t
        where type ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t = ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t
    val PARAM_MASK : LargeInt.int
    val PARAM_STATIC_STRINGS : LargeInt.int
    val PARAM_USER_SHIFT : LargeInt.int
    val SIGNAL_FLAGS_MASK : LargeInt.int
    val SIGNAL_MATCH_MASK : LargeInt.int
    val TYPE_FUNDAMENTAL_MAX : LargeInt.int
    val TYPE_FUNDAMENTAL_SHIFT : LargeInt.int
    val TYPE_RESERVED_BSE_FIRST : LargeInt.int
    val TYPE_RESERVED_BSE_LAST : LargeInt.int
    val TYPE_RESERVED_GLIB_FIRST : LargeInt.int
    val TYPE_RESERVED_GLIB_LAST : LargeInt.int
    val TYPE_RESERVED_USER_FIRST : LargeInt.int
    val VALUE_INTERNED_STRING : LargeInt.int
    val VALUE_NOCOPY_CONTENTS : LargeInt.int
    val enumToString : Type.t * LargeInt.int -> string
    val flagsToString : Type.t * LargeInt.int -> string
    val gtypeGetType : unit -> Type.t
    val paramSpecBoolean :
      string
       * string
       * string
       * bool
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecBoxed :
      string
       * string
       * string
       * Type.t
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecChar :
      string
       * string
       * string
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecDouble :
      string
       * string
       * string
       * real
       * real
       * real
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecEnum :
      string
       * string
       * string
       * Type.t
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecFlags :
      string
       * string
       * string
       * Type.t
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecFloat :
      string
       * string
       * string
       * real
       * real
       * real
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecGtype :
      string
       * string
       * string
       * Type.t
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecInt :
      string
       * string
       * string
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecInt64 :
      string
       * string
       * string
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecLong :
      string
       * string
       * string
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecObject :
      string
       * string
       * string
       * Type.t
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecParam :
      string
       * string
       * string
       * Type.t
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecPointer :
      string
       * string
       * string
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecString :
      string
       * string
       * string
       * string option
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecUchar :
      string
       * string
       * string
       * Word8.word
       * Word8.word
       * Word8.word
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecUint :
      string
       * string
       * string
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecUint64 :
      string
       * string
       * string
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecUlong :
      string
       * string
       * string
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecUnichar :
      string
       * string
       * string
       * char
       * ParamFlags.t
       -> base ParamSpecClass.class
    val paramSpecVariant :
      string
       * string
       * string
       * GLib.VariantTypeRecord.t
       * GLib.VariantRecord.t option
       * ParamFlags.t
       -> base ParamSpecClass.class
    val pointerTypeRegisterStatic : string -> Type.t
    val signalIsValidName : string -> bool
    val signalListIds : Type.t -> GUIntCArrayN.t
    val signalLookup : string * Type.t -> LargeInt.int
    val signalOverrideClassClosure :
      LargeInt.int
       * Type.t
       * ClosureRecord.t
       -> unit
    val signalParseName :
      string
       * Type.t
       * bool
       -> (LargeInt.int * GLib.Quark.t) option
    val signalTypeCclosureNew : Type.t * LargeInt.int -> ClosureRecord.t
    val typeAddClassPrivate : Type.t * int -> unit
    val typeAddInstancePrivate : Type.t * int -> LargeInt.int
    val typeAddInterfaceDynamic :
      Type.t
       * Type.t
       * 'a TypePluginClass.class
       -> unit
    val typeCheckIsValueType : Type.t -> bool
    val typeCheckValueHolds : ValueRecord.t * Type.t -> bool
    val typeChildren : Type.t -> TypeCArrayN.t
    val typeDepth : Type.t -> LargeInt.int
    val typeEnsure : Type.t -> unit
    val typeFromName : string -> Type.t
    val typeFundamental : Type.t -> Type.t
    val typeFundamentalNext : unit -> Type.t
    val typeGetInstanceCount : Type.t -> LargeInt.int
    val typeGetPlugin : Type.t -> base TypePluginClass.class
    val typeGetTypeRegistrationSerial : unit -> LargeInt.int
    val typeInit : unit -> unit
    val typeInitWithDebugFlags : TypeDebugFlags.t -> unit
    val typeInterfaces : Type.t -> TypeCArrayN.t
    val typeIsA : Type.t * Type.t -> bool
    val typeName : Type.t -> string
    val typeNextBase : Type.t * Type.t -> Type.t
    val typeParent : Type.t -> Type.t
    val typeQname : Type.t -> GLib.Quark.t
    val typeRegisterDynamic :
      Type.t
       * string
       * 'a TypePluginClass.class
       * TypeFlags.t
       -> Type.t
    val typeTestFlags : Type.t * LargeInt.int -> bool
  end
