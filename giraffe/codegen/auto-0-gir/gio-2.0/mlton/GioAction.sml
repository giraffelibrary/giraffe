structure GioAction :>
  GIO_ACTION
    where type 'a class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_action_get_type" : unit -> GObjectType.FFI.val_;
    val nameIsValid_ = _import "mlton_g_action_name_is_valid" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val parseDetailedName_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_action_parse_detailed_name" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibVariantRecord.FFI.opt, GLibVariantRecord.FFI.non_opt) GLibVariantRecord.FFI.r
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val activate_ = fn x1 & x2 => (_import "g_action_activate" : GioActionClass.FFI.non_opt GioActionClass.FFI.p * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val changeState_ = fn x1 & x2 => (_import "g_action_change_state" : GioActionClass.FFI.non_opt GioActionClass.FFI.p * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val getEnabled_ = _import "g_action_get_enabled" : GioActionClass.FFI.non_opt GioActionClass.FFI.p -> GBool.FFI.val_;
    val getName_ = _import "g_action_get_name" : GioActionClass.FFI.non_opt GioActionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getParameterType_ = _import "g_action_get_parameter_type" : GioActionClass.FFI.non_opt GioActionClass.FFI.p -> GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p;
    val getState_ = _import "g_action_get_state" : GioActionClass.FFI.non_opt GioActionClass.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val getStateHint_ = _import "g_action_get_state_hint" : GioActionClass.FFI.non_opt GioActionClass.FFI.p -> GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p;
    val getStateType_ = _import "g_action_get_state_type" : GioActionClass.FFI.non_opt GioActionClass.FFI.p -> GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p;
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
