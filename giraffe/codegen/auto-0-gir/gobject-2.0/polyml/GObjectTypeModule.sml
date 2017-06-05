structure GObjectTypeModule :>
  G_OBJECT_TYPE_MODULE
    where type 'a class = 'a GObjectTypeModuleClass.class
    where type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_type_module_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val setName_ = call (load_sym libgobject "g_type_module_set_name") (GObjectTypeModuleClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val unuse_ = call (load_sym libgobject "g_type_module_unuse") (GObjectTypeModuleClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val use_ = call (load_sym libgobject "g_type_module_use") (GObjectTypeModuleClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GObjectTypeModuleClass.class
    type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    type type_t = GObjectType.t
    type t = base class
    fun asTypePlugin self = (GObjectObjectClass.FFI.withPtr ---> GObjectTypePluginClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun setName self name = (GObjectTypeModuleClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setName_ (self & name)
    fun unuse self = (GObjectTypeModuleClass.FFI.withPtr ---> I) unuse_ self
    fun use self = (GObjectTypeModuleClass.FFI.withPtr ---> GBool.FFI.fromVal) use_ self
  end
