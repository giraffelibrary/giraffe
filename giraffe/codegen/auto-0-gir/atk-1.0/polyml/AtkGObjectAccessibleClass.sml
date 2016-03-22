structure AtkGObjectAccessibleClass :>
  ATK_G_OBJECT_ACCESSIBLE_CLASS
    where type 'a object_class = 'a AtkObjectClass.class
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a object_class = 'a AtkObjectClass.class
    open AtkObjectClass
    type 'a g_object_accessible = unit
    type 'a class = 'a g_object_accessible class
  end
