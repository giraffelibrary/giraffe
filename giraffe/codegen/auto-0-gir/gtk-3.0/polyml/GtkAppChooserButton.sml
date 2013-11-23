structure GtkAppChooserButton :>
  GTK_APP_CHOOSER_BUTTON
    where type 'a class_t = 'a GtkAppChooserButtonClass.t
    where type 'a appchooserclass_t = 'a GtkAppChooserClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a celleditableclass_t = 'a GtkCellEditableClass.t
    where type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_app_chooser_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_app_chooser_button_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val appendCustomItem_ =
        call (load_sym libgtk "gtk_app_chooser_button_append_custom_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val appendSeparator_ = call (load_sym libgtk "gtk_app_chooser_button_append_separator") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getHeading_ = call (load_sym libgtk "gtk_app_chooser_button_get_heading") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getShowDefaultItem_ = call (load_sym libgtk "gtk_app_chooser_button_get_show_default_item") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowDialogItem_ = call (load_sym libgtk "gtk_app_chooser_button_get_show_dialog_item") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setActiveCustomItem_ = call (load_sym libgtk "gtk_app_chooser_button_set_active_custom_item") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setHeading_ = call (load_sym libgtk "gtk_app_chooser_button_set_heading") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setShowDefaultItem_ = call (load_sym libgtk "gtk_app_chooser_button_set_show_default_item") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowDialogItem_ = call (load_sym libgtk "gtk_app_chooser_button_set_show_dialog_item") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAppChooserButtonClass.t
    type 'a appchooserclass_t = 'a GtkAppChooserClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a celleditableclass_t = 'a GtkCellEditableClass.t
    type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.C.withPtr ---> GtkAppChooserClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new contentType = (FFI.String.C.withConstPtr ---> GtkAppChooserButtonClass.C.fromPtr false) new_ contentType
    fun appendCustomItem self name label icon =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        appendCustomItem_
        (
          self
           & name
           & label
           & icon
        )
    fun appendSeparator self = (GObjectObjectClass.C.withPtr ---> I) appendSeparator_ self
    fun getHeading self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getHeading_ self
    fun getShowDefaultItem self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowDefaultItem_ self
    fun getShowDialogItem self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowDialogItem_ self
    fun setActiveCustomItem self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setActiveCustomItem_ (self & name)
    fun setHeading self heading = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setHeading_ (self & heading)
    fun setShowDefaultItem self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowDefaultItem_ (self & setting)
    fun setShowDialogItem self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowDialogItem_ (self & setting)
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
