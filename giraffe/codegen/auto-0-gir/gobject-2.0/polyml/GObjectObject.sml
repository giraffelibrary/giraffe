structure GObjectObject :>
  G_OBJECT_OBJECT
    where type 'a class = 'a GObjectObjectClass.class
    where type type_t = GObjectType.t
    where type value_t = GObjectValueRecord.t
    where type closure_t = GObjectClosureRecord.t
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_object_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val forceFloating_ = call (getSymbol "g_object_force_floating") (GObjectObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val freezeNotify_ = call (getSymbol "g_object_freeze_notify") (GObjectObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getProperty_ =
        call (getSymbol "g_object_get_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val isFloating_ = call (getSymbol "g_object_is_floating") (GObjectObjectClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val notify_ = call (getSymbol "g_object_notify") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val notifyByPspec_ = call (getSymbol "g_object_notify_by_pspec") (GObjectObjectClass.PolyML.cPtr &&> GObjectParamSpecClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val runDispose_ = call (getSymbol "g_object_run_dispose") (GObjectObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setProperty_ =
        call (getSymbol "g_object_set_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val thawNotify_ = call (getSymbol "g_object_thaw_notify") (GObjectObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val watchClosure_ = call (getSymbol "g_object_watch_closure") (GObjectObjectClass.PolyML.cPtr &&> GObjectClosureRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GObjectObjectClass.class
    type type_t = GObjectType.t
    type value_t = GObjectValueRecord.t
    type closure_t = GObjectClosureRecord.t
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forceFloating self = (GObjectObjectClass.FFI.withPtr ---> I) forceFloating_ self
    fun freezeNotify self = (GObjectObjectClass.FFI.withPtr ---> I) freezeNotify_ self
    fun getProperty self propertyName value =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        getProperty_
        (
          self
           & propertyName
           & value
        )
    fun isFloating self = (GObjectObjectClass.FFI.withPtr ---> GBool.FFI.fromVal) isFloating_ self
    fun notify self propertyName = (GObjectObjectClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) notify_ (self & propertyName)
    fun notifyByPspec self pspec = (GObjectObjectClass.FFI.withPtr &&&> GObjectParamSpecClass.FFI.withPtr ---> I) notifyByPspec_ (self & pspec)
    fun runDispose self = (GObjectObjectClass.FFI.withPtr ---> I) runDispose_ self
    fun setProperty self propertyName value =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )
    fun thawNotify self = (GObjectObjectClass.FFI.withPtr ---> I) thawNotify_ self
    fun watchClosure self closure = (GObjectObjectClass.FFI.withPtr &&&> GObjectClosureRecord.FFI.withPtr ---> I) watchClosure_ (self & closure)
    local
      open ClosureMarshal Signal
    in
      fun notifySig f = signal "notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void) f
    end
  end
