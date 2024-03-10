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
    where type 'object_class property_init_t = 'object_class Property.init_t
    where type ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t = ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) Signal.t =
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
    type 'object_class property_init_t = 'object_class Property.init_t
    type ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t = ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) Signal.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call =
        GObjectType.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> Utf8CPtrArrayN.FFI.withPtr 0
         &&&> GObjectValueRecordCArrayN.FFI.withPtr 0
         ---> GObjectObjectClass.FFI.fromPtr true
    in
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
            call new_
              (
                objectType
                 & nProperties
                 & names
                 & values
              )
        in
          GObjectObjectClass.toDerived class retVal
        end
    end
    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectBindingFlags.FFI.withVal
         ---> GObjectBindingClass.FFI.fromPtr false
    in
      fun bindProperty
        self
        (
          sourceProperty,
          target,
          targetProperty,
          flags
        ) =
        call bindProperty_
          (
            GObjectObjectClass.toBase self
             & sourceProperty
             & GObjectObjectClass.toBase target
             & targetProperty
             & flags
          )
         before GObjectObjectClass.FFI.touchPtr self
         before Utf8.FFI.touchPtr sourceProperty
         before GObjectObjectClass.FFI.touchPtr target
         before Utf8.FFI.touchPtr targetProperty
    end
    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectBindingFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withPtr false
         &&&> GObjectClosureRecord.FFI.withPtr false
         ---> GObjectBindingClass.FFI.fromPtr false
    in
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
        call bindPropertyFull_
          (
            GObjectObjectClass.toBase self
             & sourceProperty
             & GObjectObjectClass.toBase target
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
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false ---> I
    in
      fun freezeNotify self = call freezeNotify_ (GObjectObjectClass.toBase self)
    end
    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
    in
      fun getProperty self (propertyName, value) =
        call getProperty_
          (
            GObjectObjectClass.toBase self
             & propertyName
             & value
          )
    end
    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> Utf8CPtrArrayN.FFI.withPtr 0
         &&&> GObjectValueRecordCArrayN.FFI.withPtr 0
         ---> I
    in
      fun getv self (names, values) =
        let
          val nProperties = LargeInt.fromInt (GObjectValueRecordCArrayN.length values)
          val () =
            call getv_
              (
                GObjectObjectClass.toBase self
                 & nProperties
                 & names
                 & values
              )
        in
          ()
        end
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun notify self propertyName = call notify_ (GObjectObjectClass.toBase self & propertyName)
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false &&&> GObjectParamSpecClass.FFI.withPtr false ---> I
    in
      fun notifyByPspec self pspec = call notifyByPspec_ (GObjectObjectClass.toBase self & GObjectParamSpecClass.toBase pspec)
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false ---> I
    in
      fun runDispose self = call runDispose_ (GObjectObjectClass.toBase self)
    end
    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
    in
      fun setProperty self (propertyName, value) =
        call setProperty_
          (
            GObjectObjectClass.toBase self
             & propertyName
             & value
          )
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false ---> I
    in
      fun thawNotify self = call thawNotify_ (GObjectObjectClass.toBase self)
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false &&&> GObjectClosureRecord.FFI.withPtr false ---> I
    in
      fun watchClosure self closure = call watchClosure_ (GObjectObjectClass.toBase self & closure)
    end
    local
      open ClosureMarshal Signal
    in
      local
        val marshaller = parInst GObjectObjectClass.t &&&> parIn 1 GObjectParamSpecClass.t ---> retVoid
      in
        val notifySig =
          {
            name = "notify",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn self & pspec => GObjectObjectClass.toBase self & pspec,
                      fn self & pspec => GObjectObjectClass.toBase self & GObjectParamSpecClass.toBase pspec,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
    end
  end
