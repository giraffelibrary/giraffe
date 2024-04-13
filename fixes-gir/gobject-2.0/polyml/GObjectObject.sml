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
    where type ('object_class, 'h, 'e) signal_t = ('object_class, 'h, 'e) Signal.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "g_object_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (externalFunctionSymbol "giraffe_g_object_new_with_properties")
          (
            GObjectType.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> Utf8CPtrArrayN.PolyML.cInPtr
             &&> GObjectValueRecordCArrayN.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val bindProperty_ =
        call (externalFunctionSymbol "g_object_bind_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectBindingFlags.PolyML.cVal
             --> GObjectBindingClass.PolyML.cPtr
          )
      val bindPropertyFull_ =
        call (externalFunctionSymbol "g_object_bind_property_with_closures")
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
      val freezeNotify_ = call (externalFunctionSymbol "g_object_freeze_notify") (GObjectObjectClass.PolyML.cPtr --> cVoid)
      val getProperty_ =
        call (externalFunctionSymbol "g_object_get_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val getv_ =
        call (externalFunctionSymbol "g_object_getv")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> Utf8CPtrArrayN.PolyML.cInPtr
             &&> GObjectValueRecordCArrayN.PolyML.cInPtr
             --> cVoid
          )
      val notify_ = call (externalFunctionSymbol "g_object_notify") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val notifyByPspec_ = call (externalFunctionSymbol "g_object_notify_by_pspec") (GObjectObjectClass.PolyML.cPtr &&> GObjectParamSpecClass.PolyML.cPtr --> cVoid)
      val runDispose_ = call (externalFunctionSymbol "g_object_run_dispose") (GObjectObjectClass.PolyML.cPtr --> cVoid)
      val setProperty_ =
        call (externalFunctionSymbol "g_object_set_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val thawNotify_ = call (externalFunctionSymbol "g_object_thaw_notify") (GObjectObjectClass.PolyML.cPtr --> cVoid)
      val watchClosure_ = call (externalFunctionSymbol "g_object_watch_closure") (GObjectObjectClass.PolyML.cPtr &&> GObjectClosureRecord.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GObjectObjectClass.class
    type type_t = GObjectType.t
    type 'a binding_class = 'a GObjectBindingClass.class
    type binding_flags_t = GObjectBindingFlags.t
    type value_record_c_array_n_t = GObjectValueRecordCArrayN.t
    type value_t = GObjectValueRecord.t
    type closure_t = GObjectClosureRecord.t
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    type 'object_class property_init_t = 'object_class Property.init_t
    type ('object_class, 'h, 'e) signal_t = ('object_class, 'h, 'e) Signal.t
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
        fun hConv f (self & pspec) =
          let
            val () = f (GObjectObjectClass.toBase self) pspec
          in
            ()
          end
        fun eConv f self pspec =
          let
            val () = f (GObjectObjectClass.toBase self & GObjectParamSpecClass.toBase pspec)
          in
            ()
          end
      in
        val notifySig =
          {
            name = "notify",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
    end
  end
