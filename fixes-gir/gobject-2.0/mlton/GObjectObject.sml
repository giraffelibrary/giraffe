structure GObjectObject :>
  G_OBJECT_OBJECT
    where type 'a class = 'a GObjectObjectClass.class
    where type type_t = GObjectType.t
    where type 'a binding_class = 'a GObjectBindingClass.class
    where type binding_flags_t = GObjectBindingFlags.t
    where type value_record_c_array_n_t = GObjectValueRecordCArrayN.t
    where type value_t = GObjectValueRecord.t
    where type closure_t = GObjectClosureRecord.t
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    where type 'object_class property_init_t = 'object_class Property.init_t
    where type 'a signal_t = 'a Signal.t =
  struct
    val getType_ = _import "g_object_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_object_new_with_properties" :
              GObjectType.FFI.val_
               * GUInt.FFI.val_
               * Utf8CPtrArrayN.MLton.p1
               * Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.MLton.p2
               * GObjectValueRecordCArrayN.MLton.p1
               * GObjectValueRecordCArrayN.FFI.non_opt GObjectValueRecordCArrayN.MLton.p2
               -> GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
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
    val getv_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_object_getv" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * GUInt.FFI.val_
               * Utf8CPtrArrayN.MLton.p1
               * Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.MLton.p2
               * GObjectValueRecordCArrayN.MLton.p1
               * GObjectValueRecordCArrayN.FFI.non_opt GObjectValueRecordCArrayN.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
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
    type value_record_c_array_n_t = GObjectValueRecordCArrayN.t
    type value_t = GObjectValueRecord.t
    type closure_t = GObjectClosureRecord.t
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    type 'object_class property_init_t = 'object_class Property.init_t
    type 'a signal_t = 'a Signal.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (class, parameters) =
      let
        val objectType = ValueAccessor.gtype class
        val n = List.length parameters
        val nProperties = LargeInt.fromInt n
        val names =
          Utf8CPtrArrayN.tabulate
            (n, Property.initName o ListSequence.get parameters)
        val values =
          (* Using `GObjectValueRecordCArrayN.tabulate` would create a
           * temporary GObjectValue for each element so we use a lower level
           * implementation that initializes each array element directly. *)
          let
            open GObjectValueRecordCArrayN
            fun initValue _ p (i, param) =
              Property.initValue param (C.ArrayType.get n p i)
          in
            FFI.fromPtr ~1 (
              C.ArrayType.init initValue (n, ListSequence.get parameters)
            ) n
          end
        val retVal =
          (
            GObjectType.FFI.withVal
             &&&> GUInt.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withPtr 0
             &&&> GObjectValueRecordCArrayN.FFI.withPtr 0
             ---> GObjectObjectClass.FFI.fromPtr true
          )
            new_
            (
              objectType
               & nProperties
               & names
               & values
            )
      in
        GObjectObjectClass.toDerived class retVal
      end
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
    fun getv self (names, values) =
      let
        val nProperties = LargeInt.fromInt (GObjectValueRecordCArrayN.length values)
        val () =
          (
            GObjectObjectClass.FFI.withPtr false
             &&&> GUInt.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withPtr 0
             &&&> GObjectValueRecordCArrayN.FFI.withPtr 0
             ---> I
          )
            getv_
            (
              self
               & nProperties
               & names
               & values
            )
      in
        ()
      end
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
