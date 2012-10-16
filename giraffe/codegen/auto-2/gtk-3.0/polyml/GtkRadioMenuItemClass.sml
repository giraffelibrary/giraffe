structure GtkRadioMenuItemClass :>
  GTK_RADIO_MENU_ITEM_CLASS
    where type 'a checkmenuitemclass_t = 'a GtkCheckMenuItemClass.t
    where type C.notnull = GtkCheckMenuItemClass.C.notnull
    where type 'a C.p = 'a GtkCheckMenuItemClass.C.p =
  struct
    type 'a radiomenuitem = unit
    type 'a checkmenuitemclass_t = 'a GtkCheckMenuItemClass.t
    type 'a t = 'a radiomenuitem checkmenuitemclass_t
    fun toBase obj = obj
    val t = GtkCheckMenuItemClass.t
    val tOpt = GtkCheckMenuItemClass.tOpt
    structure C = GtkCheckMenuItemClass.C
  end
