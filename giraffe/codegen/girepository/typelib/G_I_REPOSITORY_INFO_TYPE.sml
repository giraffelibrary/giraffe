signature G_I_REPOSITORY_INFO_TYPE =
  sig
    type 'a baseinfoclass_t
    type 'a registeredtypeinfoclass_t
    type 'a functioninfoclass_t
    type 'a structinfoclass_t
    type 'a enuminfoclass_t
    type 'a objectinfoclass_t
    type 'a interfaceinfoclass_t
    type 'a constantinfoclass_t
    type 'a unioninfoclass_t
    type 'a valueinfoclass_t
    type 'a signalinfoclass_t
    type 'a vfuncinfoclass_t
    type 'a propertyinfoclass_t
    type 'a fieldinfoclass_t
    type 'a arginfoclass_t
    type 'a typeinfoclass_t

    datatype t =
      INVALID 
    | FUNCTION  of base functioninfoclass_t
    | CALLBACK  of base functioninfoclass_t
    | STRUCT    of base structinfoclass_t
    | BOXED     of base registeredtypeinfoclass_t
    | ENUM      of base enuminfoclass_t
    | FLAGS     of base enuminfoclass_t
    | OBJECT    of base objectinfoclass_t
    | INTERFACE of base interfaceinfoclass_t
    | CONSTANT  of base constantinfoclass_t
    | INVALID_0
    | UNION     of base unioninfoclass_t
    | VALUE     of base valueinfoclass_t
    | SIGNAL    of base signalinfoclass_t
    | VFUNC     of base vfuncinfoclass_t
    | PROPERTY  of base propertyinfoclass_t
    | FIELD     of base fieldinfoclass_t
    | ARG       of base arginfoclass_t
    | TYPE      of base typeinfoclass_t
    | UNRESOLVED

    val getType : 'a baseinfoclass_t -> t
  end
