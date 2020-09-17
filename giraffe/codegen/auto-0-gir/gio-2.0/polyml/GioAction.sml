structure GioAction :>
  GIO_ACTION
    where type 'a class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val nameIsValid_ = call (getSymbol "g_action_name_is_valid") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val parseDetailedName_ =
        call (getSymbol "g_action_parse_detailed_name")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibVariantRecord.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val printDetailedName_ = call (getSymbol "g_action_print_detailed_name") (Utf8.PolyML.cInPtr &&> GLibVariantRecord.PolyML.cOptPtr --> Utf8.PolyML.cOutPtr)
      val activate_ = call (getSymbol "g_action_activate") (GioActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> cVoid)
      val changeState_ = call (getSymbol "g_action_change_state") (GioActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> cVoid)
      val getEnabled_ = call (getSymbol "g_action_get_enabled") (GioActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getName_ = call (getSymbol "g_action_get_name") (GioActionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParameterType_ = call (getSymbol "g_action_get_parameter_type") (GioActionClass.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cOptPtr)
      val getState_ = call (getSymbol "g_action_get_state") (GioActionClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getStateHint_ = call (getSymbol "g_action_get_state_hint") (GioActionClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cOptPtr)
      val getStateType_ = call (getSymbol "g_action_get_state_type") (GioActionClass.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cOptPtr)
    end
    type 'a class = 'a GioActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun nameIsValid actionName = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) nameIsValid_ actionName
    fun parseDetailedName detailedName =
      let
        val actionName
         & targetValue
         & () =
          (
            Utf8.FFI.withPtr 0
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibVariantRecord.FFI.withRefOptPtr true
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1
                   && GLibVariantRecord.FFI.fromPtr true
                   && ignore
          )
            parseDetailedName_
            (
              detailedName
               & NONE
               & NONE
               & []
            )
      in
        (actionName, targetValue)
      end
    fun printDetailedName (actionName, targetValue) = (Utf8.FFI.withPtr 0 &&&> GLibVariantRecord.FFI.withOptPtr false ---> Utf8.FFI.fromPtr ~1) printDetailedName_ (actionName & targetValue)
    fun activate self parameter = (GioActionClass.FFI.withPtr false &&&> GLibVariantRecord.FFI.withOptPtr false ---> I) activate_ (self & parameter)
    fun changeState self value = (GioActionClass.FFI.withPtr false &&&> GLibVariantRecord.FFI.withPtr false ---> I) changeState_ (self & value)
    fun getEnabled self = (GioActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEnabled_ self
    fun getName self = (GioActionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GioActionClass.FFI.touchPtr self
    fun getParameterType self = (GioActionClass.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromOptPtr false) getParameterType_ self before GioActionClass.FFI.touchPtr self
    fun getState self = (GioActionClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr true) getState_ self
    fun getStateHint self = (GioActionClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromOptPtr true) getStateHint_ self
    fun getStateType self = (GioActionClass.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromOptPtr false) getStateType_ self before GioActionClass.FFI.touchPtr self
    local
      open ValueAccessor
    in
      val enabledProp =
        {
          name = "enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val parameterTypeProp =
        {
          name = "parameter-type",
          gtype = fn () => C.gtype GLibVariantTypeRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantTypeRecord.tOpt x,
          set = ignore,
          init = ignore
        }
      val stateProp =
        {
          name = "state",
          gtype = fn () => C.gtype GLibVariantRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantRecord.tOpt x,
          set = ignore,
          init = ignore
        }
      val stateTypeProp =
        {
          name = "state-type",
          gtype = fn () => C.gtype GLibVariantTypeRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantTypeRecord.tOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
