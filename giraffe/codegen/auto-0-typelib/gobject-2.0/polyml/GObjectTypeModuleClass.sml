structure GObjectTypeModuleClass :>
  G_OBJECT_TYPE_MODULE_CLASS
    where type 'a object_class = 'a GObjectObjectClass.class
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a object_class = 'a GObjectObjectClass.class
    open GObjectObjectClass
    type 'a type_module = unit
    type 'a class = 'a type_module class
  end
