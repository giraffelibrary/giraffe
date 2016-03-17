structure AtkNoOpObjectClass :>
  ATK_NO_OP_OBJECT_CLASS
    where type 'a object_class = 'a AtkObjectClass.class
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a no_op_object = unit
    type 'a object_class = 'a AtkObjectClass.class
    type 'a class = 'a no_op_object object_class
    type t = base class
    fun toBase obj = obj
    val t = AtkObjectClass.t
    val tOpt = AtkObjectClass.tOpt
    structure C = AtkObjectClass.C
  end
