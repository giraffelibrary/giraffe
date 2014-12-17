structure AtkStateSet :>
  ATK_STATE_SET
    where type 'a class_t = 'a AtkStateSetClass.t
    where type statetype_t = AtkStateType.t =
  struct
    val getType_ = _import "atk_state_set_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_state_set_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addState_ = fn x1 & x2 => (_import "atk_state_set_add_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * AtkStateType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val andSets_ = fn x1 & x2 => (_import "atk_state_set_and_sets" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val clearStates_ = _import "atk_state_set_clear_states" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val containsState_ = fn x1 & x2 => (_import "atk_state_set_contains_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * AtkStateType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val isEmpty_ = _import "atk_state_set_is_empty" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val orSets_ = fn x1 & x2 => (_import "atk_state_set_or_sets" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val removeState_ = fn x1 & x2 => (_import "atk_state_set_remove_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * AtkStateType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val xorSets_ = fn x1 & x2 => (_import "atk_state_set_xor_sets" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    type 'a class_t = 'a AtkStateSetClass.t
    type statetype_t = AtkStateType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkStateSetClass.C.fromPtr true) new_ ()
    fun addState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) addState_ (self & type')
    fun andSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) andSets_ (self & compareSet)
    fun clearStates self = (GObjectObjectClass.C.withPtr ---> I) clearStates_ self
    fun containsState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) containsState_ (self & type')
    fun isEmpty self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isEmpty_ self
    fun orSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) orSets_ (self & compareSet)
    fun removeState self type' = (GObjectObjectClass.C.withPtr &&&> AtkStateType.C.withVal ---> FFI.Bool.C.fromVal) removeState_ (self & type')
    fun xorSets self compareSet = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) xorSets_ (self & compareSet)
  end
