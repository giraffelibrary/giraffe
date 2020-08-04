structure GObjectTypeModule :>
  G_OBJECT_TYPE_MODULE
    where type 'a class = 'a GObjectTypeModuleClass.class
    where type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    where type enum_value_t = GObjectEnumValueRecord.t
    where type type_t = GObjectType.t
    where type flags_value_t = GObjectFlagsValueRecord.t =
  struct
    val getType_ = _import "g_type_module_get_type" : unit -> GObjectType.FFI.val_;
    val registerEnum_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_type_module_register_enum" :
              GObjectTypeModuleClass.FFI.non_opt GObjectTypeModuleClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectEnumValueRecord.FFI.non_opt GObjectEnumValueRecord.FFI.p
               -> GObjectType.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val registerFlags_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_type_module_register_flags" :
              GObjectTypeModuleClass.FFI.non_opt GObjectTypeModuleClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectFlagsValueRecord.FFI.non_opt GObjectFlagsValueRecord.FFI.p
               -> GObjectType.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_type_module_set_name" :
              GObjectTypeModuleClass.FFI.non_opt GObjectTypeModuleClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unuse_ = _import "g_type_module_unuse" : GObjectTypeModuleClass.FFI.non_opt GObjectTypeModuleClass.FFI.p -> unit;
    val use_ = _import "g_type_module_use" : GObjectTypeModuleClass.FFI.non_opt GObjectTypeModuleClass.FFI.p -> GBool.FFI.val_;
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
