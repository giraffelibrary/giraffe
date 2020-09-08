structure GObjectBinding :>
  G_OBJECT_BINDING
    where type 'a class = 'a GObjectBindingClass.class
    where type type_t = GObjectType.t
    where type binding_flags_t = GObjectBindingFlags.t
    where type 'a object_class = 'a GObjectObjectClass.class
    where type ('object_class, 'get, 'set, 'init) property_t = ('object_class, 'get, 'set, 'init) Property.t =
  struct
    val getType_ = _import "g_binding_get_type" : unit -> GObjectType.FFI.val_;
    val getFlags_ = _import "g_binding_get_flags" : GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p -> GObjectBindingFlags.FFI.val_;
    val getSource_ = _import "g_binding_get_source" : GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p -> GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p;
    val getSourceProperty_ = _import "g_binding_get_source_property" : GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getTarget_ = _import "g_binding_get_target" : GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p -> GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p;
    val getTargetProperty_ = _import "g_binding_get_target_property" : GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val unbind_ = _import "g_binding_unbind" : GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p -> unit;
    type 'a class = 'a GObjectBindingClass.class
    type type_t = GObjectType.t
    type binding_flags_t = GObjectBindingFlags.t
    type 'a object_class = 'a GObjectObjectClass.class
    type ('object_class, 'get, 'set, 'init) property_t = ('object_class, 'get, 'set, 'init) Property.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFlags self = (GObjectBindingClass.FFI.withPtr false ---> GObjectBindingFlags.FFI.fromVal) getFlags_ self
    fun getSource self = (GObjectBindingClass.FFI.withPtr false ---> GObjectObjectClass.FFI.fromPtr false) getSource_ self
    fun getSourceProperty self = (GObjectBindingClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getSourceProperty_ self
    fun getTarget self = (GObjectBindingClass.FFI.withPtr false ---> GObjectObjectClass.FFI.fromPtr false) getTarget_ self
    fun getTargetProperty self = (GObjectBindingClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTargetProperty_ self
    fun unbind self = (GObjectBindingClass.FFI.withPtr false ---> I) unbind_ self
    local
      open ValueAccessor
    in
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GObjectBindingFlags.t (),
          get = fn x => fn () => C.get GObjectBindingFlags.t x,
          set = ignore,
          init = fn x => C.set GObjectBindingFlags.t x
        }
      val sourceProp =
        {
          name = "source",
          gtype = fn () => C.gtype GObjectObjectClass.tOpt (),
          get = fn x => fn () => C.get GObjectObjectClass.tOpt x,
          set = ignore,
          init = fn x => C.set GObjectObjectClass.tOpt x
        }
      val sourcePropertyProp =
        {
          name = "source-property",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val targetProp =
        {
          name = "target",
          gtype = fn () => C.gtype GObjectObjectClass.tOpt (),
          get = fn x => fn () => C.get GObjectObjectClass.tOpt x,
          set = ignore,
          init = fn x => C.set GObjectObjectClass.tOpt x
        }
      val targetPropertyProp =
        {
          name = "target-property",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
