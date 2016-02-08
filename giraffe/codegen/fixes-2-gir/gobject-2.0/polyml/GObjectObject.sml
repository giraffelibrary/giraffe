structure GObjectObject :>
  G_OBJECT_OBJECT
    where type 'a class_t = 'a GObjectObjectClass.t
    where type type_t = GObjectType.t
    where type value_record_t = GObjectValueRecord.t
    where type closure_record_t = GObjectClosureRecord.t
    where type 'a param_spec_class_t = 'a GObjectParamSpecClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_object_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
(*
      val forceFloating_ = call (load_sym libgobject "g_object_force_floating") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val freezeNotify_ = call (load_sym libgobject "g_object_freeze_notify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
*)
      val getProperty_ =
        call (load_sym libgobject "g_object_get_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
(*
      val isFloating_ = call (load_sym libgobject "g_object_is_floating") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val notify_ = call (load_sym libgobject "g_object_notify") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val notifyByPspec_ = call (load_sym libgobject "g_object_notify_by_pspec") (GObjectObjectClass.PolyML.PTR &&> GObjectParamSpecClass.PolyML.PTR --> FFI.PolyML.VOID)
      val runDispose_ = call (load_sym libgobject "g_object_run_dispose") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
*)
      val setProperty_ =
        call (load_sym libgobject "g_object_set_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
(*
      val thawNotify_ = call (load_sym libgobject "g_object_thaw_notify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val watchClosure_ = call (load_sym libgobject "g_object_watch_closure") (GObjectObjectClass.PolyML.PTR &&> GObjectClosureRecord.PolyML.PTR --> FFI.PolyML.VOID)
*)
    end
    type 'a class_t = 'a GObjectObjectClass.t
    type type_t = GObjectType.t
    type value_record_t = GObjectValueRecord.t
    type closure_record_t = GObjectClosureRecord.t
    type 'a param_spec_class_t = 'a GObjectParamSpecClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
(*
    fun forceFloating self = (GObjectObjectClass.C.withPtr ---> I) forceFloating_ self
    fun freezeNotify self = (GObjectObjectClass.C.withPtr ---> I) freezeNotify_ self
*)
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
(*
    fun isFloating self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isFloating_ self
    fun notify self propertyName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) notify_ (self & propertyName)
    fun notifyByPspec self pspec = (GObjectObjectClass.C.withPtr &&&> GObjectParamSpecClass.C.withPtr ---> I) notifyByPspec_ (self & pspec)
    fun runDispose self = (GObjectObjectClass.C.withPtr ---> I) runDispose_ self
*)
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
(*
    fun thawNotify self = (GObjectObjectClass.C.withPtr ---> I) thawNotify_ self
    fun watchClosure self closure = (GObjectObjectClass.C.withPtr &&&> GObjectClosureRecord.C.withPtr ---> I) watchClosure_ (self & closure)
    local
      open ClosureMarshal Signal
    in
      fun notifySig f = signal "notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void) f
    end
*)
  end
