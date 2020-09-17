structure GObjectObject :>
  G_OBJECT_OBJECT
    where type 'a class = 'a GObjectObjectClass.class
    where type type_t = GObjectType.t
    where type 'a binding_class = 'a GObjectBindingClass.class
    where type binding_flags_t = GObjectBindingFlags.t
    where type value_t = GObjectValueRecord.t
    where type closure_t = GObjectClosureRecord.t
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class
    where type 'a signal_t = 'a Signal.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_object_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val bindProperty_ =
        call (getSymbol "g_object_bind_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectBindingFlags.PolyML.cVal
             --> GObjectBindingClass.PolyML.cPtr
          )
      val bindPropertyFull_ =
        call (getSymbol "g_object_bind_property_with_closures")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectBindingFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cPtr
             &&> GObjectClosureRecord.PolyML.cPtr
             --> GObjectBindingClass.PolyML.cPtr
          )
      val freezeNotify_ = call (getSymbol "g_object_freeze_notify") (GObjectObjectClass.PolyML.cPtr --> cVoid)
      val getProperty_ =
        call (getSymbol "g_object_get_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val notify_ = call (getSymbol "g_object_notify") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val notifyByPspec_ = call (getSymbol "g_object_notify_by_pspec") (GObjectObjectClass.PolyML.cPtr &&> GObjectParamSpecClass.PolyML.cPtr --> cVoid)
      val runDispose_ = call (getSymbol "g_object_run_dispose") (GObjectObjectClass.PolyML.cPtr --> cVoid)
      val setProperty_ =
        call (getSymbol "g_object_set_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val thawNotify_ = call (getSymbol "g_object_thaw_notify") (GObjectObjectClass.PolyML.cPtr --> cVoid)
      val watchClosure_ = call (getSymbol "g_object_watch_closure") (GObjectObjectClass.PolyML.cPtr &&> GObjectClosureRecord.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GObjectObjectClass.class
    type type_t = GObjectType.t
    type 'a binding_class = 'a GObjectBindingClass.class
    type binding_flags_t = GObjectBindingFlags.t
    type value_t = GObjectValueRecord.t
    type closure_t = GObjectClosureRecord.t
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    type 'a signal_t = 'a Signal.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun bindProperty
      self
      (
        sourceProperty,
        target,
        targetProperty,
        flags
      ) =
      (
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectBindingFlags.FFI.withVal
         ---> GObjectBindingClass.FFI.fromPtr false
      )
        bindProperty_
        (
          self
           & sourceProperty
           & target
           & targetProperty
           & flags
        )
       before GObjectObjectClass.FFI.touchPtr self
       before Utf8.FFI.touchPtr sourceProperty
       before GObjectObjectClass.FFI.touchPtr target
       before Utf8.FFI.touchPtr targetProperty
    fun bindPropertyFull
      self
      (
        sourceProperty,
        target,
        targetProperty,
        flags,
        transformTo,
        transformFrom
      ) =
      (
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectBindingFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withPtr false
         &&&> GObjectClosureRecord.FFI.withPtr false
         ---> GObjectBindingClass.FFI.fromPtr false
      )
        bindPropertyFull_
        (
          self
           & sourceProperty
           & target
           & targetProperty
           & flags
           & transformTo
           & transformFrom
        )
       before GObjectObjectClass.FFI.touchPtr self
       before Utf8.FFI.touchPtr sourceProperty
       before GObjectObjectClass.FFI.touchPtr target
       before Utf8.FFI.touchPtr targetProperty
       before GObjectClosureRecord.FFI.touchPtr transformTo
       before GObjectClosureRecord.FFI.touchPtr transformFrom
    fun freezeNotify self = (GObjectObjectClass.FFI.withPtr false ---> I) freezeNotify_ self
    fun getProperty self (propertyName, value) =
      (
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        getProperty_
        (
          self
           & propertyName
           & value
        )
    fun notify self propertyName = (GObjectObjectClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) notify_ (self & propertyName)
    fun notifyByPspec self pspec = (GObjectObjectClass.FFI.withPtr false &&&> GObjectParamSpecClass.FFI.withPtr false ---> I) notifyByPspec_ (self & pspec)
    fun runDispose self = (GObjectObjectClass.FFI.withPtr false ---> I) runDispose_ self
    fun setProperty self (propertyName, value) =
      (
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )
    fun thawNotify self = (GObjectObjectClass.FFI.withPtr false ---> I) thawNotify_ self
    fun watchClosure self closure = (GObjectObjectClass.FFI.withPtr false &&&> GObjectClosureRecord.FFI.withPtr false ---> I) watchClosure_ (self & closure)
    local
      open ClosureMarshal Signal
    in
      fun notifySig f = signal "notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void) f
    end
  end
