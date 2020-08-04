structure AtkStateSet :>
  ATK_STATE_SET
    where type 'a class = 'a AtkStateSetClass.class
    where type state_type_c_array_n_t = AtkStateTypeCArrayN.t
    where type state_type_t = AtkStateType.t =
  struct
    val getType_ = _import "atk_state_set_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "atk_state_set_new" : unit -> AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p;
    val addState_ = fn x1 & x2 => (_import "atk_state_set_add_state" : AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p * AtkStateType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val addStates_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_atk_state_set_add_states" :
              AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p
               * AtkStateTypeCArrayN.MLton.p1
               * AtkStateTypeCArrayN.FFI.non_opt AtkStateTypeCArrayN.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val andSets_ = fn x1 & x2 => (_import "atk_state_set_and_sets" : AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p * AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p -> AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p;) (x1, x2)
    val clearStates_ = _import "atk_state_set_clear_states" : AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p -> unit;
    val containsState_ = fn x1 & x2 => (_import "atk_state_set_contains_state" : AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p * AtkStateType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val containsStates_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_atk_state_set_contains_states" :
              AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p
               * AtkStateTypeCArrayN.MLton.p1
               * AtkStateTypeCArrayN.FFI.non_opt AtkStateTypeCArrayN.MLton.p2
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isEmpty_ = _import "atk_state_set_is_empty" : AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p -> GBool.FFI.val_;
    val orSets_ = fn x1 & x2 => (_import "atk_state_set_or_sets" : AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p * AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p -> AtkStateSetClass.FFI.opt AtkStateSetClass.FFI.p;) (x1, x2)
    val removeState_ = fn x1 & x2 => (_import "atk_state_set_remove_state" : AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p * AtkStateType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val xorSets_ = fn x1 & x2 => (_import "atk_state_set_xor_sets" : AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p * AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p -> AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p;) (x1, x2)
    type 'a class = 'a AtkStateSetClass.class
    type state_type_c_array_n_t = AtkStateTypeCArrayN.t
    type state_type_t = AtkStateType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkStateSetClass.FFI.fromPtr true) new_ ()
    fun addState self type' = (AtkStateSetClass.FFI.withPtr false &&&> AtkStateType.FFI.withVal ---> GBool.FFI.fromVal) addState_ (self & type')
    fun addStates self types =
      let
        val nTypes = LargeInt.fromInt (AtkStateTypeCArrayN.length types)
        val () =
          (
            AtkStateSetClass.FFI.withPtr false
             &&&> AtkStateTypeCArrayN.FFI.withPtr 0
             &&&> GInt.FFI.withVal
             ---> I
          )
            addStates_
            (
              self
               & types
               & nTypes
            )
      in
        ()
      end
    fun andSets self compareSet = (AtkStateSetClass.FFI.withPtr false &&&> AtkStateSetClass.FFI.withPtr false ---> AtkStateSetClass.FFI.fromPtr true) andSets_ (self & compareSet)
    fun clearStates self = (AtkStateSetClass.FFI.withPtr false ---> I) clearStates_ self
    fun containsState self type' = (AtkStateSetClass.FFI.withPtr false &&&> AtkStateType.FFI.withVal ---> GBool.FFI.fromVal) containsState_ (self & type')
    fun containsStates self types =
      let
        val nTypes = LargeInt.fromInt (AtkStateTypeCArrayN.length types)
        val retVal =
          (
            AtkStateSetClass.FFI.withPtr false
             &&&> AtkStateTypeCArrayN.FFI.withPtr 0
             &&&> GInt.FFI.withVal
             ---> GBool.FFI.fromVal
          )
            containsStates_
            (
              self
               & types
               & nTypes
            )
      in
        retVal
      end
    fun isEmpty self = (AtkStateSetClass.FFI.withPtr false ---> GBool.FFI.fromVal) isEmpty_ self
    fun orSets self compareSet = (AtkStateSetClass.FFI.withPtr false &&&> AtkStateSetClass.FFI.withPtr false ---> AtkStateSetClass.FFI.fromOptPtr true) orSets_ (self & compareSet)
    fun removeState self type' = (AtkStateSetClass.FFI.withPtr false &&&> AtkStateType.FFI.withVal ---> GBool.FFI.fromVal) removeState_ (self & type')
    fun xorSets self compareSet = (AtkStateSetClass.FFI.withPtr false &&&> AtkStateSetClass.FFI.withPtr false ---> AtkStateSetClass.FFI.fromPtr true) xorSets_ (self & compareSet)
  end
