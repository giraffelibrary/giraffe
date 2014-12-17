structure GObjectTypeModule :>
  G_OBJECT_TYPE_MODULE
    where type 'a class_t = 'a GObjectTypeModuleClass.t
    where type 'a typepluginclass_t = 'a GObjectTypePluginClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_type_module_get_type" : unit -> GObjectType.C.val_;
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_type_module_set_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unuse_ = _import "g_type_module_unuse" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val use_ = _import "g_type_module_use" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a GObjectTypeModuleClass.t
    type 'a typepluginclass_t = 'a GObjectTypePluginClass.t
    type type_t = GObjectType.t
    type t = base class_t
    fun asTypePlugin self = (GObjectObjectClass.C.withPtr ---> GObjectTypePluginClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setName_ (self & name)
    fun unuse self = (GObjectObjectClass.C.withPtr ---> I) unuse_ self
    fun use self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) use_ self
  end
