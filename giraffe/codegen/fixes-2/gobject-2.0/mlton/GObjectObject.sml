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
    val getType_ = _import "g_object_get_type" : unit -> GObjectType.C.val_;
(*
    val bindProperty_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_object_bind_property" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GObjectBindingFlags.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val bindPropertyFull_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_object_bind_property_with_closures" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GObjectBindingFlags.C.val_
               * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p
               * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
    val compatControl_ = _import "g_object_compat_control" : FFI.Word64.val_ -> FFI.Word64.val_;
    val interfaceFindProperty_ = _import "mlton_g_object_interface_find_property" : cstring * unit CPointer.t -> GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p;
    val interfaceInstallProperty_ = _import "g_object_interface_install_property" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> unit;
    val forceFloating_ = _import "g_object_force_floating" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val freezeNotify_ = _import "g_object_freeze_notify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getData_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_get_data" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
*)
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_get_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
(*
    val getQdata_ = fn x1 & x2 => (_import "g_object_get_qdata" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Word32.val_ -> unit;) (x1, x2)
    val isFloating_ = _import "g_object_is_floating" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val notify_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_notify" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val notifyByPspec_ = fn x1 & x2 => (_import "g_object_notify_by_pspec" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> unit;) (x1, x2)
    val runDispose_ = _import "g_object_run_dispose" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setData_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_set_data" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
*)
    val setProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_set_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
(*
    val stealData_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_steal_data" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val stealQdata_ = fn x1 & x2 => (_import "g_object_steal_qdata" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Word32.val_ -> unit;) (x1, x2)
    val thawNotify_ = _import "g_object_thaw_notify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val watchClosure_ = fn x1 & x2 => (_import "g_object_watch_closure" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p -> unit;) (x1, x2)
*)
    type 'a class_t = 'a GObjectObjectClass.t
    type type_t = GObjectType.t
    type 'a bindingclass_t = 'a GObjectBindingClass.t
    type bindingflags_t = GObjectBindingFlags.t
    type valuerecord_t = GObjectValueRecord.t
    type closurerecord_t = GObjectClosureRecord.t
    type 'a paramspecclass_t = 'a GObjectParamSpecClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
(*
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
*)
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
(*
    fun getQdata self quark = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) getQdata_ (self & quark)
    fun isFloating self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isFloating_ self
    fun notify self propertyName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) notify_ (self & propertyName)
    fun notifyByPspec self pspec = (GObjectObjectClass.C.withPtr &&&> GObjectParamSpecClass.C.withPtr ---> I) notifyByPspec_ (self & pspec)
    fun runDispose self = (GObjectObjectClass.C.withPtr ---> I) runDispose_ self
    fun setData self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setData_ (self & key)
*)
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
(*
    fun stealData self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) stealData_ (self & key)
    fun stealQdata self quark = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) stealQdata_ (self & quark)
    fun thawNotify self = (GObjectObjectClass.C.withPtr ---> I) thawNotify_ self
    fun watchClosure self closure = (GObjectObjectClass.C.withPtr &&&> GObjectClosureRecord.C.withPtr ---> I) watchClosure_ (self & closure)
    local
      open ClosureMarshal Signal
    in
      fun notifySig f = signal "notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void) f
    end
*)
  end
