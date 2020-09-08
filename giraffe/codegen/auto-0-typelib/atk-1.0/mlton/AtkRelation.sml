structure AtkRelation :>
  ATK_RELATION
    where type 'a class = 'a AtkRelationClass.class
    where type object_class_c_ptr_array_n_t = AtkObjectClassCPtrArrayN.t
    where type 'a object_class = 'a AtkObjectClass.class
    where type relation_type_t = AtkRelationType.t =
  struct
    val getType_ = _import "atk_relation_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_atk_relation_new" :
              AtkObjectClassCPtrArrayN.MLton.p1
               * AtkObjectClassCPtrArrayN.FFI.non_opt AtkObjectClassCPtrArrayN.MLton.p2
               * GInt32.FFI.val_
               * AtkRelationType.FFI.val_
               -> AtkRelationClass.FFI.non_opt AtkRelationClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTarget_ = fn x1 & x2 => (_import "atk_relation_add_target" : AtkRelationClass.FFI.non_opt AtkRelationClass.FFI.p * AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> unit;) (x1, x2)
    val getRelationType_ = _import "atk_relation_get_relation_type" : AtkRelationClass.FFI.non_opt AtkRelationClass.FFI.p -> AtkRelationType.FFI.val_;
    val removeTarget_ = fn x1 & x2 => (_import "atk_relation_remove_target" : AtkRelationClass.FFI.non_opt AtkRelationClass.FFI.p * AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a AtkRelationClass.class
    type object_class_c_ptr_array_n_t = AtkObjectClassCPtrArrayN.t
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (targets, relationship) =
      let
        val nTargets = LargeInt.fromInt (AtkObjectClassCPtrArrayN.length targets)
        val retVal =
          (
            AtkObjectClassCPtrArrayN.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
             &&&> AtkRelationType.FFI.withVal
             ---> AtkRelationClass.FFI.fromPtr true
          )
            new_
            (
              targets
               & nTargets
               & relationship
            )
      in
        retVal
      end
    fun addTarget self target = (AtkRelationClass.FFI.withPtr false &&&> AtkObjectClass.FFI.withPtr false ---> I) addTarget_ (self & target)
    fun getRelationType self = (AtkRelationClass.FFI.withPtr false ---> AtkRelationType.FFI.fromVal) getRelationType_ self
    fun removeTarget self target = (AtkRelationClass.FFI.withPtr false &&&> AtkObjectClass.FFI.withPtr false ---> GBool.FFI.fromVal) removeTarget_ (self & target)
    local
      open ValueAccessor
    in
      val relationTypeProp =
        {
          name = "relation-type",
          gtype = fn () => C.gtype AtkRelationType.t (),
          get = fn x => fn () => C.get AtkRelationType.t x,
          set = fn x => C.set AtkRelationType.t x,
          init = fn x => C.set AtkRelationType.t x
        }
      val targetProp =
        {
          name = "target",
          gtype = fn () => C.gtype GObjectValueArrayRecord.tOpt (),
          get = fn x => fn () => C.get GObjectValueArrayRecord.tOpt x,
          set = fn x => C.set GObjectValueArrayRecord.tOpt x,
          init = fn x => C.set GObjectValueArrayRecord.tOpt x
        }
    end
  end
