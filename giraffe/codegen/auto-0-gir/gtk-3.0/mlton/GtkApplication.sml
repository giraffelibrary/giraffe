structure GtkApplication :>
  GTK_APPLICATION
    where type 'a class = 'a GtkApplicationClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_application_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_application_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioApplicationFlags.C.val_
               -> GtkApplicationClass.C.notnull GtkApplicationClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val addWindow_ = fn x1 & x2 => (_import "gtk_application_add_window" : GtkApplicationClass.C.notnull GtkApplicationClass.C.p * GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;) (x1, x2)
    val removeWindow_ = fn x1 & x2 => (_import "gtk_application_remove_window" : GtkApplicationClass.C.notnull GtkApplicationClass.C.p * GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkApplicationClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new applicationId flags = (Utf8.C.withPtr &&&> GioApplicationFlags.C.withVal ---> GtkApplicationClass.C.fromPtr true) new_ (applicationId & flags)
    fun addWindow self window = (GtkApplicationClass.C.withPtr &&&> GtkWindowClass.C.withPtr ---> I) addWindow_ (self & window)
    fun removeWindow self window = (GtkApplicationClass.C.withPtr &&&> GtkWindowClass.C.withPtr ---> I) removeWindow_ (self & window)
    local
      open ClosureMarshal Signal
    in
      fun windowAddedSig f = signal "window-added" (get 0w1 GtkWindowClass.t ---> ret_void) f
      fun windowRemovedSig f = signal "window-removed" (get 0w1 GtkWindowClass.t ---> ret_void) f
    end
  end
