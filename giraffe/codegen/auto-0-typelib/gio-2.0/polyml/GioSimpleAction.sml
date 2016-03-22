structure GioSimpleAction :>
  GIO_SIMPLE_ACTION
    where type 'a class = 'a GioSimpleActionClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_action_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_simple_action_new") (Utf8.PolyML.cInPtr &&> GLibVariantTypeRecord.PolyML.cOptPtr --> GioSimpleActionClass.PolyML.cPtr)
      val newStateful_ =
        call (load_sym libgio "g_simple_action_new_stateful")
          (
            Utf8.PolyML.cInPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> GioSimpleActionClass.PolyML.cPtr
          )
      val setEnabled_ = call (load_sym libgio "g_simple_action_set_enabled") (GioSimpleActionClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setState_ = call (load_sym libgio "g_simple_action_set_state") (GioSimpleActionClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioSimpleActionClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.C.withPtr ---> GioActionClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name parameterType = (Utf8.C.withPtr &&&> GLibVariantTypeRecord.C.withOptPtr ---> GioSimpleActionClass.C.fromPtr true) new_ (name & parameterType)
    fun newStateful name parameterType state =
      (
        Utf8.C.withPtr
         &&&> GLibVariantTypeRecord.C.withOptPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> GioSimpleActionClass.C.fromPtr true
      )
        newStateful_
        (
          name
           & parameterType
           & state
        )
    fun setEnabled self enabled = (GioSimpleActionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnabled_ (self & enabled)
    fun setState self value = (GioSimpleActionClass.C.withPtr &&&> GLibVariantRecord.C.withPtr ---> I) setState_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (get 0w1 GLibVariantRecord.tOpt ---> ret_void) f
      fun changeStateSig f = signal "change-state" (get 0w1 GLibVariantRecord.tOpt ---> ret_void) f
    end
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
