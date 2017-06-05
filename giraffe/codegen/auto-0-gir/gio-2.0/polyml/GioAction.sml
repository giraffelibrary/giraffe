structure GioAction :>
  GIO_ACTION
    where type 'a class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_action_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val activate_ = call (load_sym libgio "g_action_activate") (GioActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val changeState_ = call (load_sym libgio "g_action_change_state") (GioActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getEnabled_ = call (load_sym libgio "g_action_get_enabled") (GioActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getName_ = call (load_sym libgio "g_action_get_name") (GioActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParameterType_ = call (load_sym libgio "g_action_get_parameter_type") (GioActionClass.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val getState_ = call (load_sym libgio "g_action_get_state") (GioActionClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getStateHint_ = call (load_sym libgio "g_action_get_state_hint") (GioActionClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getStateType_ = call (load_sym libgio "g_action_get_state_type") (GioActionClass.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
    end
    type 'a class = 'a GioActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate self parameter = (GioActionClass.FFI.withPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> I) activate_ (self & parameter)
    fun changeState self value = (GioActionClass.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> I) changeState_ (self & value)
    fun getEnabled self = (GioActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getEnabled_ self
    fun getName self = (GioActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getParameterType self = (GioActionClass.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) getParameterType_ self
    fun getState self = (GioActionClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getState_ self
    fun getStateHint self = (GioActionClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getStateHint_ self
    fun getStateType self = (GioActionClass.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) getStateType_ self
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
