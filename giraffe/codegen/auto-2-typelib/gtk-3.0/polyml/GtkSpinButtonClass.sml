structure GtkSpinButtonClass :>
  GTK_SPIN_BUTTON_CLASS
    where type 'a entryclass_t = 'a GtkEntryClass.t
    where type C.notnull = GtkEntryClass.C.notnull
    where type 'a C.p = 'a GtkEntryClass.C.p =
  struct
    type 'a spinbutton = unit
    type 'a entryclass_t = 'a GtkEntryClass.t
    type 'a t = 'a spinbutton entryclass_t
    fun toBase obj = obj
    val t = GtkEntryClass.t
    val tOpt = GtkEntryClass.tOpt
    structure C = GtkEntryClass.C
  end
