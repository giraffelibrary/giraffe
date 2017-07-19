structure GtkApplication :>
  GTK_APPLICATION
    where type 'a class = 'a GtkApplicationClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_application_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_application_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioApplicationFlags.FFI.val_
               -> GtkApplicationClass.FFI.notnull GtkApplicationClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val addWindow_ = fn x1 & x2 => (_import "gtk_application_add_window" : GtkApplicationClass.FFI.notnull GtkApplicationClass.FFI.p * GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val removeWindow_ = fn x1 & x2 => (_import "gtk_application_remove_window" : GtkApplicationClass.FFI.notnull GtkApplicationClass.FFI.p * GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkApplicationClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (applicationId, flags) = (Utf8.FFI.withPtr &&&> GioApplicationFlags.FFI.withVal ---> GtkApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun addWindow self window = (GtkApplicationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) addWindow_ (self & window)
    fun removeWindow self window = (GtkApplicationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) removeWindow_ (self & window)
    local
      open ClosureMarshal Signal
    in
      fun windowAddedSig f = signal "window-added" (get 0w1 GtkWindowClass.t ---> ret_void) f
      fun windowRemovedSig f = signal "window-removed" (get 0w1 GtkWindowClass.t ---> ret_void) f
    end
  end
