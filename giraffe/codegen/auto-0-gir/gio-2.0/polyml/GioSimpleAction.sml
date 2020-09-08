structure GioSimpleAction :>
  GIO_SIMPLE_ACTION
    where type 'a class = 'a GioSimpleActionClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_simple_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_simple_action_new") (Utf8.PolyML.cInPtr &&> GLibVariantTypeRecord.PolyML.cOptPtr --> GioSimpleActionClass.PolyML.cPtr)
      val newStateful_ =
        call (getSymbol "g_simple_action_new_stateful")
          (
            Utf8.PolyML.cInPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> GioSimpleActionClass.PolyML.cPtr
          )
      val setEnabled_ = call (getSymbol "g_simple_action_set_enabled") (GioSimpleActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setState_ = call (getSymbol "g_simple_action_set_state") (GioSimpleActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> cVoid)
      val setStateHint_ = call (getSymbol "g_simple_action_set_state_hint") (GioSimpleActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> cVoid)
    end
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
