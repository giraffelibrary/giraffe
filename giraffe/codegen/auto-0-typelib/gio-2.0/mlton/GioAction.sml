structure GioAction :>
  GIO_ACTION
    where type 'a class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_action_get_type" : unit -> GObjectType.C.val_;
    val activate_ = fn x1 & x2 => (_import "g_action_activate" : GioActionClass.C.notnull GioActionClass.C.p * unit GLibVariantRecord.C.p -> unit;) (x1, x2)
    val changeState_ = fn x1 & x2 => (_import "g_action_change_state" : GioActionClass.C.notnull GioActionClass.C.p * GLibVariantRecord.C.notnull GLibVariantRecord.C.p -> unit;) (x1, x2)
    val getEnabled_ = _import "g_action_get_enabled" : GioActionClass.C.notnull GioActionClass.C.p -> FFI.Bool.C.val_;
    val getName_ = _import "g_action_get_name" : GioActionClass.C.notnull GioActionClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getParameterType_ = _import "g_action_get_parameter_type" : GioActionClass.C.notnull GioActionClass.C.p -> GLibVariantTypeRecord.C.notnull GLibVariantTypeRecord.C.p;
    val getState_ = _import "g_action_get_state" : GioActionClass.C.notnull GioActionClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val getStateHint_ = _import "g_action_get_state_hint" : GioActionClass.C.notnull GioActionClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val getStateType_ = _import "g_action_get_state_type" : GioActionClass.C.notnull GioActionClass.C.p -> GLibVariantTypeRecord.C.notnull GLibVariantTypeRecord.C.p;
    type 'a class = 'a GioActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self parameter = (GioActionClass.C.withPtr &&&> GLibVariantRecord.C.withOptPtr ---> I) activate_ (self & parameter)
    fun changeState self value = (GioActionClass.C.withPtr &&&> GLibVariantRecord.C.withPtr ---> I) changeState_ (self & value)
    fun getEnabled self = (GioActionClass.C.withPtr ---> FFI.Bool.C.fromVal) getEnabled_ self
    fun getName self = (GioActionClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getParameterType self = (GioActionClass.C.withPtr ---> GLibVariantTypeRecord.C.fromPtr false) getParameterType_ self
    fun getState self = (GioActionClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getState_ self
    fun getStateHint self = (GioActionClass.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getStateHint_ self
    fun getStateType self = (GioActionClass.C.withPtr ---> GLibVariantTypeRecord.C.fromPtr false) getStateType_ self
    local
      open Property
    in
      val enabledProp = {get = fn x => get "enabled" boolean x}
      val nameProp = {get = fn x => get "name" stringOpt x}
      val parameterTypeProp = {get = fn x => get "parameter-type" GLibVariantTypeRecord.tOpt x}
      val stateProp = {get = fn x => get "state" GLibVariantRecord.tOpt x}
      val stateTypeProp = {get = fn x => get "state-type" GLibVariantTypeRecord.tOpt x}
    end
  end
