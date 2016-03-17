structure VteTerminalClass :>
  VTE_TERMINAL_CLASS
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a terminal = unit
    type 'a class = 'a terminal GtkWidgetClass.class
    type t = base class
    fun toBase obj = obj
    val t = GtkWidgetClass.t
    val tOpt = GtkWidgetClass.tOpt
    structure C = GtkWidgetClass.C
  end
