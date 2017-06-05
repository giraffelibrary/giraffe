structure GObjectTypePlugin :>
  G_OBJECT_TYPE_PLUGIN
    where type 'a class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_type_plugin_get_type" : unit -> GObjectType.FFI.val_;
    val unuse_ = _import "g_type_plugin_unuse" : GObjectTypePluginClass.FFI.notnull GObjectTypePluginClass.FFI.p -> unit;
    val use_ = _import "g_type_plugin_use" : GObjectTypePluginClass.FFI.notnull GObjectTypePluginClass.FFI.p -> unit;
    type 'a class = 'a GObjectTypePluginClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun unuse self = (GObjectTypePluginClass.FFI.withPtr ---> I) unuse_ self
    fun use self = (GObjectTypePluginClass.FFI.withPtr ---> I) use_ self
  end
