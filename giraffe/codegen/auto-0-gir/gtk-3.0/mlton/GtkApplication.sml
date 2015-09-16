structure GtkApplication :>
  GTK_APPLICATION
    where type 'a class_t = 'a GtkApplicationClass.t
    where type 'a window_class_t = 'a GtkWindowClass.t =
  struct
    val getType_ = _import "gtk_application_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_application_new" :
              cstring
               * unit CPointer.t
               * GioApplicationFlags.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val addWindow_ = fn x1 & x2 => (_import "gtk_application_add_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val removeWindow_ = fn x1 & x2 => (_import "gtk_application_remove_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkApplicationClass.t
    type 'a window_class_t = 'a GtkWindowClass.t
    type t = base class_t
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new applicationId flags = (FFI.String.C.withConstPtr &&&> GioApplicationFlags.C.withVal ---> GtkApplicationClass.C.fromPtr true) new_ (applicationId & flags)
    fun addWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addWindow_ (self & window)
    fun removeWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeWindow_ (self & window)
    local
      open ClosureMarshal Signal
    in
      fun windowAddedSig f = signal "window-added" (get 0w1 GtkWindowClass.t ---> ret_void) f
      fun windowRemovedSig f = signal "window-removed" (get 0w1 GtkWindowClass.t ---> ret_void) f
    end
  end
