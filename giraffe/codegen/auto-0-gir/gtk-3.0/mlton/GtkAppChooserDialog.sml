structure GtkAppChooserDialog :>
  GTK_APP_CHOOSER_DIALOG
    where type 'a class = 'a GtkAppChooserDialogClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type dialog_flags_t = GtkDialogFlags.t
    where type 'a window_class = 'a GtkWindowClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_app_chooser_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_app_chooser_dialog_new" :
              unit GObjectObjectClass.C.p
               * GtkDialogFlags.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newForContentType_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_app_chooser_dialog_new_for_content_type" :
              unit GObjectObjectClass.C.p
               * GtkDialogFlags.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHeading_ = _import "gtk_app_chooser_dialog_get_heading" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getWidget_ = _import "gtk_app_chooser_dialog_get_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setHeading_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_app_chooser_dialog_set_heading" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkAppChooserDialogClass.class
    type 'a app_chooser_class = 'a GtkAppChooserClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type dialog_flags_t = GtkDialogFlags.t
    type 'a window_class = 'a GtkWindowClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.C.withPtr ---> GtkAppChooserClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new parent flags file =
      (
        GObjectObjectClass.C.withOptPtr
         &&&> GtkDialogFlags.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> GtkAppChooserDialogClass.C.fromPtr false
      )
        new_
        (
          parent
           & flags
           & file
        )
    fun newForContentType parent flags contentType =
      (
        GObjectObjectClass.C.withOptPtr
         &&&> GtkDialogFlags.C.withVal
         &&&> Utf8.C.withPtr
         ---> GtkAppChooserDialogClass.C.fromPtr false
      )
        newForContentType_
        (
          parent
           & flags
           & contentType
        )
    fun getHeading self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getHeading_ self
    fun getWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun setHeading self heading = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setHeading_ (self & heading)
    local
      open Property
    in
      val gfileProp =
        {
          get = fn x => get "gfile" GioFileClass.tOpt x,
          set = fn x => set "gfile" GioFileClass.tOpt x
        }
      val headingProp =
        {
          get = fn x => get "heading" stringOpt x,
          set = fn x => set "heading" stringOpt x
        }
    end
  end
