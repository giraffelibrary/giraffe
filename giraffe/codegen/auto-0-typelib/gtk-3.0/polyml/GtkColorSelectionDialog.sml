structure GtkColorSelectionDialog :>
  GTK_COLOR_SELECTION_DIALOG
    where type 'a class = 'a GtkColorSelectionDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_color_selection_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_color_selection_dialog_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getColorSelection_ = call (getSymbol "gtk_color_selection_dialog_get_color_selection") (GtkColorSelectionDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkColorSelectionDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new title = (Utf8.FFI.withPtr 0 ---> GtkColorSelectionDialogClass.FFI.fromPtr false) new_ title
    fun getColorSelection self = (GtkColorSelectionDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getColorSelection_ self
    local
      open ValueAccessor
    in
      val cancelButtonProp =
        {
          name = "cancel-button",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val colorSelectionProp =
        {
          name = "color-selection",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val helpButtonProp =
        {
          name = "help-button",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val okButtonProp =
        {
          name = "ok-button",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
