structure AtkRelationSet :>
  ATK_RELATION_SET
    where type 'a class = 'a AtkRelationSetClass.class
    where type 'a object_class = 'a AtkObjectClass.class
    where type relation_type_t = AtkRelationType.t
    where type 'a relation_class = 'a AtkRelationClass.class =
  struct
    val getType_ = _import "atk_relation_set_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "atk_relation_set_new" : unit -> AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p;
    val add_ = fn x1 & x2 => (_import "atk_relation_set_add" : AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p * AtkRelationClass.FFI.non_opt AtkRelationClass.FFI.p -> unit;) (x1, x2)
    val addRelationByType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_relation_set_add_relation_by_type" :
              AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p
               * AtkRelationType.FFI.val_
               * AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val contains_ = fn x1 & x2 => (_import "atk_relation_set_contains" : AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p * AtkRelationType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val containsTarget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_relation_set_contains_target" :
              AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p
               * AtkRelationType.FFI.val_
               * AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getNRelations_ = _import "atk_relation_set_get_n_relations" : AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p -> GInt32.FFI.val_;
    val getRelation_ = fn x1 & x2 => (_import "atk_relation_set_get_relation" : AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p * GInt32.FFI.val_ -> AtkRelationClass.FFI.non_opt AtkRelationClass.FFI.p;) (x1, x2)
    val getRelationByType_ = fn x1 & x2 => (_import "atk_relation_set_get_relation_by_type" : AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p * AtkRelationType.FFI.val_ -> AtkRelationClass.FFI.non_opt AtkRelationClass.FFI.p;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "atk_relation_set_remove" : AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p * AtkRelationClass.FFI.non_opt AtkRelationClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a AtkRelationSetClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type 'a relation_class = 'a AtkRelationClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkRelationSetClass.FFI.fromPtr true) new_ ()
    fun add self relation = (AtkRelationSetClass.FFI.withPtr &&&> AtkRelationClass.FFI.withPtr ---> I) add_ (self & relation)
    fun addRelationByType self (relationship, target) =
      (
        AtkRelationSetClass.FFI.withPtr
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr
         ---> I
      )
        addRelationByType_
        (
          self
           & relationship
           & target
        )
    fun contains self relationship = (AtkRelationSetClass.FFI.withPtr &&&> AtkRelationType.FFI.withVal ---> GBool.FFI.fromVal) contains_ (self & relationship)
    fun containsTarget self (relationship, target) =
      (
        AtkRelationSetClass.FFI.withPtr
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        containsTarget_
        (
          self
           & relationship
           & target
        )
    fun getNRelations self = (AtkRelationSetClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNRelations_ self
    fun getRelation self i = (AtkRelationSetClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> AtkRelationClass.FFI.fromPtr false) getRelation_ (self & i)
    fun getRelationByType self relationship = (AtkRelationSetClass.FFI.withPtr &&&> AtkRelationType.FFI.withVal ---> AtkRelationClass.FFI.fromPtr false) getRelationByType_ (self & relationship)
    fun remove self relation = (AtkRelationSetClass.FFI.withPtr &&&> AtkRelationClass.FFI.withPtr ---> I) remove_ (self & relation)
  end
