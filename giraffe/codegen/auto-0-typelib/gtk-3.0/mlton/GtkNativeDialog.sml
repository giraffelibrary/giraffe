structure GtkNativeDialog :>
  GTK_NATIVE_DIALOG
    where type 'a class = 'a GtkNativeDialogClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_native_dialog_get_type" : unit -> GObjectType.FFI.val_;
    val destroy_ = _import "gtk_native_dialog_destroy" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p -> unit;
    val getModal_ = _import "gtk_native_dialog_get_modal" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p -> GBool.FFI.val_;
    val getTitle_ = _import "gtk_native_dialog_get_title" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p -> unit Utf8.FFI.out_p;
    val getTransientFor_ = _import "gtk_native_dialog_get_transient_for" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p -> unit GtkWindowClass.FFI.p;
    val getVisible_ = _import "gtk_native_dialog_get_visible" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p -> GBool.FFI.val_;
    val hide_ = _import "gtk_native_dialog_hide" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p -> unit;
    val run_ = _import "gtk_native_dialog_run" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p -> GInt32.FFI.val_;
    val setModal_ = fn x1 & x2 => (_import "gtk_native_dialog_set_modal" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_native_dialog_set_title" :
              GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTransientFor_ = fn x1 & x2 => (_import "gtk_native_dialog_set_transient_for" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p * unit GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val show_ = _import "gtk_native_dialog_show" : GtkNativeDialogClass.FFI.notnull GtkNativeDialogClass.FFI.p -> unit;
    type 'a class = 'a GtkNativeDialogClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun destroy self = (GtkNativeDialogClass.FFI.withPtr ---> I) destroy_ self
    fun getModal self = (GtkNativeDialogClass.FFI.withPtr ---> GBool.FFI.fromVal) getModal_ self
    fun getTitle self = (GtkNativeDialogClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getTitle_ self
    fun getTransientFor self = (GtkNativeDialogClass.FFI.withPtr ---> GtkWindowClass.FFI.fromOptPtr false) getTransientFor_ self
    fun getVisible self = (GtkNativeDialogClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun hide self = (GtkNativeDialogClass.FFI.withPtr ---> I) hide_ self
    fun run self = (GtkNativeDialogClass.FFI.withPtr ---> GInt32.FFI.fromVal) run_ self
    fun setModal self modal = (GtkNativeDialogClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setModal_ (self & modal)
    fun setTitle self title = (GtkNativeDialogClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GtkNativeDialogClass.FFI.withPtr &&&> GtkWindowClass.FFI.withOptPtr ---> I) setTransientFor_ (self & parent)
    fun show self = (GtkNativeDialogClass.FFI.withPtr ---> I) show_ self
    local
      open ClosureMarshal Signal
    in
      fun responseSig f = signal "response" (get 0w1 int ---> ret_void) f
    end
    local
      open Property
    in
      val modalProp =
        {
          get = fn x => get "modal" boolean x,
          set = fn x => set "modal" boolean x,
          new = fn x => new "modal" boolean x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x,
          new = fn x => new "title" stringOpt x
        }
      val transientForProp =
        {
          get = fn x => get "transient-for" GtkWindowClass.tOpt x,
          set = fn x => set "transient-for" GtkWindowClass.tOpt x,
          new = fn x => new "transient-for" GtkWindowClass.tOpt x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x,
          new = fn x => new "visible" boolean x
        }
    end
  end
