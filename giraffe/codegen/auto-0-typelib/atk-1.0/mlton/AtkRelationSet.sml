structure AtkRelationSet :>
  ATK_RELATION_SET
    where type 'a class_t = 'a AtkRelationSetClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t
    where type relation_type_t = AtkRelationType.t
    where type 'a relation_class_t = 'a AtkRelationClass.t =
  struct
    val getType_ = _import "atk_relation_set_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_relation_set_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val add_ = fn x1 & x2 => (_import "atk_relation_set_add" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val addRelationByType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_relation_set_add_relation_by_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * AtkRelationType.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val contains_ = fn x1 & x2 => (_import "atk_relation_set_contains" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * AtkRelationType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val getNRelations_ = _import "atk_relation_set_get_n_relations" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getRelation_ = fn x1 & x2 => (_import "atk_relation_set_get_relation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getRelationByType_ = fn x1 & x2 => (_import "atk_relation_set_get_relation_by_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * AtkRelationType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "atk_relation_set_remove" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a AtkRelationSetClass.t
    type 'a object_class_t = 'a AtkObjectClass.t
    type relation_type_t = AtkRelationType.t
    type 'a relation_class_t = 'a AtkRelationClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkRelationSetClass.C.fromPtr true) new_ ()
    fun add self relation = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) add_ (self & relation)
    fun addRelationByType self relationship target =
      (
        GObjectObjectClass.C.withPtr
         &&&> AtkRelationType.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        addRelationByType_
        (
          self
           & relationship
           & target
        )
    fun contains self relationship = (GObjectObjectClass.C.withPtr &&&> AtkRelationType.C.withVal ---> FFI.Bool.C.fromVal) contains_ (self & relationship)
    fun getNRelations self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNRelations_ self
    fun getRelation self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelation_ (self & i)
    fun getRelationByType self relationship = (GObjectObjectClass.C.withPtr &&&> AtkRelationType.C.withVal ---> AtkRelationClass.C.fromPtr false) getRelationByType_ (self & relationship)
    fun remove self relation = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) remove_ (self & relation)
  end
