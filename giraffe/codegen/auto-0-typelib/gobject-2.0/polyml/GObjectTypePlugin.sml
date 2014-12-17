structure GObjectTypePlugin :>
  G_OBJECT_TYPE_PLUGIN
    where type 'a class_t = 'a GObjectTypePluginClass.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_type_plugin_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val unuse_ = call (load_sym libgobject "g_type_plugin_unuse") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val use_ = call (load_sym libgobject "g_type_plugin_use") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GObjectTypePluginClass.t
    type type_t = GObjectType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun unuse self = (GObjectObjectClass.C.withPtr ---> I) unuse_ self
    fun use self = (GObjectObjectClass.C.withPtr ---> I) use_ self
  end
