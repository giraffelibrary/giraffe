structure GObjectTypeModule :>
  G_OBJECT_TYPE_MODULE
    where type 'a class = 'a GObjectTypeModuleClass.class
    where type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    where type enum_value_t = GObjectEnumValueRecord.t
    where type type_t = GObjectType.t
    where type flags_value_t = GObjectFlagsValueRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_type_module_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val registerEnum_ =
        call (getSymbol "g_type_module_register_enum")
          (
            GObjectTypeModuleClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectEnumValueRecord.PolyML.cPtr
             --> GObjectType.PolyML.cVal
          )
      val registerFlags_ =
        call (getSymbol "g_type_module_register_flags")
          (
            GObjectTypeModuleClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectFlagsValueRecord.PolyML.cPtr
             --> GObjectType.PolyML.cVal
          )
      val setName_ = call (getSymbol "g_type_module_set_name") (GObjectTypeModuleClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val unuse_ = call (getSymbol "g_type_module_unuse") (GObjectTypeModuleClass.PolyML.cPtr --> cVoid)
      val use_ = call (getSymbol "g_type_module_use") (GObjectTypeModuleClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GObjectTypeModuleClass.class
    type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    type enum_value_t = GObjectEnumValueRecord.t
    type type_t = GObjectType.t
    type flags_value_t = GObjectFlagsValueRecord.t
    type t = base class
    fun asTypePlugin self = (GObjectObjectClass.FFI.withPtr false ---> GObjectTypePluginClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun registerEnum self (name, constStaticValues) =
      (
        GObjectTypeModuleClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectEnumValueRecord.FFI.withPtr false
         ---> GObjectType.FFI.fromVal
      )
        registerEnum_
        (
          self
           & name
           & constStaticValues
        )
    fun registerFlags self (name, constStaticValues) =
      (
        GObjectTypeModuleClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectFlagsValueRecord.FFI.withPtr false
         ---> GObjectType.FFI.fromVal
      )
        registerFlags_
        (
          self
           & name
           & constStaticValues
        )
    fun setName self name = (GObjectTypeModuleClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
    fun unuse self = (GObjectTypeModuleClass.FFI.withPtr false ---> I) unuse_ self
    fun use self = (GObjectTypeModuleClass.FFI.withPtr false ---> GBool.FFI.fromVal) use_ self
  end
