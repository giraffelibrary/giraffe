structure GtkAppChooserButton :>
  GTK_APP_CHOOSER_BUTTON
    where type 'a class = 'a GtkAppChooserButtonClass.class
    where type 'a app_chooser_class = 'a GtkAppChooserClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class =
  struct
    val getType_ = _import "gtk_app_chooser_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_app_chooser_button_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val appendCustomItem_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gtk_app_chooser_button_append_custom_item" :
              GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioIconClass.FFI.non_opt GioIconClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val appendSeparator_ = _import "gtk_app_chooser_button_append_separator" : GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p -> unit;
    val getHeading_ = _import "gtk_app_chooser_button_get_heading" : GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getShowDefaultItem_ = _import "gtk_app_chooser_button_get_show_default_item" : GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p -> GBool.FFI.val_;
    val getShowDialogItem_ = _import "gtk_app_chooser_button_get_show_dialog_item" : GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p -> GBool.FFI.val_;
    val setActiveCustomItem_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_app_chooser_button_set_active_custom_item" :
              GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setHeading_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_app_chooser_button_set_heading" :
              GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setShowDefaultItem_ = fn x1 & x2 => (_import "gtk_app_chooser_button_set_show_default_item" : GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowDialogItem_ = fn x1 & x2 => (_import "gtk_app_chooser_button_set_show_dialog_item" : GtkAppChooserButtonClass.FFI.non_opt GtkAppChooserButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkAppChooserButtonClass.class
    type 'a app_chooser_class = 'a GtkAppChooserClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asAppChooser self = (GObjectObjectClass.FFI.withPtr ---> GtkAppChooserClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new contentType = (Utf8.FFI.withPtr ---> GtkAppChooserButtonClass.FFI.fromPtr false) new_ contentType
    fun appendCustomItem
      self
      (
        name,
        label,
        icon
      ) =
      (
        GtkAppChooserButtonClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioIconClass.FFI.withPtr
         ---> I
      )
        appendCustomItem_
        (
          self
           & name
           & label
           & icon
        )
    fun appendSeparator self = (GtkAppChooserButtonClass.FFI.withPtr ---> I) appendSeparator_ self
    fun getHeading self = (GtkAppChooserButtonClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getHeading_ self
    fun getShowDefaultItem self = (GtkAppChooserButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowDefaultItem_ self
    fun getShowDialogItem self = (GtkAppChooserButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowDialogItem_ self
    fun setActiveCustomItem self name = (GtkAppChooserButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setActiveCustomItem_ (self & name)
    fun setHeading self heading = (GtkAppChooserButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setHeading_ (self & heading)
    fun setShowDefaultItem self setting = (GtkAppChooserButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowDefaultItem_ (self & setting)
    fun setShowDialogItem self setting = (GtkAppChooserButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowDialogItem_ (self & setting)
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
          set = fn x => set "heading" stringOpt x,
          new = fn x => new "heading" stringOpt x
        }
      val showDefaultItemProp =
        {
          get = fn x => get "show-default-item" boolean x,
          set = fn x => set "show-default-item" boolean x,
          new = fn x => new "show-default-item" boolean x
        }
      val showDialogItemProp =
        {
          get = fn x => get "show-dialog-item" boolean x,
          set = fn x => set "show-dialog-item" boolean x,
          new = fn x => new "show-dialog-item" boolean x
        }
    end
  end
