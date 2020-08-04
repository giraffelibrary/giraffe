structure GtkColorChooserDialog :>
  GTK_COLOR_CHOOSER_DIALOG
    where type 'a class = 'a GtkColorChooserDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a color_chooser_class = 'a GtkColorChooserClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_color_chooser_dialog_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_color_chooser_dialog_new" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GtkWindowClass.FFI.opt GtkWindowClass.FFI.p
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkColorChooserDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a color_chooser_class = 'a GtkColorChooserClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asColorChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkColorChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (title, parent) = (Utf8.FFI.withOptPtr 0 &&&> GtkWindowClass.FFI.withOptPtr false ---> GtkColorChooserDialogClass.FFI.fromPtr false) new_ (title & parent)
    local
      open Property
    in
      val showEditorProp =
        {
          get = fn x => get "show-editor" boolean x,
          set = fn x => set "show-editor" boolean x,
          new = fn x => new "show-editor" boolean x
        }
    end
  end
