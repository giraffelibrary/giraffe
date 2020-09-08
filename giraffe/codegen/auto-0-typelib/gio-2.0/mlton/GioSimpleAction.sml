structure GioSimpleAction :>
  GIO_SIMPLE_ACTION
    where type 'a class = 'a GioSimpleActionClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_simple_action_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_simple_action_new" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               -> GioSimpleActionClass.FFI.non_opt GioSimpleActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newStateful_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_simple_action_new_stateful" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               -> GioSimpleActionClass.FFI.non_opt GioSimpleActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setEnabled_ = fn x1 & x2 => (_import "g_simple_action_set_enabled" : GioSimpleActionClass.FFI.non_opt GioSimpleActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setState_ = fn x1 & x2 => (_import "g_simple_action_set_state" : GioSimpleActionClass.FFI.non_opt GioSimpleActionClass.FFI.p * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val setStateHint_ = fn x1 & x2 => (_import "g_simple_action_set_state_hint" : GioSimpleActionClass.FFI.non_opt GioSimpleActionClass.FFI.p * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GioSimpleActionClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> GioActionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (name, parameterType) = (Utf8.FFI.withPtr 0 &&&> GLibVariantTypeRecord.FFI.withOptPtr false ---> GioSimpleActionClass.FFI.fromPtr true) new_ (name & parameterType)
    fun newStateful
      (
        name,
        parameterType,
        state
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GLibVariantTypeRecord.FFI.withOptPtr false
         &&&> GLibVariantRecord.FFI.withPtr false
         ---> GioSimpleActionClass.FFI.fromPtr true
      )
        newStateful_
        (
          name
           & parameterType
           & state
        )
    fun setEnabled self enabled = (GioSimpleActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEnabled_ (self & enabled)
    fun setState self value = (GioSimpleActionClass.FFI.withPtr false &&&> GLibVariantRecord.FFI.withPtr false ---> I) setState_ (self & value)
    fun setStateHint self stateHint = (GioSimpleActionClass.FFI.withPtr false &&&> GLibVariantRecord.FFI.withOptPtr false ---> I) setStateHint_ (self & stateHint)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (get 0w1 GLibVariantRecord.tOpt ---> ret_void) f
      fun changeStateSig f = signal "change-state" (get 0w1 GLibVariantRecord.tOpt ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val enabledProp =
        {
          name = "enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val parameterTypeProp =
        {
          name = "parameter-type",
          gtype = fn () => C.gtype GLibVariantTypeRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantTypeRecord.tOpt x,
          set = ignore,
          init = fn x => C.set GLibVariantTypeRecord.tOpt x
        }
      val stateProp =
        {
          name = "state",
          gtype = fn () => C.gtype GLibVariantRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantRecord.tOpt x,
          set = fn x => C.set GLibVariantRecord.tOpt x,
          init = fn x => C.set GLibVariantRecord.tOpt x
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
