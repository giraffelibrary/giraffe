structure AtkRelation :>
  ATK_RELATION
    where type 'a class_t = 'a AtkRelationClass.t
    where type 'a objectclass_t = 'a AtkObjectClass.t
    where type relationtype_t = AtkRelationType.t =
  struct
    val getType_ = _import "atk_relation_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_relation_new" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * AtkRelationType.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val addTarget_ = fn x1 & x2 => (_import "atk_relation_add_target" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getRelationType_ = _import "atk_relation_get_relation_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> AtkRelationType.C.val_;
    val removeTarget_ = fn x1 & x2 => (_import "atk_relation_remove_target" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;) (x1, x2)
    type 'a class_t = 'a AtkRelationClass.t
    type 'a objectclass_t = 'a AtkObjectClass.t
    type relationtype_t = AtkRelationType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new targets nTargets relationship =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> AtkRelationType.C.withVal
         ---> AtkRelationClass.C.fromPtr true
      )
        new_
        (
          targets
           & nTargets
           & relationship
        )
    fun addTarget self target = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addTarget_ (self & target)
    fun getRelationType self = (GObjectObjectClass.C.withPtr ---> AtkRelationType.C.fromVal) getRelationType_ self
    fun removeTarget self target = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) removeTarget_ (self & target)
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
