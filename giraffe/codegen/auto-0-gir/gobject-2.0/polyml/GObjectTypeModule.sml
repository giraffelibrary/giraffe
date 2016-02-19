structure GObjectTypeModule :>
  G_OBJECT_TYPE_MODULE
    where type 'a class_t = 'a GObjectTypeModuleClass.t
    where type 'a type_plugin_class_t = 'a GObjectTypePluginClass.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_type_module_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val setName_ = call (load_sym libgobject "g_type_module_set_name") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val unuse_ = call (load_sym libgobject "g_type_module_unuse") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val use_ = call (load_sym libgobject "g_type_module_use") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GObjectTypeModuleClass.t
    type 'a type_plugin_class_t = 'a GObjectTypePluginClass.t
    type type_t = GObjectType.t
    type t = base class_t
    fun asTypePlugin self = (GObjectObjectClass.C.withPtr ---> GObjectTypePluginClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun unuse self = (GObjectObjectClass.C.withPtr ---> I) unuse_ self
    fun use self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) use_ self
  end
