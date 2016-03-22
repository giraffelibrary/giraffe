structure GioAction :>
  GIO_ACTION
    where type 'a class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_action_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val activate_ = call (load_sym libgio "g_action_activate") (GioActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val changeState_ = call (load_sym libgio "g_action_change_state") (GioActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getEnabled_ = call (load_sym libgio "g_action_get_enabled") (GioActionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getName_ = call (load_sym libgio "g_action_get_name") (GioActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParameterType_ = call (load_sym libgio "g_action_get_parameter_type") (GioActionClass.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val getState_ = call (load_sym libgio "g_action_get_state") (GioActionClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getStateHint_ = call (load_sym libgio "g_action_get_state_hint") (GioActionClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getStateType_ = call (load_sym libgio "g_action_get_state_type") (GioActionClass.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
    end
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
