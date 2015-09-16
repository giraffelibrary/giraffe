structure GtkFileChooserButton :>
  GTK_FILE_CHOOSER_BUTTON
    where type 'a class_t = 'a GtkFileChooserButtonClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type file_chooser_action_t = GtkFileChooserAction.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a file_chooser_class_t = 'a GtkFileChooserClass.t =
  struct
    val getType_ = _import "gtk_file_chooser_button_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_file_chooser_button_new" :
              cstring
               * unit CPointer.t
               * GtkFileChooserAction.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithDialog_ = _import "gtk_file_chooser_button_new_with_dialog" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFocusOnClick_ = _import "gtk_file_chooser_button_get_focus_on_click" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getTitle_ = _import "gtk_file_chooser_button_get_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getWidthChars_ = _import "gtk_file_chooser_button_get_width_chars" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_file_chooser_button_set_focus_on_click" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_chooser_button_set_title" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWidthChars_ = fn x1 & x2 => (_import "gtk_file_chooser_button_set_width_chars" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
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
    fun new title action = (FFI.String.C.withConstPtr &&&> GtkFileChooserAction.C.withVal ---> GtkFileChooserButtonClass.C.fromPtr false) new_ (title & action)
    fun newWithDialog dialog = (GObjectObjectClass.C.withPtr ---> GtkFileChooserButtonClass.C.fromPtr false) newWithDialog_ dialog
    fun getFocusOnClick self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnClick_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTitle_ self
    fun getWidthChars self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidthChars_ self
    fun setFocusOnClick self focusOnClick = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTitle_ (self & title)
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
