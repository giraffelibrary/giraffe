structure GObjectObject :>
  G_OBJECT_OBJECT
    where type 'a class_t = 'a GObjectObjectClass.t
    where type type_t = GObjectType.t
    where type 'a bindingclass_t = 'a GObjectBindingClass.t
    where type bindingflags_t = GObjectBindingFlags.t
    where type valuerecord_t = GObjectValueRecord.t
    where type closurerecord_t = GObjectClosureRecord.t
    where type 'a paramspecclass_t = 'a GObjectParamSpecClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_object_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val bindProperty_ =
        call (load_sym libgobject "g_object_bind_property")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectBindingFlags.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val bindPropertyFull_ =
        call (load_sym libgobject "g_object_bind_property_with_closures")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectBindingFlags.PolyML.VAL
             &&> GObjectClosureRecord.PolyML.PTR
             &&> GObjectClosureRecord.PolyML.PTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val compatControl_ = call (load_sym libgobject "g_object_compat_control") (FFI.PolyML.Word64.VAL --> FFI.PolyML.Word64.VAL)
      val interfaceFindProperty_ = call (load_sym libgobject "g_object_interface_find_property") (FFI.PolyML.String.INPTR --> GObjectParamSpecClass.PolyML.PTR)
      val interfaceInstallProperty_ = call (load_sym libgobject "g_object_interface_install_property") (GObjectParamSpecClass.PolyML.PTR --> FFI.PolyML.VOID)
      val forceFloating_ = call (load_sym libgobject "g_object_force_floating") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val freezeNotify_ = call (load_sym libgobject "g_object_freeze_notify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getData_ = call (load_sym libgobject "g_object_get_data") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val getProperty_ =
        call (load_sym libgobject "g_object_get_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getQdata_ = call (load_sym libgobject "g_object_get_qdata") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val isFloating_ = call (load_sym libgobject "g_object_is_floating") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val notify_ = call (load_sym libgobject "g_object_notify") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val notifyByPspec_ = call (load_sym libgobject "g_object_notify_by_pspec") (GObjectObjectClass.PolyML.PTR &&> GObjectParamSpecClass.PolyML.PTR --> FFI.PolyML.VOID)
      val runDispose_ = call (load_sym libgobject "g_object_run_dispose") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setData_ = call (load_sym libgobject "g_object_set_data") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setProperty_ =
        call (load_sym libgobject "g_object_set_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val stealData_ = call (load_sym libgobject "g_object_steal_data") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val stealQdata_ = call (load_sym libgobject "g_object_steal_qdata") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val thawNotify_ = call (load_sym libgobject "g_object_thaw_notify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val watchClosure_ = call (load_sym libgobject "g_object_watch_closure") (GObjectObjectClass.PolyML.PTR &&> GObjectClosureRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GObjectObjectClass.t
    type type_t = GObjectType.t
    type 'a bindingclass_t = 'a GObjectBindingClass.t
    type bindingflags_t = GObjectBindingFlags.t
    type valuerecord_t = GObjectValueRecord.t
    type closurerecord_t = GObjectClosureRecord.t
    type 'a paramspecclass_t = 'a GObjectParamSpecClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun bindProperty sourceProperty targetProperty flags =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectBindingFlags.C.withVal
         ---> GObjectBindingClass.C.fromPtr false
      )
        bindProperty_
        (
          sourceProperty
           & targetProperty
           & flags
        )
    fun bindPropertyFull sourceProperty targetProperty flags transformTo transformFrom =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectBindingFlags.C.withVal
         &&&> GObjectClosureRecord.C.withPtr
         &&&> GObjectClosureRecord.C.withPtr
         ---> GObjectBindingClass.C.fromPtr false
      )
        bindPropertyFull_
        (
          sourceProperty
           & targetProperty
           & flags
           & transformTo
           & transformFrom
        )
    fun compatControl what = (FFI.Word64.withVal ---> FFI.Word64.fromVal) compatControl_ what
    fun interfaceFindProperty propertyName = (FFI.String.withConstPtr ---> GObjectParamSpecClass.C.fromPtr false) interfaceFindProperty_ propertyName
    fun interfaceInstallProperty pspec = (GObjectParamSpecClass.C.withPtr ---> I) interfaceInstallProperty_ pspec
    fun forceFloating self = (GObjectObjectClass.C.withPtr ---> I) forceFloating_ self
    fun freezeNotify self = (GObjectObjectClass.C.withPtr ---> I) freezeNotify_ self
    fun getData self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) getData_ (self & key)
    fun getProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        getProperty_
        (
          self
           & propertyName
           & value
        )
    fun getQdata self quark = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) getQdata_ (self & quark)
    fun isFloating self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isFloating_ self
    fun notify self propertyName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) notify_ (self & propertyName)
    fun notifyByPspec self pspec = (GObjectObjectClass.C.withPtr &&&> GObjectParamSpecClass.C.withPtr ---> I) notifyByPspec_ (self & pspec)
    fun runDispose self = (GObjectObjectClass.C.withPtr ---> I) runDispose_ self
    fun setData self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setData_ (self & key)
    fun setProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )
    fun stealData self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) stealData_ (self & key)
    fun stealQdata self quark = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) stealQdata_ (self & quark)
    fun thawNotify self = (GObjectObjectClass.C.withPtr ---> I) thawNotify_ self
    fun watchClosure self closure = (GObjectObjectClass.C.withPtr &&&> GObjectClosureRecord.C.withPtr ---> I) watchClosure_ (self & closure)
    local
      open ClosureMarshal Signal
    in
      fun notifySig f = signal "notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void) f
    end
  end
