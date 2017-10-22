structure AtkRelation :>
  ATK_RELATION
    where type 'a class = 'a AtkRelationClass.class
    where type 'a object_class = 'a AtkObjectClass.class
    where type relation_type_t = AtkRelationType.t =
  struct
    structure AtkObjectClassCVectorNType =
      CPointerCVectorNType(
        structure CElemType = AtkObjectClass.C.PointerType
        structure Sequence = VectorSequence
      )
    structure AtkObjectClassCVectorN = CVectorN(AtkObjectClassCVectorNType)
    val getType_ = _import "atk_relation_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_atk_relation_new" :
              AtkObjectClassCVectorN.MLton.p1
               * AtkObjectClassCVectorN.FFI.notnull AtkObjectClassCVectorN.MLton.p2
               * GInt32.FFI.val_
               * AtkRelationType.FFI.val_
               -> AtkRelationClass.FFI.notnull AtkRelationClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTarget_ = fn x1 & x2 => (_import "atk_relation_add_target" : AtkRelationClass.FFI.notnull AtkRelationClass.FFI.p * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> unit;) (x1, x2)
    val getRelationType_ = _import "atk_relation_get_relation_type" : AtkRelationClass.FFI.notnull AtkRelationClass.FFI.p -> AtkRelationType.FFI.val_;
    val removeTarget_ = fn x1 & x2 => (_import "atk_relation_remove_target" : AtkRelationClass.FFI.notnull AtkRelationClass.FFI.p * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a AtkRelationClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (targets, relationship) =
      let
        val nTargets = LargeInt.fromInt (AtkObjectClassCVectorN.length targets)
        val retVal =
          (
            AtkObjectClassCVectorN.FFI.withPtr
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
    fun addTarget self target = (AtkRelationClass.FFI.withPtr &&&> AtkObjectClass.FFI.withPtr ---> I) addTarget_ (self & target)
    fun getRelationType self = (AtkRelationClass.FFI.withPtr ---> AtkRelationType.FFI.fromVal) getRelationType_ self
    fun removeTarget self target = (AtkRelationClass.FFI.withPtr &&&> AtkObjectClass.FFI.withPtr ---> GBool.FFI.fromVal) removeTarget_ (self & target)
    local
      open Property
    in
      val relationTypeProp =
        {
          get = fn x => get "relation-type" AtkRelationType.t x,
          set = fn x => set "relation-type" AtkRelationType.t x
        }
      val targetProp =
        {
          get = fn x => get "target" GObjectValueArrayRecord.tOpt x,
          set = fn x => set "target" GObjectValueArrayRecord.tOpt x
        }
    end
  end
