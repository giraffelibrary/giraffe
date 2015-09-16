structure GtkRadioButtonClass :>
  GTK_RADIO_BUTTON_CLASS
    where type 'a check_button_class_t = 'a GtkCheckButtonClass.t
    where type C.notnull = GtkCheckButtonClass.C.notnull
    where type 'a C.p = 'a GtkCheckButtonClass.C.p =
  struct
    type 'a radio_button = unit
    type 'a check_button_class_t = 'a GtkCheckButtonClass.t
    type 'a t = 'a radio_button check_button_class_t
    fun toBase obj = obj
    val t = GtkCheckButtonClass.t
    val tOpt = GtkCheckButtonClass.tOpt
    structure C = GtkCheckButtonClass.C
  end
