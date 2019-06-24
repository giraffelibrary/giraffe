signature G_OBJECT =
  sig
    type ('a, 'b) value_accessor_t
    type 'a signal_t
    type 'object_class property_t
    structure Type : G_OBJECT_TYPE
    structure ConnectFlags : G_OBJECT_CONNECT_FLAGS
    structure EnumClassRecord : G_OBJECT_ENUM_CLASS_RECORD
    structure EnumValueRecord : G_OBJECT_ENUM_VALUE_RECORD
    structure FlagsClassRecord : G_OBJECT_FLAGS_CLASS_RECORD
    structure FlagsValueRecord : G_OBJECT_FLAGS_VALUE_RECORD
    structure ParamFlags : G_OBJECT_PARAM_FLAGS
    structure SignalFlags : G_OBJECT_SIGNAL_FLAGS
    structure SignalInvocationHintRecord : G_OBJECT_SIGNAL_INVOCATION_HINT_RECORD
    structure SignalMatchType : G_OBJECT_SIGNAL_MATCH_TYPE
    structure SignalQueryRecord : G_OBJECT_SIGNAL_QUERY_RECORD
    structure TypeDebugFlags : G_OBJECT_TYPE_DEBUG_FLAGS
    structure TypeFlags : G_OBJECT_TYPE_FLAGS
    structure TypeFundamentalFlags : G_OBJECT_TYPE_FUNDAMENTAL_FLAGS
    structure TypeQueryRecord : G_OBJECT_TYPE_QUERY_RECORD
    structure ValueArrayRecord :
      G_OBJECT_VALUE_ARRAY_RECORD
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure BindingFlags :
      G_OBJECT_BINDING_FLAGS
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
        where type type_t = Type.t
    structure EnumClass :
      G_OBJECT_ENUM_CLASS
        where type t = EnumClassRecord.t
    structure EnumValue :
      G_OBJECT_ENUM_VALUE
        where type t = EnumValueRecord.t
    structure FlagsClass :
      G_OBJECT_FLAGS_CLASS
        where type t = FlagsClassRecord.t
    structure FlagsValue :
      G_OBJECT_FLAGS_VALUE
        where type t = FlagsValueRecord.t
    structure SignalInvocationHint :
      G_OBJECT_SIGNAL_INVOCATION_HINT
        where type t = SignalInvocationHintRecord.t
    structure SignalQuery :
      G_OBJECT_SIGNAL_QUERY
        where type t = SignalQueryRecord.t
    structure TypeQuery :
      G_OBJECT_TYPE_QUERY
        where type t = TypeQueryRecord.t
    structure ValueRecord :
      G_OBJECT_VALUE_RECORD
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure Value :
      G_OBJECT_VALUE
        where type t = ValueRecord.t
        where type type_t = Type.t
    structure ValueArray :
      G_OBJECT_VALUE_ARRAY
        where type t = ValueArrayRecord.t
        where type type_t = Type.t
        where type value_t = ValueRecord.t
    structure ClosureRecord :
      G_OBJECT_CLOSURE_RECORD
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ObjectClass :
      G_OBJECT_OBJECT_CLASS
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecClass :
      G_OBJECT_PARAM_SPEC_CLASS
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure BindingClass :
      G_OBJECT_BINDING_CLASS
        where type 'a object_class = 'a ObjectClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure Closure :
      G_OBJECT_CLOSURE
        where type t = ClosureRecord.t
        where type type_t = Type.t
    structure InitiallyUnownedClass :
      G_OBJECT_INITIALLY_UNOWNED_CLASS
        where type 'a object_class = 'a ObjectClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpec :
      G_OBJECT_PARAM_SPEC
        where type 'a class = 'a ParamSpecClass.class
        where type value_t = ValueRecord.t
    structure ParamSpecBooleanClass :
      G_OBJECT_PARAM_SPEC_BOOLEAN_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecBoxedClass :
      G_OBJECT_PARAM_SPEC_BOXED_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecCharClass :
      G_OBJECT_PARAM_SPEC_CHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecDoubleClass :
      G_OBJECT_PARAM_SPEC_DOUBLE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecEnumClass :
      G_OBJECT_PARAM_SPEC_ENUM_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecFlagsClass :
      G_OBJECT_PARAM_SPEC_FLAGS_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecFloatClass :
      G_OBJECT_PARAM_SPEC_FLOAT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecGTypeClass :
      G_OBJECT_PARAM_SPEC_G_TYPE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecIntClass :
      G_OBJECT_PARAM_SPEC_INT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecInt64Class :
      G_OBJECT_PARAM_SPEC_INT_64_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecLongClass :
      G_OBJECT_PARAM_SPEC_LONG_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecObjectClass :
      G_OBJECT_PARAM_SPEC_OBJECT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecOverrideClass :
      G_OBJECT_PARAM_SPEC_OVERRIDE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecParamClass :
      G_OBJECT_PARAM_SPEC_PARAM_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecPointerClass :
      G_OBJECT_PARAM_SPEC_POINTER_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecStringClass :
      G_OBJECT_PARAM_SPEC_STRING_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecUCharClass :
      G_OBJECT_PARAM_SPEC_U_CHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecUIntClass :
      G_OBJECT_PARAM_SPEC_U_INT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecUInt64Class :
      G_OBJECT_PARAM_SPEC_U_INT_64_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecULongClass :
      G_OBJECT_PARAM_SPEC_U_LONG_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecUnicharClass :
      G_OBJECT_PARAM_SPEC_UNICHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecValueArrayClass :
      G_OBJECT_PARAM_SPEC_VALUE_ARRAY_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure ParamSpecVariantClass :
      G_OBJECT_PARAM_SPEC_VARIANT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure TypeModuleClass :
      G_OBJECT_TYPE_MODULE_CLASS
        where type 'a object_class = 'a ObjectClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure TypePluginClass :
      G_OBJECT_TYPE_PLUGIN_CLASS
        where type 'a object_class = 'a ObjectClass.class
        where type ('a, 'b) value_accessor_t = ('a, 'b) value_accessor_t
    structure Binding :
      G_OBJECT_BINDING
        where type 'a class = 'a BindingClass.class
        where type type_t = Type.t
        where type binding_flags_t = BindingFlags.t
        where type 'a object_class = 'a ObjectClass.class
        where type 'object_class property_t = 'object_class property_t
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
        where type enum_value_t = EnumValueRecord.t
        where type type_t = Type.t
        where type flags_value_t = FlagsValueRecord.t
    structure TypePlugin :
      G_OBJECT_TYPE_PLUGIN
        where type 'a class = 'a TypePluginClass.class
        where type type_t = Type.t
    structure Object :
      G_OBJECT_OBJECT
        where type 'a class = 'a ObjectClass.class
        where type type_t = Type.t
        where type 'a binding_class = 'a BindingClass.class
        where type binding_flags_t = BindingFlags.t
        where type value_t = ValueRecord.t
        where type closure_t = ClosureRecord.t
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type 'a signal_t = 'a signal_t
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
    val VALUE_COLLECT_FORMAT_MAX_LENGTH : LargeInt.int
    val VALUE_NOCOPY_CONTENTS : LargeInt.int
    val enumGetValue : EnumClassRecord.t * LargeInt.int -> EnumValueRecord.t
    val enumGetValueByName : EnumClassRecord.t * string -> EnumValueRecord.t
    val enumGetValueByNick : EnumClassRecord.t * string -> EnumValueRecord.t
    val enumRegisterStatic : string * EnumValueRecord.t -> Type.t
    val flagsGetFirstValue : FlagsClassRecord.t * LargeInt.int -> FlagsValueRecord.t
    val flagsGetValueByName : FlagsClassRecord.t * string -> FlagsValueRecord.t
    val flagsGetValueByNick : FlagsClassRecord.t * string -> FlagsValueRecord.t
    val flagsRegisterStatic : string * FlagsValueRecord.t -> Type.t
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
    val pointerTypeRegisterStatic : string -> Type.t
    val signalListIds : Type.t -> LargeInt.int vector
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
    val typeAddClassPrivate : Type.t * LargeInt.int -> unit
    val typeAddInstancePrivate : Type.t * LargeInt.int -> LargeInt.int
    val typeAddInterfaceDynamic :
      Type.t
       * Type.t
       * 'a TypePluginClass.class
       -> unit
    val typeCheckIsValueType : Type.t -> bool
    val typeCheckValueHolds : ValueRecord.t * Type.t -> bool
    val typeChildren : Type.t -> Type.t vector
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
    val typeInterfaces : Type.t -> Type.t vector
    val typeIsA : Type.t * Type.t -> bool
    val typeName : Type.t -> string
    val typeNextBase : Type.t * Type.t -> Type.t
    val typeParent : Type.t -> Type.t
    val typeQname : Type.t -> GLib.Quark.t
    val typeQuery : Type.t -> TypeQueryRecord.t
    val typeRegisterDynamic :
      Type.t
       * string
       * 'a TypePluginClass.class
       * TypeFlags.t
       -> Type.t
    val typeTestFlags : Type.t * LargeInt.int -> bool
  end
