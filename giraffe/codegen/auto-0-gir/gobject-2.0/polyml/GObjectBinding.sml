structure GObjectBinding :>
  G_OBJECT_BINDING
    where type 'a class = 'a GObjectBindingClass.class
    where type type_t = GObjectType.t
    where type binding_flags_t = GObjectBindingFlags.t
    where type 'a object_class = 'a GObjectObjectClass.class
    where type ('object_class, 'get, 'set, 'init) property_t = ('object_class, 'get, 'set, 'init) Property.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_binding_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getFlags_ = call (getSymbol "g_binding_get_flags") (GObjectBindingClass.PolyML.cPtr --> GObjectBindingFlags.PolyML.cVal)
      val getSource_ = call (getSymbol "g_binding_get_source") (GObjectBindingClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSourceProperty_ = call (getSymbol "g_binding_get_source_property") (GObjectBindingClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTarget_ = call (getSymbol "g_binding_get_target") (GObjectBindingClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getTargetProperty_ = call (getSymbol "g_binding_get_target_property") (GObjectBindingClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unbind_ = call (getSymbol "g_binding_unbind") (GObjectBindingClass.PolyML.cPtr --> cVoid)
    end
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
