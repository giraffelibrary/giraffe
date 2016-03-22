structure AtkRelationSet :>
  ATK_RELATION_SET
    where type 'a class = 'a AtkRelationSetClass.class
    where type 'a object_class = 'a AtkObjectClass.class
    where type relation_type_t = AtkRelationType.t
    where type 'a relation_class = 'a AtkRelationClass.class =
  struct
    val getType_ = _import "atk_relation_set_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_relation_set_new" : unit -> AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p;
    val add_ = fn x1 & x2 => (_import "atk_relation_set_add" : AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p * AtkRelationClass.C.notnull AtkRelationClass.C.p -> unit;) (x1, x2)
    val addRelationByType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_relation_set_add_relation_by_type" :
              AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p
               * AtkRelationType.C.val_
               * AtkObjectClass.C.notnull AtkObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val contains_ = fn x1 & x2 => (_import "atk_relation_set_contains" : AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p * AtkRelationType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val getNRelations_ = _import "atk_relation_set_get_n_relations" : AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p -> FFI.Int.C.val_;
    val getRelation_ = fn x1 & x2 => (_import "atk_relation_set_get_relation" : AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p * FFI.Int.C.val_ -> AtkRelationClass.C.notnull AtkRelationClass.C.p;) (x1, x2)
    val getRelationByType_ = fn x1 & x2 => (_import "atk_relation_set_get_relation_by_type" : AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p * AtkRelationType.C.val_ -> AtkRelationClass.C.notnull AtkRelationClass.C.p;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "atk_relation_set_remove" : AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p * AtkRelationClass.C.notnull AtkRelationClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a AtkRelationSetClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type 'a relation_class = 'a AtkRelationClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkRelationSetClass.C.fromPtr true) new_ ()
    fun add self relation = (AtkRelationSetClass.C.withPtr &&&> AtkRelationClass.C.withPtr ---> I) add_ (self & relation)
    fun addRelationByType self relationship target =
      (
        AtkRelationSetClass.C.withPtr
         &&&> AtkRelationType.C.withVal
         &&&> AtkObjectClass.C.withPtr
         ---> I
      )
        addRelationByType_
        (
          self
           & relationship
           & target
        )
    fun contains self relationship = (AtkRelationSetClass.C.withPtr &&&> AtkRelationType.C.withVal ---> FFI.Bool.C.fromVal) contains_ (self & relationship)
    fun getNRelations self = (AtkRelationSetClass.C.withPtr ---> FFI.Int.C.fromVal) getNRelations_ self
    fun getRelation self i = (AtkRelationSetClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelation_ (self & i)
    fun getRelationByType self relationship = (AtkRelationSetClass.C.withPtr &&&> AtkRelationType.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelationByType_ (self & relationship)
    fun remove self relation = (AtkRelationSetClass.C.withPtr &&&> AtkRelationClass.C.withPtr ---> I) remove_ (self & relation)
  end
