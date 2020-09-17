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
    fun destroy self = (GtkNativeDialogClass.FFI.withPtr false ---> I) destroy_ self
    fun getModal self = (GtkNativeDialogClass.FFI.withPtr false ---> GBool.FFI.fromVal) getModal_ self
    fun getTitle self = (GtkNativeDialogClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getTitle_ self before GtkNativeDialogClass.FFI.touchPtr self
    fun getTransientFor self = (GtkNativeDialogClass.FFI.withPtr false ---> GtkWindowClass.FFI.fromOptPtr false) getTransientFor_ self before GtkNativeDialogClass.FFI.touchPtr self
    fun getVisible self = (GtkNativeDialogClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun hide self = (GtkNativeDialogClass.FFI.withPtr false ---> I) hide_ self
    fun run self = (GtkNativeDialogClass.FFI.withPtr false ---> GInt.FFI.fromVal) run_ self
    fun setModal self modal = (GtkNativeDialogClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setModal_ (self & modal)
    fun setTitle self title = (GtkNativeDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setTransientFor self parent = (GtkNativeDialogClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withOptPtr false ---> I) setTransientFor_ (self & parent)
    fun show self = (GtkNativeDialogClass.FFI.withPtr false ---> I) show_ self
    local
      open ClosureMarshal Signal
    in
      fun responseSig f = signal "response" (get 0w1 int ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val modalProp =
        {
          name = "modal",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val titleProp =
        {
          name = "title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val transientForProp =
        {
          name = "transient-for",
          gtype = fn () => C.gtype GtkWindowClass.tOpt (),
          get = fn x => fn () => C.get GtkWindowClass.tOpt x,
          set = fn x => C.set GtkWindowClass.tOpt x,
          init = fn x => C.set GtkWindowClass.tOpt x
        }
      val visibleProp =
        {
          name = "visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
