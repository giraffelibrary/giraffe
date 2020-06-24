structure AtkEditableTextClass :>
  ATK_EDITABLE_TEXT_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a editable_text = unit
    type 'a class = 'a editable_text class
  end
