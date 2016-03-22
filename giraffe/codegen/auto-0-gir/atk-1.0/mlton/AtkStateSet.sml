structure AtkStateSet :>
  ATK_STATE_SET
    where type 'a class = 'a AtkStateSetClass.class
    where type state_type_t = AtkStateType.t =
  struct
    val getType_ = _import "atk_state_set_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_state_set_new" : unit -> AtkStateSetClass.C.notnull AtkStateSetClass.C.p;
    val addState_ = fn x1 & x2 => (_import "atk_state_set_add_state" : AtkStateSetClass.C.notnull AtkStateSetClass.C.p * AtkStateType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val andSets_ = fn x1 & x2 => (_import "atk_state_set_and_sets" : AtkStateSetClass.C.notnull AtkStateSetClass.C.p * AtkStateSetClass.C.notnull AtkStateSetClass.C.p -> AtkStateSetClass.C.notnull AtkStateSetClass.C.p;) (x1, x2)
    val clearStates_ = _import "atk_state_set_clear_states" : AtkStateSetClass.C.notnull AtkStateSetClass.C.p -> unit;
    val containsState_ = fn x1 & x2 => (_import "atk_state_set_contains_state" : AtkStateSetClass.C.notnull AtkStateSetClass.C.p * AtkStateType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val isEmpty_ = _import "atk_state_set_is_empty" : AtkStateSetClass.C.notnull AtkStateSetClass.C.p -> FFI.Bool.C.val_;
    val orSets_ = fn x1 & x2 => (_import "atk_state_set_or_sets" : AtkStateSetClass.C.notnull AtkStateSetClass.C.p * AtkStateSetClass.C.notnull AtkStateSetClass.C.p -> AtkStateSetClass.C.notnull AtkStateSetClass.C.p;) (x1, x2)
    val removeState_ = fn x1 & x2 => (_import "atk_state_set_remove_state" : AtkStateSetClass.C.notnull AtkStateSetClass.C.p * AtkStateType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val xorSets_ = fn x1 & x2 => (_import "atk_state_set_xor_sets" : AtkStateSetClass.C.notnull AtkStateSetClass.C.p * AtkStateSetClass.C.notnull AtkStateSetClass.C.p -> AtkStateSetClass.C.notnull AtkStateSetClass.C.p;) (x1, x2)
    type 'a class = 'a AtkStateSetClass.class
    type state_type_t = AtkStateType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkStateSetClass.C.fromPtr true) new_ ()
    fun addState self type' = (AtkStateSetClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) addState_ (self & type')
    fun andSets self compareSet = (AtkStateSetClass.C.withPtr &&&> AtkStateSetClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) andSets_ (self & compareSet)
    fun clearStates self = (AtkStateSetClass.C.withPtr ---> I) clearStates_ self
    fun containsState self type' = (AtkStateSetClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) containsState_ (self & type')
    fun isEmpty self = (AtkStateSetClass.C.withPtr ---> FFI.Bool.C.fromVal) isEmpty_ self
    fun orSets self compareSet = (AtkStateSetClass.C.withPtr &&&> AtkStateSetClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) orSets_ (self & compareSet)
    fun removeState self type' = (AtkStateSetClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) removeState_ (self & type')
    fun xorSets self compareSet = (AtkStateSetClass.C.withPtr &&&> AtkStateSetClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) xorSets_ (self & compareSet)
  end
