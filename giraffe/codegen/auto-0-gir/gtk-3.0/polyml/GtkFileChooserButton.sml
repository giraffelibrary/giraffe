structure GtkFileChooserButton :>
  GTK_FILE_CHOOSER_BUTTON
    where type 'a class = 'a GtkFileChooserButtonClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_chooser_button_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_file_chooser_button_new") (Utf8.PolyML.cInPtr &&> GtkFileChooserAction.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newWithDialog_ = call (load_sym libgtk "gtk_file_chooser_button_new_with_dialog") (GtkWidgetClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getFocusOnClick_ = call (load_sym libgtk "gtk_file_chooser_button_get_focus_on_click") (GtkFileChooserButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_file_chooser_button_get_title") (GtkFileChooserButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidthChars_ = call (load_sym libgtk "gtk_file_chooser_button_get_width_chars") (GtkFileChooserButtonClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val setFocusOnClick_ = call (load_sym libgtk "gtk_file_chooser_button_set_focus_on_click") (GtkFileChooserButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_file_chooser_button_set_title") (GtkFileChooserButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setWidthChars_ = call (load_sym libgtk "gtk_file_chooser_button_set_width_chars") (GtkFileChooserButtonClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkFileChooserButtonClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.C.withPtr ---> GtkFileChooserClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new title action = (Utf8.C.withPtr &&&> GtkFileChooserAction.C.withVal ---> GtkFileChooserButtonClass.C.fromPtr false) new_ (title & action)
    fun newWithDialog dialog = (GtkWidgetClass.C.withPtr ---> GtkFileChooserButtonClass.C.fromPtr false) newWithDialog_ dialog
    fun getFocusOnClick self = (GtkFileChooserButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnClick_ self
    fun getTitle self = (GtkFileChooserButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getWidthChars self = (GtkFileChooserButtonClass.C.withPtr ---> FFI.Int.C.fromVal) getWidthChars_ self
    fun setFocusOnClick self focusOnClick = (GtkFileChooserButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setTitle self title = (GtkFileChooserButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setWidthChars self nChars = (GtkFileChooserButtonClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setWidthChars_ (self & nChars)
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
