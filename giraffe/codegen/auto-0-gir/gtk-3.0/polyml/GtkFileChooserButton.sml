structure GtkFileChooserButton :>
  GTK_FILE_CHOOSER_BUTTON
    where type 'a class_t = 'a GtkFileChooserButtonClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a file_chooser_class_t = 'a GtkFileChooserClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_chooser_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_file_chooser_button_new") (Utf8.PolyML.cInPtr &&> GtkFileChooserAction.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val newWithDialog_ = call (load_sym libgtk "gtk_file_chooser_button_new_with_dialog") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getFocusOnClick_ = call (load_sym libgtk "gtk_file_chooser_button_get_focus_on_click") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_file_chooser_button_get_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidthChars_ = call (load_sym libgtk "gtk_file_chooser_button_get_width_chars") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val setFocusOnClick_ = call (load_sym libgtk "gtk_file_chooser_button_set_focus_on_click") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_file_chooser_button_set_title") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setWidthChars_ = call (load_sym libgtk "gtk_file_chooser_button_set_width_chars") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkFileChooserButtonClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a file_chooser_class_t = 'a GtkFileChooserClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title action = (Utf8.C.withPtr &&&> GtkFileChooserAction.C.withVal ---> GtkFileChooserButtonClass.C.fromPtr false) new_ (title & action)
    fun newWithDialog dialog = (GObjectObjectClass.C.withPtr ---> GtkFileChooserButtonClass.C.fromPtr false) newWithDialog_ dialog
    fun getFocusOnClick self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnClick_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getWidthChars self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidthChars_ self
    fun setFocusOnClick self focusOnClick = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setWidthChars self nChars = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setWidthChars_ (self & nChars)
    local
      open ClosureMarshal Signal
    in
      fun fileSetSig f = signal "file-set" (void ---> ret_void) f
    end
    local
      open Property
    in
      val dialogProp = {set = fn x => set "dialog" GtkFileChooserClass.tOpt x}
      val focusOnClickProp =
        {
          get = fn x => get "focus-on-click" boolean x,
          set = fn x => set "focus-on-click" boolean x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val widthCharsProp =
        {
          get = fn x => get "width-chars" int x,
          set = fn x => set "width-chars" int x
        }
    end
  end
