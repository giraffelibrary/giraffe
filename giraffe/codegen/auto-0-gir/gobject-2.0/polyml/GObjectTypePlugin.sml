structure GObjectTypePlugin :>
  G_OBJECT_TYPE_PLUGIN
    where type 'a class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_type_plugin_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val unuse_ = call (load_sym libgobject "g_type_plugin_unuse") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val use_ = call (load_sym libgobject "g_type_plugin_use") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GObjectTypePluginClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun unuse self = (GObjectObjectClass.C.withPtr ---> I) unuse_ self
    fun use self = (GObjectObjectClass.C.withPtr ---> I) use_ self
  end
