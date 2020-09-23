structure GObjectTypeModule :>
  G_OBJECT_TYPE_MODULE
    where type 'a class = 'a GObjectTypeModuleClass.class
    where type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_type_module_get_type" : unit -> GObjectType.FFI.val_;
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
    type type_t = GObjectType.t
    type t = base class
    fun asTypePlugin self = (GObjectObjectClass.FFI.withPtr false ---> GObjectTypePluginClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun setName self name = (GObjectTypeModuleClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
    fun unuse self = (GObjectTypeModuleClass.FFI.withPtr false ---> I) unuse_ self
    fun use self = (GObjectTypeModuleClass.FFI.withPtr false ---> GBool.FFI.fromVal) use_ self
  end
