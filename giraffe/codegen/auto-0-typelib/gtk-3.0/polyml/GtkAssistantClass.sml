structure GtkAssistantClass :>
  GTK_ASSISTANT_CLASS
    where type 'a window_class_t = 'a GtkWindowClass.t
    where type C.notnull = GtkWindowClass.C.notnull
    where type 'a C.p = 'a GtkWindowClass.C.p =
  struct
    type 'a assistant = unit
    type 'a window_class_t = 'a GtkWindowClass.t
    type 'a t = 'a assistant window_class_t
    fun toBase obj = obj
    val t = GtkWindowClass.t
    val tOpt = GtkWindowClass.tOpt
    structure C = GtkWindowClass.C
  end
