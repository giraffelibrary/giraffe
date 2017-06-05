structure AtkRelation :>
  ATK_RELATION
    where type 'a class = 'a AtkRelationClass.class
    where type 'a object_class = 'a AtkObjectClass.class
    where type relation_type_t = AtkRelationType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_relation_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libatk "atk_relation_new")
          (
            AtkObjectClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> AtkRelationType.PolyML.cVal
             --> AtkRelationClass.PolyML.cPtr
          )
      val addTarget_ = call (load_sym libatk "atk_relation_add_target") (AtkRelationClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getRelationType_ = call (load_sym libatk "atk_relation_get_relation_type") (AtkRelationClass.PolyML.cPtr --> AtkRelationType.PolyML.cVal)
      val removeTarget_ = call (load_sym libatk "atk_relation_remove_target") (AtkRelationClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a AtkRelationClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type relation_type_t = AtkRelationType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new targets nTargets relationship =
      (
        AtkObjectClass.FFI.withPtr
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
