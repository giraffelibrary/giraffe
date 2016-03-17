structure AtkGObjectAccessibleClass :>
  ATK_G_OBJECT_ACCESSIBLE_CLASS
    where type 'a object_class = 'a AtkObjectClass.class
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a g_object_accessible = unit
    type 'a object_class = 'a AtkObjectClass.class
    type 'a class = 'a g_object_accessible object_class
    type t = base class
    fun toBase obj = obj
    val t = AtkObjectClass.t
    val tOpt = AtkObjectClass.tOpt
    structure C = AtkObjectClass.C
  end
