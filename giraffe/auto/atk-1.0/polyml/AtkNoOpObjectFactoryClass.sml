structure AtkNoOpObjectFactoryClass :>
  ATK_NO_OP_OBJECT_FACTORY_CLASS
    where type 'a objectfactoryclass_t = 'a AtkObjectFactoryClass.t
    where type C.notnull = AtkObjectFactoryClass.C.notnull
    where type 'a C.p = 'a AtkObjectFactoryClass.C.p =
  struct
    type 'a noopobjectfactory = unit
    type 'a objectfactoryclass_t = 'a AtkObjectFactoryClass.t
    type 'a t = 'a noopobjectfactory objectfactoryclass_t
    fun toBase obj = obj
    val t = AtkObjectFactoryClass.t
    val tOpt = AtkObjectFactoryClass.tOpt
    structure C = AtkObjectFactoryClass.C
  end
