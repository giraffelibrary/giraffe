structure GObjectObject :>
  G_OBJECT_OBJECT
    where type 'a class_t = 'a GObjectObjectClass.t
    where type type_t = GObjectType.t
    where type value_record_t = GObjectValueRecord.t
    where type closure_record_t = GObjectClosureRecord.t
    where type 'a param_spec_class_t = 'a GObjectParamSpecClass.t =
  struct
    val getType_ = _import "g_object_get_type" : unit -> GObjectType.C.val_;
    val forceFloating_ = _import "g_object_force_floating" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val freezeNotify_ = _import "g_object_freeze_notify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_get_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isFloating_ = _import "g_object_is_floating" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val notify_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_notify" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val notifyByPspec_ = fn x1 & x2 => (_import "g_object_notify_by_pspec" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> unit;) (x1, x2)
    val runDispose_ = _import "g_object_run_dispose" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_set_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val thawNotify_ = _import "g_object_thaw_notify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val watchClosure_ = fn x1 & x2 => (_import "g_object_watch_closure" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GObjectObjectClass.t
    type type_t = GObjectType.t
    type value_record_t = GObjectValueRecord.t
    type closure_record_t = GObjectClosureRecord.t
    type 'a param_spec_class_t = 'a GObjectParamSpecClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forceFloating self = (GObjectObjectClass.C.withPtr ---> I) forceFloating_ self
    fun freezeNotify self = (GObjectObjectClass.C.withPtr ---> I) freezeNotify_ self
    fun getProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        getProperty_
        (
          self
           & propertyName
           & value
        )
    fun isFloating self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isFloating_ self
    fun notify self propertyName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) notify_ (self & propertyName)
    fun notifyByPspec self pspec = (GObjectObjectClass.C.withPtr &&&> GObjectParamSpecClass.C.withPtr ---> I) notifyByPspec_ (self & pspec)
    fun runDispose self = (GObjectObjectClass.C.withPtr ---> I) runDispose_ self
    fun setProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )
    fun thawNotify self = (GObjectObjectClass.C.withPtr ---> I) thawNotify_ self
    fun watchClosure self closure = (GObjectObjectClass.C.withPtr &&&> GObjectClosureRecord.C.withPtr ---> I) watchClosure_ (self & closure)
    local
      open ClosureMarshal Signal
    in
      fun notifySig f = signal "notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void) f
    end
  end
