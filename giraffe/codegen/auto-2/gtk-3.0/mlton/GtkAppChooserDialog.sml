structure GtkAppChooserDialog :>
  GTK_APP_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkAppChooserDialogClass.t
    where type 'a appchooserclass_t = 'a GtkAppChooserClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type dialogflags_t = GtkDialogFlags.t
    where type 'a windowclass_t = 'a GtkWindowClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
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
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHeading_ = _import "gtk_app_chooser_dialog_get_heading" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getWidget_ = _import "gtk_app_chooser_dialog_get_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setHeading_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_app_chooser_dialog_set_heading" :
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
    type 'a class_t = 'a GtkAppChooserDialogClass.t
    type 'a appchooserclass_t = 'a GtkAppChooserClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type dialogflags_t = GtkDialogFlags.t
    type 'a windowclass_t = 'a GtkWindowClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
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
         &&&> FFI.String.withConstPtr
         ---> GtkAppChooserDialogClass.C.fromPtr false
      )
        newForContentType_
        (
          parent
           & flags
           & contentType
        )
    fun getHeading self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getHeading_ self
    fun getWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun setHeading self heading = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setHeading_ (self & heading)
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
