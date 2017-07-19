structure GObjectObject :>
  G_OBJECT_OBJECT
    where type 'a class = 'a GObjectObjectClass.class
    where type type_t = GObjectType.t
    where type value_t = GObjectValueRecord.t
    where type closure_t = GObjectClosureRecord.t
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class =
  struct
    val getType_ = _import "g_object_get_type" : unit -> GObjectType.FFI.val_;
    val forceFloating_ = _import "g_object_force_floating" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> unit;
    val freezeNotify_ = _import "g_object_freeze_notify" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> unit;
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_get_property" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isFloating_ = _import "g_object_is_floating" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> GBool.FFI.val_;
    val notify_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_notify" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val notifyByPspec_ = fn x1 & x2 => (_import "g_object_notify_by_pspec" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p * GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p -> unit;) (x1, x2)
    val runDispose_ = _import "g_object_run_dispose" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> unit;
    val setProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_set_property" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val thawNotify_ = _import "g_object_thaw_notify" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> unit;
    val watchClosure_ = fn x1 & x2 => (_import "g_object_watch_closure" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p * GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GObjectObjectClass.class
    type type_t = GObjectType.t
    type value_t = GObjectValueRecord.t
    type closure_t = GObjectClosureRecord.t
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forceFloating self = (GObjectObjectClass.FFI.withPtr ---> I) forceFloating_ self
    fun freezeNotify self = (GObjectObjectClass.FFI.withPtr ---> I) freezeNotify_ self
    fun getProperty self (propertyName, value) =
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
    fun setProperty self (propertyName, value) =
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
