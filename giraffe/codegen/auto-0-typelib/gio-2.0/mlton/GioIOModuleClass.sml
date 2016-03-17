structure GioIOModuleClass :>
  GIO_I_O_MODULE_CLASS
    where type C.notnull = GObjectTypeModuleClass.C.notnull
    where type 'a C.p = 'a GObjectTypeModuleClass.C.p =
  struct
    type 'a i_o_module = unit
    type 'a class = 'a i_o_module GObjectTypeModuleClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectTypeModuleClass.t
    val tOpt = GObjectTypeModuleClass.tOpt
    structure C = GObjectTypeModuleClass.C
  end
