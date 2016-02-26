structure AtkRelation :>
  ATK_RELATION
    where type 'a class_t = 'a AtkRelationClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t
    where type relation_type_t = AtkRelationType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_relation_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libatk "atk_relation_new")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> AtkRelationType.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val addTarget_ = call (load_sym libatk "atk_relation_add_target") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getRelationType_ = call (load_sym libatk "atk_relation_get_relation_type") (GObjectObjectClass.PolyML.cPtr --> AtkRelationType.PolyML.cVal)
      val removeTarget_ = call (load_sym libatk "atk_relation_remove_target") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a AtkRelationClass.t
    type 'a object_class_t = 'a AtkObjectClass.t
    type relation_type_t = AtkRelationType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new targets nTargets relationship =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
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
    fun removeTarget self target = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) removeTarget_ (self & target)
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
