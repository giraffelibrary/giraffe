structure VteTerminalClass :>
  VTE_TERMINAL_CLASS
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    open GtkWidgetClass
    type 'a terminal = unit
    type 'a class = 'a terminal class
  end
