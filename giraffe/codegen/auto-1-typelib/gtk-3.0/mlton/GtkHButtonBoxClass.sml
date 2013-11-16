structure GtkHButtonBoxClass :>
  GTK_H_BUTTON_BOX_CLASS
    where type 'a buttonboxclass_t = 'a GtkButtonBoxClass.t
    where type C.notnull = GtkButtonBoxClass.C.notnull
    where type 'a C.p = 'a GtkButtonBoxClass.C.p =
  struct
    type 'a hbuttonbox = unit
    type 'a buttonboxclass_t = 'a GtkButtonBoxClass.t
    type 'a t = 'a hbuttonbox buttonboxclass_t
    fun toBase obj = obj
    val t = GtkButtonBoxClass.t
    val tOpt = GtkButtonBoxClass.tOpt
    structure C = GtkButtonBoxClass.C
  end
