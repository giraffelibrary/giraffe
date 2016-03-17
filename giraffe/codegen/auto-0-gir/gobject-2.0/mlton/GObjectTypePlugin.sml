structure GObjectTypePlugin :>
  G_OBJECT_TYPE_PLUGIN
    where type 'a class = 'a GObjectTypePluginClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_type_plugin_get_type" : unit -> GObjectType.C.val_;
    val unuse_ = _import "g_type_plugin_unuse" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val use_ = _import "g_type_plugin_use" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class = 'a GObjectTypePluginClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun unuse self = (GObjectObjectClass.C.withPtr ---> I) unuse_ self
    fun use self = (GObjectObjectClass.C.withPtr ---> I) use_ self
  end
