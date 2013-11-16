structure AtkNoOpObjectClass :>
  ATK_NO_OP_OBJECT_CLASS
    where type 'a objectclass_t = 'a AtkObjectClass.t
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a noopobject = unit
    type 'a objectclass_t = 'a AtkObjectClass.t
    type 'a t = 'a noopobject objectclass_t
    fun toBase obj = obj
    val t = AtkObjectClass.t
    val tOpt = AtkObjectClass.tOpt
    structure C = AtkObjectClass.C
  end
