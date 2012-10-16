structure GioSimpleAction :>
  GIO_SIMPLE_ACTION
    where type 'a class_t = 'a GioSimpleActionClass.t
    where type 'a actionclass_t = 'a GioActionClass.t =
  struct
    val getType_ = _import "g_simple_action_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_simple_action_new" :
              cstring
               * unit CPointer.t
               * unit GLibVariantTypeRecord.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * unit GLibVariantTypeRecord.C.p
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setEnabled_ = fn x1 & x2 => (_import "g_simple_action_set_enabled" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setState_ = fn x1 & x2 => (_import "g_simple_action_set_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GLibVariantRecord.C.notnull GLibVariantRecord.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GioSimpleActionClass.t
    type 'a actionclass_t = 'a GioActionClass.t
    fun asAction self = (GObjectObjectClass.C.withPtr ---> GioActionClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name parameterType = (FFI.String.withConstPtr &&&> GLibVariantTypeRecord.C.withOptPtr ---> GioSimpleActionClass.C.fromPtr true) new_ (name & parameterType)
    fun newStateful name parameterType state =
      (
        FFI.String.withConstPtr
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
    fun setEnabled self enabled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setEnabled_ (self & enabled)
    fun setState self value = (GObjectObjectClass.C.withPtr &&&> GLibVariantRecord.C.withPtr ---> I) setState_ (self & value)
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
