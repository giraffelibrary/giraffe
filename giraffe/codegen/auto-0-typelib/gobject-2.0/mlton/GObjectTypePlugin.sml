structure GObjectTypePlugin :>
  G_OBJECT_TYPE_PLUGIN
    where type 'a class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_type_plugin_get_type" : unit -> GObjectType.C.val_;
    val unuse_ = _import "g_type_plugin_unuse" : GObjectTypePluginClass.C.notnull GObjectTypePluginClass.C.p -> unit;
    val use_ = _import "g_type_plugin_use" : GObjectTypePluginClass.C.notnull GObjectTypePluginClass.C.p -> unit;
    type 'a class = 'a GObjectTypePluginClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun unuse self = (GObjectTypePluginClass.C.withPtr ---> I) unuse_ self
    fun use self = (GObjectTypePluginClass.C.withPtr ---> I) use_ self
  end
