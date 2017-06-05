structure GtkFileChooserButton :>
  GTK_FILE_CHOOSER_BUTTON
    where type 'a class = 'a GtkFileChooserButtonClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a file_chooser_class = 'a GtkFileChooserClass.class =
  struct
    val getType_ = _import "gtk_file_chooser_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_file_chooser_button_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkFileChooserAction.FFI.val_
               -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithDialog_ = _import "gtk_file_chooser_button_new_with_dialog" : GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getFocusOnClick_ = _import "gtk_file_chooser_button_get_focus_on_click" : GtkFileChooserButtonClass.FFI.notnull GtkFileChooserButtonClass.FFI.p -> GBool.FFI.val_;
    val getTitle_ = _import "gtk_file_chooser_button_get_title" : GtkFileChooserButtonClass.FFI.notnull GtkFileChooserButtonClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getWidthChars_ = _import "gtk_file_chooser_button_get_width_chars" : GtkFileChooserButtonClass.FFI.notnull GtkFileChooserButtonClass.FFI.p -> GInt.FFI.val_;
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_file_chooser_button_set_focus_on_click" : GtkFileChooserButtonClass.FFI.notnull GtkFileChooserButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_button_set_title" :
              GtkFileChooserButtonClass.FFI.notnull GtkFileChooserButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWidthChars_ = fn x1 & x2 => (_import "gtk_file_chooser_button_set_width_chars" : GtkFileChooserButtonClass.FFI.notnull GtkFileChooserButtonClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkFileChooserButtonClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type file_chooser_action_t = GtkFileChooserAction.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a file_chooser_class = 'a GtkFileChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asFileChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkFileChooserClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new title action = (Utf8.FFI.withPtr &&&> GtkFileChooserAction.FFI.withVal ---> GtkFileChooserButtonClass.FFI.fromPtr false) new_ (title & action)
    fun newWithDialog dialog = (GtkWidgetClass.FFI.withPtr ---> GtkFileChooserButtonClass.FFI.fromPtr false) newWithDialog_ dialog
    fun getFocusOnClick self = (GtkFileChooserButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusOnClick_ self
    fun getTitle self = (GtkFileChooserButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getWidthChars self = (GtkFileChooserButtonClass.FFI.withPtr ---> GInt.FFI.fromVal) getWidthChars_ self
    fun setFocusOnClick self focusOnClick = (GtkFileChooserButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setTitle self title = (GtkFileChooserButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setWidthChars self nChars = (GtkFileChooserButtonClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setWidthChars_ (self & nChars)
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
