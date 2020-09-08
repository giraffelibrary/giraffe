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
      val getType_ = call (getSymbol "gtk_app_chooser_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_app_chooser_button_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val appendCustomItem_ =
        call (getSymbol "gtk_app_chooser_button_append_custom_item")
          (
            GtkAppChooserButtonClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioIconClass.PolyML.cPtr
             --> cVoid
          )
      val appendSeparator_ = call (getSymbol "gtk_app_chooser_button_append_separator") (GtkAppChooserButtonClass.PolyML.cPtr --> cVoid)
      val getHeading_ = call (getSymbol "gtk_app_chooser_button_get_heading") (GtkAppChooserButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getShowDefaultItem_ = call (getSymbol "gtk_app_chooser_button_get_show_default_item") (GtkAppChooserButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowDialogItem_ = call (getSymbol "gtk_app_chooser_button_get_show_dialog_item") (GtkAppChooserButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setActiveCustomItem_ = call (getSymbol "gtk_app_chooser_button_set_active_custom_item") (GtkAppChooserButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setHeading_ = call (getSymbol "gtk_app_chooser_button_set_heading") (GtkAppChooserButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setShowDefaultItem_ = call (getSymbol "gtk_app_chooser_button_set_show_default_item") (GtkAppChooserButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowDialogItem_ = call (getSymbol "gtk_app_chooser_button_set_show_dialog_item") (GtkAppChooserButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkAppChooserButtonClass.class
    type 'a app_chooser_class = 'a GtkAppChooserClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkAppChooserClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new contentType = (Utf8.FFI.withPtr 0 ---> GtkAppChooserButtonClass.FFI.fromPtr false) new_ contentType
    fun appendCustomItem
      self
      (
        name,
        label,
        icon
      ) =
      (
        GtkAppChooserButtonClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GioIconClass.FFI.withPtr false
         ---> I
      )
        appendCustomItem_
        (
          self
           & name
           & label
           & icon
        )
    fun appendSeparator self = (GtkAppChooserButtonClass.FFI.withPtr false ---> I) appendSeparator_ self
    fun getHeading self = (GtkAppChooserButtonClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getHeading_ self
    fun getShowDefaultItem self = (GtkAppChooserButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowDefaultItem_ self
    fun getShowDialogItem self = (GtkAppChooserButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowDialogItem_ self
    fun setActiveCustomItem self name = (GtkAppChooserButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setActiveCustomItem_ (self & name)
    fun setHeading self heading = (GtkAppChooserButtonClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setHeading_ (self & heading)
    fun setShowDefaultItem self setting = (GtkAppChooserButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowDefaultItem_ (self & setting)
    fun setShowDialogItem self setting = (GtkAppChooserButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowDialogItem_ (self & setting)
    local
      open ClosureMarshal Signal
    in
      fun customItemActivatedSig f = signal "custom-item-activated" (get 0w1 string ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val headingProp =
        {
          name = "heading",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val showDefaultItemProp =
        {
          name = "show-default-item",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showDialogItemProp =
        {
          name = "show-dialog-item",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
