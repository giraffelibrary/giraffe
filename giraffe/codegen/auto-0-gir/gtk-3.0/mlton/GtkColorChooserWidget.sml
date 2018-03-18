structure GtkColorChooserWidget :>
  GTK_COLOR_CHOOSER_WIDGET
    where type 'a class = 'a GtkColorChooserWidgetClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a color_chooser_class = 'a GtkColorChooserClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    val getType_ = _import "gtk_color_chooser_widget_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_color_chooser_widget_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkColorChooserWidgetClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a color_chooser_class = 'a GtkColorChooserClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asColorChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkColorChooserClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkColorChooserWidgetClass.FFI.fromPtr false) new_ ()
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
