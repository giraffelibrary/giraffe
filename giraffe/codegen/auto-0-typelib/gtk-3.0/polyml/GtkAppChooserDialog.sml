structure GtkAppChooserDialog :>
  GTK_APP_CHOOSER_DIALOG
    where type 'a class = 'a GtkAppChooserDialogClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type dialog_flags_t = GtkDialogFlags.t
    where type 'a window_class = 'a GtkWindowClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_dialog_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_app_chooser_dialog_new")
          (
            GtkWindowClass.PolyML.cOptPtr
             &&> GtkDialogFlags.PolyML.cVal
             &&> GioFileClass.PolyML.cPtr
             --> GtkWidgetClass.PolyML.cPtr
          )
      val newForContentType_ =
        call (load_sym libgtk "gtk_app_chooser_dialog_new_for_content_type")
          (
            GtkWindowClass.PolyML.cOptPtr
             &&> GtkDialogFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GtkWidgetClass.PolyML.cPtr
          )
      val getHeading_ = call (load_sym libgtk "gtk_app_chooser_dialog_get_heading") (GtkAppChooserDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidget_ = call (load_sym libgtk "gtk_app_chooser_dialog_get_widget") (GtkAppChooserDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setHeading_ = call (load_sym libgtk "gtk_app_chooser_dialog_set_heading") (GtkAppChooserDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
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
        GtkWindowClass.C.withOptPtr
         &&&> GtkDialogFlags.C.withVal
         &&&> GioFileClass.C.withPtr
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
        GtkWindowClass.C.withOptPtr
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
    fun getHeading self = (GtkAppChooserDialogClass.C.withPtr ---> Utf8.C.fromPtr false) getHeading_ self
    fun getWidget self = (GtkAppChooserDialogClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun setHeading self heading = (GtkAppChooserDialogClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setHeading_ (self & heading)
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
