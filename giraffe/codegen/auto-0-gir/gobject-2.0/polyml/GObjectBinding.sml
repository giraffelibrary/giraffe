structure GObjectBinding :>
  G_OBJECT_BINDING
    where type 'a class = 'a GObjectBindingClass.class
    where type type_t = GObjectType.t
    where type binding_flags_t = GObjectBindingFlags.t
    where type 'a object_class = 'a GObjectObjectClass.class
    where type ('object, 'a) property_readonly = ('object, 'a) Property.readonly
    where type ('object, 'a) property_writeonly = ('object, 'a) Property.writeonly
    where type ('object, 'a, 'b) property_readwrite = ('object, 'a, 'b) Property.readwrite =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_binding_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getFlags_ = call (getSymbol "g_binding_get_flags") (GObjectBindingClass.PolyML.cPtr --> GObjectBindingFlags.PolyML.cVal)
      val getSource_ = call (getSymbol "g_binding_get_source") (GObjectBindingClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSourceProperty_ = call (getSymbol "g_binding_get_source_property") (GObjectBindingClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTarget_ = call (getSymbol "g_binding_get_target") (GObjectBindingClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getTargetProperty_ = call (getSymbol "g_binding_get_target_property") (GObjectBindingClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GObjectBindingClass.class
    type type_t = GObjectType.t
    type binding_flags_t = GObjectBindingFlags.t
    type 'a object_class = 'a GObjectObjectClass.class
    type t = base class
    type ('object, 'a) property_readonly = ('object, 'a) Property.readonly
    type ('object, 'a) property_writeonly = ('object, 'a) Property.writeonly
    type ('object, 'a, 'b) property_readwrite = ('object, 'a, 'b) Property.readwrite
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFlags self = (GObjectBindingClass.FFI.withPtr ---> GObjectBindingFlags.FFI.fromVal) getFlags_ self
    fun getSource self = (GObjectBindingClass.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getSource_ self
    fun getSourceProperty self = (GObjectBindingClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSourceProperty_ self
    fun getTarget self = (GObjectBindingClass.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getTarget_ self
    fun getTargetProperty self = (GObjectBindingClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTargetProperty_ self
    local
      open Property
    in
      val flagsProp =
        {
          get = fn x => get "flags" GObjectBindingFlags.t x,
          set = fn x => set "flags" GObjectBindingFlags.t x
        }
      val sourceProp =
        {
          get = fn x => get "source" GObjectObjectClass.tOpt x,
          set = fn x => set "source" GObjectObjectClass.tOpt x
        }
      val sourcePropertyProp =
        {
          get = fn x => get "source-property" stringOpt x,
          set = fn x => set "source-property" stringOpt x
        }
      val targetProp =
        {
          get = fn x => get "target" GObjectObjectClass.tOpt x,
          set = fn x => set "target" GObjectObjectClass.tOpt x
        }
      val targetPropertyProp =
        {
          get = fn x => get "target-property" stringOpt x,
          set = fn x => set "target-property" stringOpt x
        }
    end
  end
