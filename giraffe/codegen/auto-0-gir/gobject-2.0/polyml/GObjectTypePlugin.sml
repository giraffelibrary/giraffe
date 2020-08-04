structure GObjectTypePlugin :>
  G_OBJECT_TYPE_PLUGIN
    where type 'a class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_type_plugin_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val unuse_ = call (getSymbol "g_type_plugin_unuse") (GObjectTypePluginClass.PolyML.cPtr --> cVoid)
      val use_ = call (getSymbol "g_type_plugin_use") (GObjectTypePluginClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GObjectTypePluginClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun unuse self = (GObjectTypePluginClass.FFI.withPtr false ---> I) unuse_ self
    fun use self = (GObjectTypePluginClass.FFI.withPtr false ---> I) use_ self
  end
