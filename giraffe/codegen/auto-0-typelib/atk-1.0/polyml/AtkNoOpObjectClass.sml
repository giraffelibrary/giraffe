structure AtkNoOpObjectClass :>
  ATK_NO_OP_OBJECT_CLASS
    where type 'a object_class = 'a AtkObjectClass.class
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a object_class = 'a AtkObjectClass.class
    open AtkObjectClass
    type 'a no_op_object = unit
    type 'a class = 'a no_op_object class
  end
