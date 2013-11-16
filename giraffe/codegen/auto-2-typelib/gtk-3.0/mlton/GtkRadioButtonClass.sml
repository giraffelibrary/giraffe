structure GtkRadioButtonClass :>
  GTK_RADIO_BUTTON_CLASS
    where type 'a checkbuttonclass_t = 'a GtkCheckButtonClass.t
    where type C.notnull = GtkCheckButtonClass.C.notnull
    where type 'a C.p = 'a GtkCheckButtonClass.C.p =
  struct
    type 'a radiobutton = unit
    type 'a checkbuttonclass_t = 'a GtkCheckButtonClass.t
    type 'a t = 'a radiobutton checkbuttonclass_t
    fun toBase obj = obj
    val t = GtkCheckButtonClass.t
    val tOpt = GtkCheckButtonClass.tOpt
    structure C = GtkCheckButtonClass.C
  end
