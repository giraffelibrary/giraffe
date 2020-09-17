structure GtkFileChooserButton :>
  GTK_FILE_CHOOSER_BUTTON
    where type 'a class = 'a GtkFileChooserButtonClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a dialog_class = 'a GtkDialogClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_file_chooser_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_file_chooser_button_new") (Utf8.PolyML.cInPtr &&> GtkFileChooserAction.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newWithDialog_ = call (getSymbol "gtk_file_chooser_button_new_with_dialog") (GtkDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getFocusOnClick_ = call (getSymbol "gtk_file_chooser_button_get_focus_on_click") (GtkFileChooserButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_file_chooser_button_get_title") (GtkFileChooserButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidthChars_ = call (getSymbol "gtk_file_chooser_button_get_width_chars") (GtkFileChooserButtonClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val setFocusOnClick_ = call (getSymbol "gtk_file_chooser_button_set_focus_on_click") (GtkFileChooserButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTitle_ = call (getSymbol "gtk_file_chooser_button_set_title") (GtkFileChooserButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setWidthChars_ = call (getSymbol "gtk_file_chooser_button_set_width_chars") (GtkFileChooserButtonClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkFileChooserButtonClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a dialog_class = 'a GtkDialogClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkFileChooserClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (title, action) = (Utf8.FFI.withPtr 0 &&&> GtkFileChooserAction.FFI.withVal ---> GtkFileChooserButtonClass.FFI.fromPtr false) new_ (title & action) before Utf8.FFI.touchPtr title
    fun newWithDialog dialog = (GtkDialogClass.FFI.withPtr false ---> GtkFileChooserButtonClass.FFI.fromPtr false) newWithDialog_ dialog before GtkDialogClass.FFI.touchPtr dialog
    fun getFocusOnClick self = (GtkFileChooserButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFocusOnClick_ self
    fun getTitle self = (GtkFileChooserButtonClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self before GtkFileChooserButtonClass.FFI.touchPtr self
    fun getWidthChars self = (GtkFileChooserButtonClass.FFI.withPtr false ---> GInt.FFI.fromVal) getWidthChars_ self
    fun setFocusOnClick self focusOnClick = (GtkFileChooserButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setTitle self title = (GtkFileChooserButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setWidthChars self nChars = (GtkFileChooserButtonClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setWidthChars_ (self & nChars)
    local
      open ClosureMarshal Signal
    in
      fun fileSetSig f = signal "file-set" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val dialogProp =
        {
          name = "dialog",
          gtype = fn () => C.gtype GtkFileChooserClass.tOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GtkFileChooserClass.tOpt x
        }
      val titleProp =
        {
          name = "title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val widthCharsProp =
        {
          name = "width-chars",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
