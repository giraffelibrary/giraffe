structure GtkAppChooserDialog :>
  GTK_APP_CHOOSER_DIALOG
    where type 'a class = 'a GtkAppChooserDialogClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type dialog_flags_t = GtkDialogFlags.t
    where type 'a window_class = 'a GtkWindowClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_app_chooser_dialog_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_app_chooser_dialog_new" :
              unit GtkWindowClass.FFI.p
               * GtkDialogFlags.FFI.val_
               * GioFileClass.FFI.notnull GioFileClass.FFI.p
               -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
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
              unit GtkWindowClass.FFI.p
               * GtkDialogFlags.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHeading_ = _import "gtk_app_chooser_dialog_get_heading" : GtkAppChooserDialogClass.FFI.notnull GtkAppChooserDialogClass.FFI.p -> unit Utf8.FFI.out_p;
    val getWidget_ = _import "gtk_app_chooser_dialog_get_widget" : GtkAppChooserDialogClass.FFI.notnull GtkAppChooserDialogClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val setHeading_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_app_chooser_dialog_set_heading" :
              GtkAppChooserDialogClass.FFI.notnull GtkAppChooserDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkAppChooserClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        parent,
        flags,
        file
      ) =
      (
        GtkWindowClass.FFI.withOptPtr
         &&&> GtkDialogFlags.FFI.withVal
         &&&> GioFileClass.FFI.withPtr
         ---> GtkAppChooserDialogClass.FFI.fromPtr false
      )
        new_
        (
          parent
           & flags
           & file
        )
    fun newForContentType
      (
        parent,
        flags,
        contentType
      ) =
      (
        GtkWindowClass.FFI.withOptPtr
         &&&> GtkDialogFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> GtkAppChooserDialogClass.FFI.fromPtr false
      )
        newForContentType_
        (
          parent
           & flags
           & contentType
        )
    fun getHeading self = (GtkAppChooserDialogClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getHeading_ self
    fun getWidget self = (GtkAppChooserDialogClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self
    fun setHeading self heading = (GtkAppChooserDialogClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setHeading_ (self & heading)
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
