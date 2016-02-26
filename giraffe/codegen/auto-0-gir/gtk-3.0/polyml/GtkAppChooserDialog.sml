structure GtkAppChooserDialog :>
  GTK_APP_CHOOSER_DIALOG
    where type 'a class_t = 'a GtkAppChooserDialogClass.t
    where type 'a app_chooser_class_t = 'a GtkAppChooserClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type dialog_flags_t = GtkDialogFlags.t
    where type 'a window_class_t = 'a GtkWindowClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_dialog_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_app_chooser_dialog_new")
          (
            GObjectObjectClass.PolyML.cOptPtr
             &&> GtkDialogFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newForContentType_ =
        call (load_sym libgtk "gtk_app_chooser_dialog_new_for_content_type")
          (
            GObjectObjectClass.PolyML.cOptPtr
             &&> GtkDialogFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getHeading_ = call (load_sym libgtk "gtk_app_chooser_dialog_get_heading") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidget_ = call (load_sym libgtk "gtk_app_chooser_dialog_get_widget") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val setHeading_ = call (load_sym libgtk "gtk_app_chooser_dialog_set_heading") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkAppChooserDialogClass.t
    type 'a app_chooser_class_t = 'a GtkAppChooserClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type dialog_flags_t = GtkDialogFlags.t
    type 'a window_class_t = 'a GtkWindowClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
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
