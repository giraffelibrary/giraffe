structure GObjectTypeModule :>
  G_OBJECT_TYPE_MODULE
    where type 'a class = 'a GObjectTypeModuleClass.class
    where type 'a type_plugin_class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_type_module_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val setName_ = call (load_sym libgobject "g_type_module_set_name") (GObjectTypeModuleClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val unuse_ = call (load_sym libgobject "g_type_module_unuse") (GObjectTypeModuleClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val use_ = call (load_sym libgobject "g_type_module_use") (GObjectTypeModuleClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
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
