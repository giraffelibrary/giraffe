structure GObjectInitiallyUnownedClass :>
  G_OBJECT_INITIALLY_UNOWNED_CLASS
    where type 'a object_class = 'a GObjectObjectClass.class
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a object_class = 'a GObjectObjectClass.class
    open GObjectObjectClass
    type 'a initially_unowned = unit
    type 'a class = 'a initially_unowned class
  end
