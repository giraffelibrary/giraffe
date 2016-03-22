structure GObjectTypeModule :>
  G_OBJECT_TYPE_MODULE
    where type 'a class = 'a GObjectTypeModuleClass.class
    where type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_type_module_get_type" : unit -> GObjectType.C.val_;
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_type_module_set_name" :
              GObjectTypeModuleClass.C.notnull GObjectTypeModuleClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unuse_ = _import "g_type_module_unuse" : GObjectTypeModuleClass.C.notnull GObjectTypeModuleClass.C.p -> unit;
    val use_ = _import "g_type_module_use" : GObjectTypeModuleClass.C.notnull GObjectTypeModuleClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GObjectTypeModuleClass.class
    type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    type type_t = GObjectType.t
    type t = base class
    fun asTypePlugin self = (GObjectObjectClass.C.withPtr ---> GObjectTypePluginClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun setName self name = (GObjectTypeModuleClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun unuse self = (GObjectTypeModuleClass.C.withPtr ---> I) unuse_ self
    fun use self = (GObjectTypeModuleClass.C.withPtr ---> FFI.Bool.C.fromVal) use_ self
  end
