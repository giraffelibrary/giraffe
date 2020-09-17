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
              GtkWindowClass.FFI.opt GtkWindowClass.FFI.p
               * GtkDialogFlags.FFI.val_
               * GioFileClass.FFI.non_opt GioFileClass.FFI.p
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
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
              GtkWindowClass.FFI.opt GtkWindowClass.FFI.p
               * GtkDialogFlags.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHeading_ = _import "gtk_app_chooser_dialog_get_heading" : GtkAppChooserDialogClass.FFI.non_opt GtkAppChooserDialogClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getWidget_ = _import "gtk_app_chooser_dialog_get_widget" : GtkAppChooserDialogClass.FFI.non_opt GtkAppChooserDialogClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val setHeading_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_app_chooser_dialog_set_heading" :
              GtkAppChooserDialogClass.FFI.non_opt GtkAppChooserDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkAppChooserClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        parent,
        flags,
        file
      ) =
      (
        GtkWindowClass.FFI.withOptPtr false
         &&&> GtkDialogFlags.FFI.withVal
         &&&> GioFileClass.FFI.withPtr false
         ---> GtkAppChooserDialogClass.FFI.fromPtr false
      )
        new_
        (
          parent
           & flags
           & file
        )
       before GtkWindowClass.FFI.touchOptPtr parent
       before GioFileClass.FFI.touchPtr file
    fun newForContentType
      (
        parent,
        flags,
        contentType
      ) =
      (
        GtkWindowClass.FFI.withOptPtr false
         &&&> GtkDialogFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GtkAppChooserDialogClass.FFI.fromPtr false
      )
        newForContentType_
        (
          parent
           & flags
           & contentType
        )
       before GtkWindowClass.FFI.touchOptPtr parent
       before Utf8.FFI.touchPtr contentType
    fun getHeading self = (GtkAppChooserDialogClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getHeading_ self before GtkAppChooserDialogClass.FFI.touchPtr self
    fun getWidget self = (GtkAppChooserDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self before GtkAppChooserDialogClass.FFI.touchPtr self
    fun setHeading self heading = (GtkAppChooserDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setHeading_ (self & heading)
    local
      open ValueAccessor
    in
      val gfileProp =
        {
          name = "gfile",
          gtype = fn () => C.gtype GioFileClass.tOpt (),
          get = fn x => fn () => C.get GioFileClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioFileClass.tOpt x
        }
      val headingProp =
        {
          name = "heading",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
