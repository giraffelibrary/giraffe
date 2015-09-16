structure GtkSpinButtonClass :>
  GTK_SPIN_BUTTON_CLASS
    where type 'a entry_class_t = 'a GtkEntryClass.t
    where type C.notnull = GtkEntryClass.C.notnull
    where type 'a C.p = 'a GtkEntryClass.C.p =
  struct
    type 'a spin_button = unit
    type 'a entry_class_t = 'a GtkEntryClass.t
    type 'a t = 'a spin_button entry_class_t
    fun toBase obj = obj
    val t = GtkEntryClass.t
    val tOpt = GtkEntryClass.tOpt
    structure C = GtkEntryClass.C
  end
