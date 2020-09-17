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
    val getType_ = _import "g_object_get_type" : unit -> GObjectType.FFI.val_;
    val bindProperty_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_object_bind_property" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectBindingFlags.FFI.val_
               -> GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val bindPropertyFull_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9 =>
          (
            _import "mlton_g_object_bind_property_with_closures" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectBindingFlags.FFI.val_
               * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
               * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
               -> GObjectBindingClass.FFI.non_opt GObjectBindingClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val freezeNotify_ = _import "g_object_freeze_notify" : GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p -> unit;
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_get_property" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val notify_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_notify" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val notifyByPspec_ = fn x1 & x2 => (_import "g_object_notify_by_pspec" : GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p * GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p -> unit;) (x1, x2)
    val runDispose_ = _import "g_object_run_dispose" : GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p -> unit;
    val setProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_set_property" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val thawNotify_ = _import "g_object_thaw_notify" : GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p -> unit;
    val watchClosure_ = fn x1 & x2 => (_import "g_object_watch_closure" : GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p -> unit;) (x1, x2)
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
