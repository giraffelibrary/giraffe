structure GObjectBinding :>
  G_OBJECT_BINDING
    where type 'a class_t = 'a GObjectBindingClass.t
    where type type_t = GObjectType.t
    where type bindingflags_t = GObjectBindingFlags.t
    where type 'a objectclass_t = 'a GObjectObjectClass.t
    where type ('object, 'a) property_readonly = ('object, 'a) Property.readonly
    where type ('object, 'a) property_writeonly = ('object, 'a) Property.writeonly
    where type ('object, 'a, 'b) property_readwrite = ('object, 'a, 'b) Property.readwrite =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_binding_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getFlags_ = call (load_sym libgobject "g_binding_get_flags") (GObjectObjectClass.PolyML.PTR --> GObjectBindingFlags.PolyML.VAL)
      val getSource_ = call (load_sym libgobject "g_binding_get_source") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSourceProperty_ = call (load_sym libgobject "g_binding_get_source_property") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getTarget_ = call (load_sym libgobject "g_binding_get_target") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getTargetProperty_ = call (load_sym libgobject "g_binding_get_target_property") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end
    type 'a class_t = 'a GObjectBindingClass.t
    type type_t = GObjectType.t
    type bindingflags_t = GObjectBindingFlags.t
    type 'a objectclass_t = 'a GObjectObjectClass.t
    type ('object, 'a) property_readonly = ('object, 'a) Property.readonly
    type ('object, 'a) property_writeonly = ('object, 'a) Property.writeonly
    type ('object, 'a, 'b) property_readwrite = ('object, 'a, 'b) Property.readwrite
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GObjectBindingFlags.C.fromVal) getFlags_ self
    fun getSource self = (GObjectObjectClass.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getSource_ self
    fun getSourceProperty self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getSourceProperty_ self
    fun getTarget self = (GObjectObjectClass.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getTarget_ self
    fun getTargetProperty self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTargetProperty_ self
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
