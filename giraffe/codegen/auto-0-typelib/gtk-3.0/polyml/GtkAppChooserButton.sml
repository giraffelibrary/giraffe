structure GtkAppChooserButton :>
  GTK_APP_CHOOSER_BUTTON
    where type 'a class = 'a GtkAppChooserButtonClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_app_chooser_button_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val appendCustomItem_ =
        call (load_sym libgtk "gtk_app_chooser_button_append_custom_item")
          (
            GtkAppChooserButtonClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioIconClass.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val appendSeparator_ = call (load_sym libgtk "gtk_app_chooser_button_append_separator") (GtkAppChooserButtonClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getHeading_ = call (load_sym libgtk "gtk_app_chooser_button_get_heading") (GtkAppChooserButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowDefaultItem_ = call (load_sym libgtk "gtk_app_chooser_button_get_show_default_item") (GtkAppChooserButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowDialogItem_ = call (load_sym libgtk "gtk_app_chooser_button_get_show_dialog_item") (GtkAppChooserButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setActiveCustomItem_ = call (load_sym libgtk "gtk_app_chooser_button_set_active_custom_item") (GtkAppChooserButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setHeading_ = call (load_sym libgtk "gtk_app_chooser_button_set_heading") (GtkAppChooserButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setShowDefaultItem_ = call (load_sym libgtk "gtk_app_chooser_button_set_show_default_item") (GtkAppChooserButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setShowDialogItem_ = call (load_sym libgtk "gtk_app_chooser_button_set_show_dialog_item") (GtkAppChooserButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkAppChooserButtonClass.class
    type 'a app_chooser_class = 'a GtkAppChooserClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.C.withPtr ---> GtkAppChooserClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new contentType = (Utf8.C.withPtr ---> GtkAppChooserButtonClass.C.fromPtr false) new_ contentType
    fun appendCustomItem self name label icon =
      (
        GtkAppChooserButtonClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioIconClass.C.withPtr
         ---> I
      )
        appendCustomItem_
        (
          self
           & name
           & label
           & icon
        )
    fun appendSeparator self = (GtkAppChooserButtonClass.C.withPtr ---> I) appendSeparator_ self
    fun getHeading self = (GtkAppChooserButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getHeading_ self
    fun getShowDefaultItem self = (GtkAppChooserButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowDefaultItem_ self
    fun getShowDialogItem self = (GtkAppChooserButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowDialogItem_ self
    fun setActiveCustomItem self name = (GtkAppChooserButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setActiveCustomItem_ (self & name)
    fun setHeading self heading = (GtkAppChooserButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setHeading_ (self & heading)
    fun setShowDefaultItem self setting = (GtkAppChooserButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowDefaultItem_ (self & setting)
    fun setShowDialogItem self setting = (GtkAppChooserButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowDialogItem_ (self & setting)
    local
      open ClosureMarshal Signal
    in
      fun customItemActivatedSig f = signal "custom-item-activated" (get 0w1 string ---> ret_void) f
    end
    local
      open Property
    in
      val headingProp =
        {
          get = fn x => get "heading" stringOpt x,
          set = fn x => set "heading" stringOpt x
        }
      val showDefaultItemProp =
        {
          get = fn x => get "show-default-item" boolean x,
          set = fn x => set "show-default-item" boolean x
        }
      val showDialogItemProp =
        {
          get = fn x => get "show-dialog-item" boolean x,
          set = fn x => set "show-dialog-item" boolean x
        }
    end
  end
