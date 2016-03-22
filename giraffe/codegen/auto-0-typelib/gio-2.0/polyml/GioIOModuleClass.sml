structure GioIOModuleClass :>
  GIO_I_O_MODULE_CLASS
    where type C.notnull = GObjectTypeModuleClass.C.notnull
    where type 'a C.p = 'a GObjectTypeModuleClass.C.p =
  struct
    open GObjectTypeModuleClass
    type 'a i_o_module = unit
    type 'a class = 'a i_o_module class
  end
