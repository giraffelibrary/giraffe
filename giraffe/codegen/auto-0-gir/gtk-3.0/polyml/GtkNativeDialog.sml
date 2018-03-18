structure GtkNativeDialog :>
  GTK_NATIVE_DIALOG
    where type 'a class = 'a GtkNativeDialogClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_native_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val destroy_ = call (getSymbol "gtk_native_dialog_destroy") (GtkNativeDialogClass.PolyML.cPtr --> cVoid)
      val getModal_ = call (getSymbol "gtk_native_dialog_get_modal") (GtkNativeDialogClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_native_dialog_get_title") (GtkNativeDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getTransientFor_ = call (getSymbol "gtk_native_dialog_get_transient_for") (GtkNativeDialogClass.PolyML.cPtr --> GtkWindowClass.PolyML.cOptPtr)
      val getVisible_ = call (getSymbol "gtk_native_dialog_get_visible") (GtkNativeDialogClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hide_ = call (getSymbol "gtk_native_dialog_hide") (GtkNativeDialogClass.PolyML.cPtr --> cVoid)
      val run_ = call (getSymbol "gtk_native_dialog_run") (GtkNativeDialogClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val setModal_ = call (getSymbol "gtk_native_dialog_set_modal") (GtkNativeDialogClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTitle_ = call (getSymbol "gtk_native_dialog_set_title") (GtkNativeDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTransientFor_ = call (getSymbol "gtk_native_dialog_set_transient_for") (GtkNativeDialogClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cOptPtr --> cVoid)
      val show_ = call (getSymbol "gtk_native_dialog_show") (GtkNativeDialogClass.PolyML.cPtr --> cVoid)
    end
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
    fun run self = (GtkNativeDialogClass.FFI.withPtr ---> GInt.FFI.fromVal) run_ self
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
