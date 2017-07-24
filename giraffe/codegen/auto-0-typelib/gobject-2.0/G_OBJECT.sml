signature G_OBJECT =
  sig
    type ('object, 'a) property_readonly
    type ('object, 'a) property_writeonly
    type ('object, 'a, 'b) property_readwrite
    structure Type : G_OBJECT_TYPE
    structure ValueRecord : G_OBJECT_VALUE_RECORD
    structure ConnectFlags : G_OBJECT_CONNECT_FLAGS
    structure ParamFlags : G_OBJECT_PARAM_FLAGS
    structure SignalFlags : G_OBJECT_SIGNAL_FLAGS
    structure SignalMatchType : G_OBJECT_SIGNAL_MATCH_TYPE
    structure TypeDebugFlags : G_OBJECT_TYPE_DEBUG_FLAGS
    structure TypeFlags : G_OBJECT_TYPE_FLAGS
    structure TypeFundamentalFlags : G_OBJECT_TYPE_FUNDAMENTAL_FLAGS
    structure Value :
      G_OBJECT_VALUE
        where type record_t = ValueRecord.t
        where type type_t = Type.t
    structure ClosureRecord :
      G_OBJECT_CLOSURE_RECORD
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ObjectClass :
      G_OBJECT_OBJECT_CLASS
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecClass :
      G_OBJECT_PARAM_SPEC_CLASS
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure BindingFlags :
      G_OBJECT_BINDING_FLAGS
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
        where type type_t = Type.t
    structure ValueArrayRecord :
      G_OBJECT_VALUE_ARRAY_RECORD
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure Closure :
      G_OBJECT_CLOSURE
        where type t = ClosureRecord.t
        where type type_t = Type.t
    structure BindingClass :
      G_OBJECT_BINDING_CLASS
        where type 'a object_class = 'a ObjectClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure InitiallyUnownedClass :
      G_OBJECT_INITIALLY_UNOWNED_CLASS
        where type 'a object_class = 'a ObjectClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure Object :
      G_OBJECT_OBJECT
        where type 'a class = 'a ObjectClass.class
        where type type_t = Type.t
        where type value_t = ValueRecord.t
        where type closure_t = ClosureRecord.t
        where type 'a param_spec_class = 'a ParamSpecClass.class
    structure ParamSpec :
      G_OBJECT_PARAM_SPEC
        where type 'a class = 'a ParamSpecClass.class
        where type type_t = Type.t
    structure ParamSpecBooleanClass :
      G_OBJECT_PARAM_SPEC_BOOLEAN_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecBoxedClass :
      G_OBJECT_PARAM_SPEC_BOXED_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecCharClass :
      G_OBJECT_PARAM_SPEC_CHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecDoubleClass :
      G_OBJECT_PARAM_SPEC_DOUBLE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecEnumClass :
      G_OBJECT_PARAM_SPEC_ENUM_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecFlagsClass :
      G_OBJECT_PARAM_SPEC_FLAGS_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecFloatClass :
      G_OBJECT_PARAM_SPEC_FLOAT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecGTypeClass :
      G_OBJECT_PARAM_SPEC_G_TYPE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecIntClass :
      G_OBJECT_PARAM_SPEC_INT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecInt64Class :
      G_OBJECT_PARAM_SPEC_INT_64_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecLongClass :
      G_OBJECT_PARAM_SPEC_LONG_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecObjectClass :
      G_OBJECT_PARAM_SPEC_OBJECT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecOverrideClass :
      G_OBJECT_PARAM_SPEC_OVERRIDE_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecParamClass :
      G_OBJECT_PARAM_SPEC_PARAM_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecPointerClass :
      G_OBJECT_PARAM_SPEC_POINTER_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecStringClass :
      G_OBJECT_PARAM_SPEC_STRING_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecUCharClass :
      G_OBJECT_PARAM_SPEC_U_CHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecUIntClass :
      G_OBJECT_PARAM_SPEC_U_INT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecUInt64Class :
      G_OBJECT_PARAM_SPEC_U_INT_64_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecULongClass :
      G_OBJECT_PARAM_SPEC_U_LONG_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecUnicharClass :
      G_OBJECT_PARAM_SPEC_UNICHAR_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecValueArrayClass :
      G_OBJECT_PARAM_SPEC_VALUE_ARRAY_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ParamSpecVariantClass :
      G_OBJECT_PARAM_SPEC_VARIANT_CLASS
        where type 'a param_spec_class = 'a ParamSpecClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure TypeModuleClass :
      G_OBJECT_TYPE_MODULE_CLASS
        where type 'a object_class = 'a ObjectClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure TypePluginClass :
      G_OBJECT_TYPE_PLUGIN_CLASS
        where type 'a object_class = 'a ObjectClass.class
        where type ('a, 'b) value_accessor = ('a, 'b) Value.accessor
    structure ValueArray :
      G_OBJECT_VALUE_ARRAY
        where type t = ValueArrayRecord.t
        where type type_t = Type.t
        where type value_t = ValueRecord.t
    structure Binding :
      G_OBJECT_BINDING
        where type 'a class = 'a BindingClass.class
        where type type_t = Type.t
        where type binding_flags_t = BindingFlags.t
        where type 'a object_class = 'a ObjectClass.class
        where type ('object, 'a) property_readonly = ('object, 'a) property_readonly
        where type ('object, 'a) property_writeonly = ('object, 'a) property_writeonly
        where type ('object, 'a, 'b) property_readwrite = ('object, 'a, 'b) property_readwrite
    structure InitiallyUnowned :
      G_OBJECT_INITIALLY_UNOWNED
        where type 'a class = 'a InitiallyUnownedClass.class
        where type type_t = Type.t
    structure ParamSpecBoolean :
      G_OBJECT_PARAM_SPEC_BOOLEAN
        where type 'a class = 'a ParamSpecBooleanClass.class
        where type type_t = Type.t
    structure ParamSpecBoxed :
      G_OBJECT_PARAM_SPEC_BOXED
        where type 'a class = 'a ParamSpecBoxedClass.class
        where type type_t = Type.t
    structure ParamSpecChar :
      G_OBJECT_PARAM_SPEC_CHAR
        where type 'a class = 'a ParamSpecCharClass.class
        where type type_t = Type.t
    structure ParamSpecDouble :
      G_OBJECT_PARAM_SPEC_DOUBLE
        where type 'a class = 'a ParamSpecDoubleClass.class
        where type type_t = Type.t
    structure ParamSpecEnum :
      G_OBJECT_PARAM_SPEC_ENUM
        where type 'a class = 'a ParamSpecEnumClass.class
        where type type_t = Type.t
    structure ParamSpecFlags :
      G_OBJECT_PARAM_SPEC_FLAGS
        where type 'a class = 'a ParamSpecFlagsClass.class
        where type type_t = Type.t
    structure ParamSpecFloat :
      G_OBJECT_PARAM_SPEC_FLOAT
        where type 'a class = 'a ParamSpecFloatClass.class
        where type type_t = Type.t
    structure ParamSpecGType :
      G_OBJECT_PARAM_SPEC_G_TYPE
        where type 'a class = 'a ParamSpecGTypeClass.class
        where type type_t = Type.t
    structure ParamSpecInt :
      G_OBJECT_PARAM_SPEC_INT
        where type 'a class = 'a ParamSpecIntClass.class
        where type type_t = Type.t
    structure ParamSpecInt64 :
      G_OBJECT_PARAM_SPEC_INT_64
        where type 'a class = 'a ParamSpecInt64Class.class
        where type type_t = Type.t
    structure ParamSpecLong :
      G_OBJECT_PARAM_SPEC_LONG
        where type 'a class = 'a ParamSpecLongClass.class
        where type type_t = Type.t
    structure ParamSpecObject :
      G_OBJECT_PARAM_SPEC_OBJECT
        where type 'a class = 'a ParamSpecObjectClass.class
        where type type_t = Type.t
    structure ParamSpecOverride :
      G_OBJECT_PARAM_SPEC_OVERRIDE
        where type 'a class = 'a ParamSpecOverrideClass.class
        where type type_t = Type.t
    structure ParamSpecParam :
      G_OBJECT_PARAM_SPEC_PARAM
        where type 'a class = 'a ParamSpecParamClass.class
        where type type_t = Type.t
    structure ParamSpecPointer :
      G_OBJECT_PARAM_SPEC_POINTER
        where type 'a class = 'a ParamSpecPointerClass.class
        where type type_t = Type.t
    structure ParamSpecString :
      G_OBJECT_PARAM_SPEC_STRING
        where type 'a class = 'a ParamSpecStringClass.class
        where type type_t = Type.t
    structure ParamSpecUChar :
      G_OBJECT_PARAM_SPEC_U_CHAR
        where type 'a class = 'a ParamSpecUCharClass.class
        where type type_t = Type.t
    structure ParamSpecUInt :
      G_OBJECT_PARAM_SPEC_U_INT
        where type 'a class = 'a ParamSpecUIntClass.class
        where type type_t = Type.t
    structure ParamSpecUInt64 :
      G_OBJECT_PARAM_SPEC_U_INT_64
        where type 'a class = 'a ParamSpecUInt64Class.class
        where type type_t = Type.t
    structure ParamSpecULong :
      G_OBJECT_PARAM_SPEC_U_LONG
        where type 'a class = 'a ParamSpecULongClass.class
        where type type_t = Type.t
    structure ParamSpecUnichar :
      G_OBJECT_PARAM_SPEC_UNICHAR
        where type 'a class = 'a ParamSpecUnicharClass.class
        where type type_t = Type.t
    structure ParamSpecValueArray :
      G_OBJECT_PARAM_SPEC_VALUE_ARRAY
        where type 'a class = 'a ParamSpecValueArrayClass.class
        where type type_t = Type.t
    structure ParamSpecVariant :
      G_OBJECT_PARAM_SPEC_VARIANT
        where type 'a class = 'a ParamSpecVariantClass.class
        where type type_t = Type.t
    structure TypeModule :
      G_OBJECT_TYPE_MODULE
        where type 'a class = 'a TypeModuleClass.class
        where type 'a type_plugin_class = 'a TypePluginClass.class
        where type type_t = Type.t
    structure TypePlugin :
      G_OBJECT_TYPE_PLUGIN
        where type 'a class = 'a TypePluginClass.class
        where type type_t = Type.t
    val PARAM_MASK : LargeInt.int
    val PARAM_READWRITE : LargeInt.int
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
    val typeInit : unit -> unit
    val typeInitWithDebugFlags : TypeDebugFlags.t -> unit
  end
