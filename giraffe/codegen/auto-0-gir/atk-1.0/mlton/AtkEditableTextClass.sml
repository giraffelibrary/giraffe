structure AtkEditableTextClass :>
  ATK_EDITABLE_TEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a editable_text = unit
    type 'a class = 'a editable_text class
  end
