structure GioAction :>
  GIO_ACTION
    where type 'a class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_action_get_type" : unit -> GObjectType.FFI.val_;
    val nameIsValid_ = _import "mlton_g_action_name_is_valid" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val parseDetailedName_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_action_parse_detailed_name" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * (unit, GLibVariantRecord.FFI.notnull) GLibVariantRecord.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val printDetailedName_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_action_print_detailed_name" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val activate_ = fn x1 & x2 => (_import "g_action_activate" : GioActionClass.FFI.notnull GioActionClass.FFI.p * unit GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val changeState_ = fn x1 & x2 => (_import "g_action_change_state" : GioActionClass.FFI.notnull GioActionClass.FFI.p * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val getEnabled_ = _import "g_action_get_enabled" : GioActionClass.FFI.notnull GioActionClass.FFI.p -> GBool.FFI.val_;
    val getName_ = _import "g_action_get_name" : GioActionClass.FFI.notnull GioActionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getParameterType_ = _import "g_action_get_parameter_type" : GioActionClass.FFI.notnull GioActionClass.FFI.p -> unit GLibVariantTypeRecord.FFI.p;
    val getState_ = _import "g_action_get_state" : GioActionClass.FFI.notnull GioActionClass.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val getStateHint_ = _import "g_action_get_state_hint" : GioActionClass.FFI.notnull GioActionClass.FFI.p -> unit GLibVariantRecord.FFI.p;
    val getStateType_ = _import "g_action_get_state_type" : GioActionClass.FFI.notnull GioActionClass.FFI.p -> unit GLibVariantTypeRecord.FFI.p;
    type 'a class = 'a GioActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun nameIsValid actionName = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) nameIsValid_ actionName
    fun parseDetailedName detailedName =
      let
        val actionName
         & targetValue
         & () =
          (
            Utf8.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibVariantRecord.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
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
    fun printDetailedName (actionName, targetValue) = (Utf8.FFI.withPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> Utf8.FFI.fromPtr 1) printDetailedName_ (actionName & targetValue)
    fun activate self parameter = (GioActionClass.FFI.withPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> I) activate_ (self & parameter)
    fun changeState self value = (GioActionClass.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> I) changeState_ (self & value)
    fun getEnabled self = (GioActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getEnabled_ self
    fun getName self = (GioActionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getParameterType self = (GioActionClass.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromOptPtr false) getParameterType_ self
    fun getState self = (GioActionClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getState_ self
    fun getStateHint self = (GioActionClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromOptPtr true) getStateHint_ self
    fun getStateType self = (GioActionClass.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromOptPtr false) getStateType_ self
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
