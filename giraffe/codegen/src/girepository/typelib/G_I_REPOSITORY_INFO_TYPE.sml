signature G_I_REPOSITORY_INFO_TYPE =
  sig
    type 'a baseinfo_class
    type 'a registeredtypeinfo_class
    type 'a callableinfo_class
    type 'a functioninfo_class
    type 'a structinfo_class
    type 'a enuminfo_class
    type 'a objectinfo_class
    type 'a interfaceinfo_class
    type 'a constantinfo_class
    type 'a unioninfo_class
    type 'a valueinfo_class
    type 'a signalinfo_class
    type 'a vfuncinfo_class
    type 'a propertyinfo_class
    type 'a fieldinfo_class
    type 'a arginfo_class
    type 'a typeinfo_class

    datatype t =
      INVALID 
    | FUNCTION  of base functioninfo_class
    | CALLBACK  of base callableinfo_class
    | STRUCT    of base structinfo_class
    | BOXED     of base registeredtypeinfo_class
    | ENUM      of base enuminfo_class
    | FLAGS     of base enuminfo_class
    | OBJECT    of base objectinfo_class
    | INTERFACE of base interfaceinfo_class
    | CONSTANT  of base constantinfo_class
    | INVALID_0
    | UNION     of base unioninfo_class
    | VALUE     of base valueinfo_class
    | SIGNAL    of base signalinfo_class
    | VFUNC     of base vfuncinfo_class
    | PROPERTY  of base propertyinfo_class
    | FIELD     of base fieldinfo_class
    | ARG       of base arginfo_class
    | TYPE      of base typeinfo_class
    | UNRESOLVED

    val getType : 'a baseinfo_class -> t
  end
