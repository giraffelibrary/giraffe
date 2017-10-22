structure Gtk : GTK =
  struct
    structure GdkAtomRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GdkAtomRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GdkAtomRecordCVectorN = CVectorN(GdkAtomRecordCVectorNType)
    structure GtkStockItemRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GtkStockItemRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GtkStockItemRecordCVectorN = CVectorN(GtkStockItemRecordCVectorNType)
    structure GtkTargetEntryRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GtkTargetEntryRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GtkTargetEntryRecordCVectorN = CVectorN(GtkTargetEntryRecordCVectorNType)
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure GLibOptionEntryRecordCVectorType =
      CPointerCVectorType(
        structure CElemType = GLibOptionEntryRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GLibOptionEntryRecordCVector = CVector(GLibOptionEntryRecordCVectorType)
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure GUInt32CVectorType =
      CValueCVectorType(
        structure CElemType = GUInt32Type
        structure ElemSequence = CValueVectorSequence(GUInt32Type)
      )
    structure GUInt32CVector = CVector(GUInt32CVectorType)
    local
      open PolyMLFFI
    in
      val accelGroupsActivate_ =
        call (getSymbol "gtk_accel_groups_activate")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val acceleratorGetDefaultModMask_ = call (getSymbol "gtk_accelerator_get_default_mod_mask") (cVoid --> GdkModifierType.PolyML.cVal)
      val acceleratorGetLabel_ = call (getSymbol "gtk_accelerator_get_label") (GUInt32.PolyML.cVal &&> GdkModifierType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val acceleratorGetLabelWithKeycode_ =
        call (getSymbol "gtk_accelerator_get_label_with_keycode")
          (
            GdkDisplayClass.PolyML.cOptPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val acceleratorName_ = call (getSymbol "gtk_accelerator_name") (GUInt32.PolyML.cVal &&> GdkModifierType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val acceleratorNameWithKeycode_ =
        call (getSymbol "gtk_accelerator_name_with_keycode")
          (
            GdkDisplayClass.PolyML.cOptPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val acceleratorParse_ =
        call (getSymbol "gtk_accelerator_parse")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> cVoid
          )
      val acceleratorParseWithKeycode_ =
        call (getSymbol "gtk_accelerator_parse_with_keycode")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cRef
             &&> GUInt32CVector.PolyML.cOutRef
             &&> GdkModifierType.PolyML.cRef
             --> cVoid
          )
      val acceleratorSetDefaultModMask_ = call (getSymbol "gtk_accelerator_set_default_mod_mask") (GdkModifierType.PolyML.cVal --> cVoid)
      val acceleratorValid_ = call (getSymbol "gtk_accelerator_valid") (GUInt32.PolyML.cVal &&> GdkModifierType.PolyML.cVal --> GBool.PolyML.cVal)
      val alternativeDialogButtonOrder_ = call (getSymbol "gtk_alternative_dialog_button_order") (GdkScreenClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val builderErrorQuark_ = call (getSymbol "gtk_builder_error_quark") (cVoid --> GUInt32.PolyML.cVal)
      val cairoShouldDrawWindow_ = call (getSymbol "gtk_cairo_should_draw_window") (CairoContextRecord.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val cairoTransformToWindow_ =
        call (getSymbol "gtk_cairo_transform_to_window")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             --> cVoid
          )
      val checkVersion_ =
        call (getSymbol "gtk_check_version")
          (
            GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> Utf8.PolyML.cOutOptPtr
          )
      val cssProviderErrorQuark_ = call (getSymbol "gtk_css_provider_error_quark") (cVoid --> GUInt32.PolyML.cVal)
      val deviceGrabAdd_ =
        call (getSymbol "gtk_device_grab_add")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val deviceGrabRemove_ = call (getSymbol "gtk_device_grab_remove") (GtkWidgetClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> cVoid)
      val disableSetlocale_ = call (getSymbol "gtk_disable_setlocale") (cVoid --> cVoid)
      val dragCancel_ = call (getSymbol "gtk_drag_cancel") (GdkDragContextClass.PolyML.cPtr --> cVoid)
      val dragFinish_ =
        call (getSymbol "gtk_drag_finish")
          (
            GdkDragContextClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val dragGetSourceWidget_ = call (getSymbol "gtk_drag_get_source_widget") (GdkDragContextClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val dragSetIconDefault_ = call (getSymbol "gtk_drag_set_icon_default") (GdkDragContextClass.PolyML.cPtr --> cVoid)
      val dragSetIconGicon_ =
        call (getSymbol "gtk_drag_set_icon_gicon")
          (
            GdkDragContextClass.PolyML.cPtr
             &&> GioIconClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val dragSetIconName_ =
        call (getSymbol "gtk_drag_set_icon_name")
          (
            GdkDragContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val dragSetIconPixbuf_ =
        call (getSymbol "gtk_drag_set_icon_pixbuf")
          (
            GdkDragContextClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val dragSetIconStock_ =
        call (getSymbol "gtk_drag_set_icon_stock")
          (
            GdkDragContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val dragSetIconSurface_ = call (getSymbol "gtk_drag_set_icon_surface") (GdkDragContextClass.PolyML.cPtr &&> CairoSurfaceRecord.PolyML.cPtr --> cVoid)
      val dragSetIconWidget_ =
        call (getSymbol "gtk_drag_set_icon_widget")
          (
            GdkDragContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val drawInsertionCursor_ =
        call (getSymbol "gtk_draw_insertion_cursor")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GtkTextDirection.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val eventsPending_ = call (getSymbol "gtk_events_pending") (cVoid --> GBool.PolyML.cVal)
      val fileChooserErrorQuark_ = call (getSymbol "gtk_file_chooser_error_quark") (cVoid --> GUInt32.PolyML.cVal)
      val getBinaryAge_ = call (getSymbol "gtk_get_binary_age") (cVoid --> GUInt32.PolyML.cVal)
      val getCurrentEvent_ = call (getSymbol "gtk_get_current_event") (cVoid --> GdkEvent.PolyML.cOptPtr)
      val getCurrentEventDevice_ = call (getSymbol "gtk_get_current_event_device") (cVoid --> GdkDeviceClass.PolyML.cOptPtr)
      val getCurrentEventState_ = call (getSymbol "gtk_get_current_event_state") (GdkModifierType.PolyML.cRef --> GBool.PolyML.cVal)
      val getCurrentEventTime_ = call (getSymbol "gtk_get_current_event_time") (cVoid --> GUInt32.PolyML.cVal)
      val getDebugFlags_ = call (getSymbol "gtk_get_debug_flags") (cVoid --> GUInt32.PolyML.cVal)
      val getDefaultLanguage_ = call (getSymbol "gtk_get_default_language") (cVoid --> PangoLanguageRecord.PolyML.cPtr)
      val getEventWidget_ = call (getSymbol "gtk_get_event_widget") (GdkEvent.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getInterfaceAge_ = call (getSymbol "gtk_get_interface_age") (cVoid --> GUInt32.PolyML.cVal)
      val getLocaleDirection_ = call (getSymbol "gtk_get_locale_direction") (cVoid --> GtkTextDirection.PolyML.cVal)
      val getMajorVersion_ = call (getSymbol "gtk_get_major_version") (cVoid --> GUInt32.PolyML.cVal)
      val getMicroVersion_ = call (getSymbol "gtk_get_micro_version") (cVoid --> GUInt32.PolyML.cVal)
      val getMinorVersion_ = call (getSymbol "gtk_get_minor_version") (cVoid --> GUInt32.PolyML.cVal)
      val getOptionGroup_ = call (getSymbol "gtk_get_option_group") (GBool.PolyML.cVal --> GLibOptionGroupRecord.PolyML.cPtr)
      val grabGetCurrent_ = call (getSymbol "gtk_grab_get_current") (cVoid --> GtkWidgetClass.PolyML.cOptPtr)
      val iconSizeFromName_ = call (getSymbol "gtk_icon_size_from_name") (Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val iconSizeGetName_ = call (getSymbol "gtk_icon_size_get_name") (GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val iconSizeLookup_ =
        call (getSymbol "gtk_icon_size_lookup")
          (
            GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val iconSizeLookupForSettings_ =
        call (getSymbol "gtk_icon_size_lookup_for_settings")
          (
            GtkSettingsClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val iconSizeRegister_ =
        call (getSymbol "gtk_icon_size_register")
          (
            Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val iconSizeRegisterAlias_ = call (getSymbol "gtk_icon_size_register_alias") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> cVoid)
      val iconThemeErrorQuark_ = call (getSymbol "gtk_icon_theme_error_quark") (cVoid --> GUInt32.PolyML.cVal)
      val init_ = call (getSymbol "gtk_init") (GInt32.PolyML.cRef &&> Utf8CVectorN.PolyML.cInOutRef --> cVoid)
      val initCheck_ = call (getSymbol "gtk_init_check") (GInt32.PolyML.cRef &&> Utf8CVectorN.PolyML.cInOutRef --> GBool.PolyML.cVal)
      val initWithArgs_ =
        call (getSymbol "gtk_init_with_args")
          (
            GInt32.PolyML.cRef
             &&> Utf8CVectorN.PolyML.cInOutRef
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibOptionEntryRecordCVector.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val keySnooperRemove_ = call (getSymbol "gtk_key_snooper_remove") (GUInt32.PolyML.cVal --> cVoid)
      val main_ = call (getSymbol "gtk_main") (cVoid --> cVoid)
      val mainDoEvent_ = call (getSymbol "gtk_main_do_event") (GdkEvent.PolyML.cPtr --> cVoid)
      val mainIteration_ = call (getSymbol "gtk_main_iteration") (cVoid --> GBool.PolyML.cVal)
      val mainIterationDo_ = call (getSymbol "gtk_main_iteration_do") (GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val mainLevel_ = call (getSymbol "gtk_main_level") (cVoid --> GUInt32.PolyML.cVal)
      val mainQuit_ = call (getSymbol "gtk_main_quit") (cVoid --> cVoid)
      val paintArrow_ =
        call (getSymbol "gtk_paint_arrow")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GtkArrowType.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintBox_ =
        call (getSymbol "gtk_paint_box")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintBoxGap_ =
        call (getSymbol "gtk_paint_box_gap")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkPositionType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintCheck_ =
        call (getSymbol "gtk_paint_check")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintDiamond_ =
        call (getSymbol "gtk_paint_diamond")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintExpander_ =
        call (getSymbol "gtk_paint_expander")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkExpanderStyle.PolyML.cVal
             --> cVoid
          )
      val paintExtension_ =
        call (getSymbol "gtk_paint_extension")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkPositionType.PolyML.cVal
             --> cVoid
          )
      val paintFlatBox_ =
        call (getSymbol "gtk_paint_flat_box")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintFocus_ =
        call (getSymbol "gtk_paint_focus")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintHandle_ =
        call (getSymbol "gtk_paint_handle")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkOrientation.PolyML.cVal
             --> cVoid
          )
      val paintHline_ =
        call (getSymbol "gtk_paint_hline")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintLayout_ =
        call (getSymbol "gtk_paint_layout")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> PangoLayoutClass.PolyML.cPtr
             --> cVoid
          )
      val paintOption_ =
        call (getSymbol "gtk_paint_option")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintResizeGrip_ =
        call (getSymbol "gtk_paint_resize_grip")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GdkWindowEdge.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintShadow_ =
        call (getSymbol "gtk_paint_shadow")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintShadowGap_ =
        call (getSymbol "gtk_paint_shadow_gap")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkPositionType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintSlider_ =
        call (getSymbol "gtk_paint_slider")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkOrientation.PolyML.cVal
             --> cVoid
          )
      val paintSpinner_ =
        call (getSymbol "gtk_paint_spinner")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GUInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintTab_ =
        call (getSymbol "gtk_paint_tab")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkShadowType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paintVline_ =
        call (getSymbol "gtk_paint_vline")
          (
            GtkStyleClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val paperSizeGetDefault_ = call (getSymbol "gtk_paper_size_get_default") (cVoid --> Utf8.PolyML.cOutPtr)
      val parseArgs_ = call (getSymbol "gtk_parse_args") (GInt32.PolyML.cRef &&> Utf8CVectorN.PolyML.cInOutRef --> GBool.PolyML.cVal)
      val printErrorQuark_ = call (getSymbol "gtk_print_error_quark") (cVoid --> GUInt32.PolyML.cVal)
      val printRunPageSetupDialog_ =
        call (getSymbol "gtk_print_run_page_setup_dialog")
          (
            GtkWindowClass.PolyML.cOptPtr
             &&> GtkPageSetupClass.PolyML.cOptPtr
             &&> GtkPrintSettingsClass.PolyML.cPtr
             --> GtkPageSetupClass.PolyML.cPtr
          )
      val propagateEvent_ = call (getSymbol "gtk_propagate_event") (GtkWidgetClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> cVoid)
      val rcAddDefaultFile_ = call (getSymbol "gtk_rc_add_default_file") (Utf8.PolyML.cInPtr --> cVoid)
      val rcFindModuleInPath_ = call (getSymbol "gtk_rc_find_module_in_path") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val rcGetDefaultFiles_ = call (getSymbol "gtk_rc_get_default_files") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val rcGetImModuleFile_ = call (getSymbol "gtk_rc_get_im_module_file") (cVoid --> Utf8.PolyML.cOutPtr)
      val rcGetImModulePath_ = call (getSymbol "gtk_rc_get_im_module_path") (cVoid --> Utf8.PolyML.cOutPtr)
      val rcGetModuleDir_ = call (getSymbol "gtk_rc_get_module_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val rcGetStyle_ = call (getSymbol "gtk_rc_get_style") (GtkWidgetClass.PolyML.cPtr --> GtkStyleClass.PolyML.cPtr)
      val rcGetThemeDir_ = call (getSymbol "gtk_rc_get_theme_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val rcParse_ = call (getSymbol "gtk_rc_parse") (Utf8.PolyML.cInPtr --> cVoid)
      val rcParseString_ = call (getSymbol "gtk_rc_parse_string") (Utf8.PolyML.cInPtr --> cVoid)
      val rcReparseAll_ = call (getSymbol "gtk_rc_reparse_all") (cVoid --> GBool.PolyML.cVal)
      val rcReparseAllForSettings_ = call (getSymbol "gtk_rc_reparse_all_for_settings") (GtkSettingsClass.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val rcResetStyles_ = call (getSymbol "gtk_rc_reset_styles") (GtkSettingsClass.PolyML.cPtr --> cVoid)
      val rcSetDefaultFiles_ = call (getSymbol "gtk_rc_set_default_files") (Utf8CVector.PolyML.cInPtr --> cVoid)
      val recentChooserErrorQuark_ = call (getSymbol "gtk_recent_chooser_error_quark") (cVoid --> GUInt32.PolyML.cVal)
      val recentManagerErrorQuark_ = call (getSymbol "gtk_recent_manager_error_quark") (cVoid --> GUInt32.PolyML.cVal)
      val renderActivity_ =
        call (getSymbol "gtk_render_activity")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderArrow_ =
        call (getSymbol "gtk_render_arrow")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderBackground_ =
        call (getSymbol "gtk_render_background")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderBackgroundGetClip_ =
        call (getSymbol "gtk_render_background_get_clip")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val renderCheck_ =
        call (getSymbol "gtk_render_check")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderExpander_ =
        call (getSymbol "gtk_render_expander")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderExtension_ =
        call (getSymbol "gtk_render_extension")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GtkPositionType.PolyML.cVal
             --> cVoid
          )
      val renderFocus_ =
        call (getSymbol "gtk_render_focus")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderFrame_ =
        call (getSymbol "gtk_render_frame")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderFrameGap_ =
        call (getSymbol "gtk_render_frame_gap")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GtkPositionType.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderHandle_ =
        call (getSymbol "gtk_render_handle")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderIcon_ =
        call (getSymbol "gtk_render_icon")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderIconPixbuf_ =
        call (getSymbol "gtk_render_icon_pixbuf")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkIconSourceRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val renderIconSurface_ =
        call (getSymbol "gtk_render_icon_surface")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> CairoSurfaceRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderInsertionCursor_ =
        call (getSymbol "gtk_render_insertion_cursor")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> PangoLayoutClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> PangoDirection.PolyML.cVal
             --> cVoid
          )
      val renderLayout_ =
        call (getSymbol "gtk_render_layout")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> PangoLayoutClass.PolyML.cPtr
             --> cVoid
          )
      val renderLine_ =
        call (getSymbol "gtk_render_line")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderOption_ =
        call (getSymbol "gtk_render_option")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val renderSlider_ =
        call (getSymbol "gtk_render_slider")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GtkOrientation.PolyML.cVal
             --> cVoid
          )
      val rgbToHsv_ =
        call (getSymbol "gtk_rgb_to_hsv")
          (
            GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val selectionAddTarget_ =
        call (getSymbol "gtk_selection_add_target")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val selectionAddTargets_ =
        call (getSymbol "gtk_selection_add_targets")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GtkTargetEntryRecordCVectorN.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val selectionClearTargets_ = call (getSymbol "gtk_selection_clear_targets") (GtkWidgetClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> cVoid)
      val selectionConvert_ =
        call (getSymbol "gtk_selection_convert")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val selectionOwnerSet_ =
        call (getSymbol "gtk_selection_owner_set")
          (
            GtkWidgetClass.PolyML.cOptPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val selectionOwnerSetForDisplay_ =
        call (getSymbol "gtk_selection_owner_set_for_display")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val selectionRemoveAll_ = call (getSymbol "gtk_selection_remove_all") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setDebugFlags_ = call (getSymbol "gtk_set_debug_flags") (GUInt32.PolyML.cVal --> cVoid)
      val showUri_ =
        call (getSymbol "gtk_show_uri")
          (
            GdkScreenClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val showUriOnWindow_ =
        call (getSymbol "gtk_show_uri_on_window")
          (
            GtkWindowClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val stockAdd_ = call (getSymbol "gtk_stock_add") (GtkStockItemRecordCVectorN.PolyML.cInPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val stockAddStatic_ = call (getSymbol "gtk_stock_add_static") (GtkStockItemRecordCVectorN.PolyML.cInPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val stockLookup_ = call (getSymbol "gtk_stock_lookup") (Utf8.PolyML.cInPtr &&> GtkStockItemRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val targetTableFree_ = call (getSymbol "gtk_target_table_free") (GtkTargetEntryRecordCVectorN.PolyML.cInPtr &&> GInt32.PolyML.cVal --> cVoid)
      val targetTableNewFromList_ = call (getSymbol "gtk_target_table_new_from_list") (GtkTargetListRecord.PolyML.cPtr &&> GInt32.PolyML.cRef --> GtkTargetEntryRecordCVectorN.PolyML.cOutPtr)
      val targetsIncludeImage_ =
        call (getSymbol "gtk_targets_include_image")
          (
            GdkAtomRecordCVectorN.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val targetsIncludeRichText_ =
        call (getSymbol "gtk_targets_include_rich_text")
          (
            GdkAtomRecordCVectorN.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GtkTextBufferClass.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val targetsIncludeText_ = call (getSymbol "gtk_targets_include_text") (GdkAtomRecordCVectorN.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val targetsIncludeUri_ = call (getSymbol "gtk_targets_include_uri") (GdkAtomRecordCVectorN.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val testCreateSimpleWindow_ = call (getSymbol "gtk_test_create_simple_window") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val testFindLabel_ = call (getSymbol "gtk_test_find_label") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val testRegisterAllTypes_ = call (getSymbol "gtk_test_register_all_types") (cVoid --> cVoid)
      val testSliderGetValue_ = call (getSymbol "gtk_test_slider_get_value") (GtkWidgetClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val testSliderSetPerc_ = call (getSymbol "gtk_test_slider_set_perc") (GtkWidgetClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val testSpinButtonClick_ =
        call (getSymbol "gtk_test_spin_button_click")
          (
            GtkSpinButtonClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val testTextGet_ = call (getSymbol "gtk_test_text_get") (GtkWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val testTextSet_ = call (getSymbol "gtk_test_text_set") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val testWidgetClick_ =
        call (getSymbol "gtk_test_widget_click")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val testWidgetSendKey_ =
        call (getSymbol "gtk_test_widget_send_key")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val testWidgetWaitForDraw_ = call (getSymbol "gtk_test_widget_wait_for_draw") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val treeGetRowDragData_ =
        call (getSymbol "gtk_tree_get_row_drag_data")
          (
            GtkSelectionDataRecord.PolyML.cPtr
             &&> GtkTreeModelClass.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val treeRowReferenceDeleted_ = call (getSymbol "gtk_tree_row_reference_deleted") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val treeRowReferenceInserted_ = call (getSymbol "gtk_tree_row_reference_inserted") (GObjectObjectClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val treeSetRowDragData_ =
        call (getSymbol "gtk_tree_set_row_drag_data")
          (
            GtkSelectionDataRecord.PolyML.cPtr
             &&> GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
    end
    structure ActionEntry = GtkActionEntry
    structure AccelFlags = GtkAccelFlags
    structure AccelGroupClass = GtkAccelGroupClass
    structure AccelGroupEntryRecord = GtkAccelGroupEntryRecord
    structure AccelKeyRecord = GtkAccelKeyRecord
    structure AccelMapClass = GtkAccelMapClass
    structure AccessibleClass = GtkAccessibleClass
    structure ActionClass = GtkActionClass
    structure ActionGroupClass = GtkActionGroupClass
    structure ActionableClass = GtkActionableClass
    structure ActivatableClass = GtkActivatableClass
    structure AdjustmentClass = GtkAdjustmentClass
    structure Align = GtkAlign
    structure AppChooserClass = GtkAppChooserClass
    structure ApplicationClass = GtkApplicationClass
    structure ApplicationInhibitFlags = GtkApplicationInhibitFlags
    structure ArrowPlacement = GtkArrowPlacement
    structure ArrowType = GtkArrowType
    structure AssistantPageType = GtkAssistantPageType
    structure AttachOptions = GtkAttachOptions
    structure BaselinePosition = GtkBaselinePosition
    structure BorderRecord = GtkBorderRecord
    structure BorderStyle = GtkBorderStyle
    structure BuildableClass = GtkBuildableClass
    structure BuilderClass = GtkBuilderClass
    structure BuilderError = GtkBuilderError
    exception BuilderError = GtkBuilderError
    structure ButtonBoxStyle = GtkButtonBoxStyle
    structure ButtonRole = GtkButtonRole
    structure ButtonsType = GtkButtonsType
    structure CalendarDisplayOptions = GtkCalendarDisplayOptions
    structure CellAccessibleParentClass = GtkCellAccessibleParentClass
    structure CellAreaClass = GtkCellAreaClass
    structure CellAreaContextClass = GtkCellAreaContextClass
    structure CellEditableClass = GtkCellEditableClass
    structure CellLayoutClass = GtkCellLayoutClass
    structure CellRendererClass = GtkCellRendererClass
    structure CellRendererAccelMode = GtkCellRendererAccelMode
    structure CellRendererMode = GtkCellRendererMode
    structure CellRendererState = GtkCellRendererState
    structure ClipboardClass = GtkClipboardClass
    structure ColorChooserClass = GtkColorChooserClass
    structure CornerType = GtkCornerType
    structure CssProviderClass = GtkCssProviderClass
    structure CssProviderError = GtkCssProviderError
    exception CssProviderError = GtkCssProviderError
    structure CssSectionRecord = GtkCssSectionRecord
    structure CssSectionType = GtkCssSectionType
    structure DebugFlag = GtkDebugFlag
    structure DeleteType = GtkDeleteType
    structure DestDefaults = GtkDestDefaults
    structure DialogFlags = GtkDialogFlags
    structure DirectionType = GtkDirectionType
    structure DragResult = GtkDragResult
    structure EditableClass = GtkEditableClass
    structure EntryBufferClass = GtkEntryBufferClass
    structure EntryCompletionClass = GtkEntryCompletionClass
    structure EntryIconAccessibleClass = GtkEntryIconAccessibleClass
    structure EntryIconPosition = GtkEntryIconPosition
    structure EventControllerClass = GtkEventControllerClass
    structure EventSequenceState = GtkEventSequenceState
    structure ExpanderStyle = GtkExpanderStyle
    structure FileChooserClass = GtkFileChooserClass
    structure FileChooserAction = GtkFileChooserAction
    structure FileChooserConfirmation = GtkFileChooserConfirmation
    structure FileChooserError = GtkFileChooserError
    exception FileChooserError = GtkFileChooserError
    structure FileFilterClass = GtkFileFilterClass
    structure FileFilterFlags = GtkFileFilterFlags
    structure FileFilterInfoRecord = GtkFileFilterInfoRecord
    structure FontChooserClass = GtkFontChooserClass
    structure IMContextClass = GtkIMContextClass
    structure IMPreeditStyle = GtkIMPreeditStyle
    structure IMStatusStyle = GtkIMStatusStyle
    structure IconFactoryClass = GtkIconFactoryClass
    structure IconInfoClass = GtkIconInfoClass
    structure IconLookupFlags = GtkIconLookupFlags
    structure IconSetRecord = GtkIconSetRecord
    structure IconSourceRecord = GtkIconSourceRecord
    structure IconThemeClass = GtkIconThemeClass
    structure IconThemeError = GtkIconThemeError
    exception IconThemeError = GtkIconThemeError
    structure IconViewDropPosition = GtkIconViewDropPosition
    structure ImageType = GtkImageType
    structure InputHints = GtkInputHints
    structure InputPurpose = GtkInputPurpose
    structure JunctionSides = GtkJunctionSides
    structure Justification = GtkJustification
    structure LevelBarMode = GtkLevelBarMode
    structure License = GtkLicense
    structure ListStoreClass = GtkListStoreClass
    structure MenuDirectionType = GtkMenuDirectionType
    structure MessageType = GtkMessageType
    structure MountOperationClass = GtkMountOperationClass
    structure MovementStep = GtkMovementStep
    structure NativeDialogClass = GtkNativeDialogClass
    structure NotebookPageAccessibleClass = GtkNotebookPageAccessibleClass
    structure NotebookTab = GtkNotebookTab
    structure NumberUpLayout = GtkNumberUpLayout
    structure NumerableIconClass = GtkNumerableIconClass
    structure OrientableClass = GtkOrientableClass
    structure Orientation = GtkOrientation
    structure PackDirection = GtkPackDirection
    structure PackType = GtkPackType
    structure PadActionType = GtkPadActionType
    structure PageOrientation = GtkPageOrientation
    structure PageRangeRecord = GtkPageRangeRecord
    structure PageSet = GtkPageSet
    structure PageSetupClass = GtkPageSetupClass
    structure PanDirection = GtkPanDirection
    structure PaperSizeRecord = GtkPaperSizeRecord
    structure PathPriorityType = GtkPathPriorityType
    structure PathType = GtkPathType
    structure PlacesOpenFlags = GtkPlacesOpenFlags
    structure PolicyType = GtkPolicyType
    structure PopoverConstraint = GtkPopoverConstraint
    structure PositionType = GtkPositionType
    structure PrintContextClass = GtkPrintContextClass
    structure PrintDuplex = GtkPrintDuplex
    structure PrintError = GtkPrintError
    exception PrintError = GtkPrintError
    structure PrintOperationClass = GtkPrintOperationClass
    structure PrintOperationAction = GtkPrintOperationAction
    structure PrintOperationPreviewClass = GtkPrintOperationPreviewClass
    structure PrintOperationResult = GtkPrintOperationResult
    structure PrintPages = GtkPrintPages
    structure PrintQuality = GtkPrintQuality
    structure PrintSettingsClass = GtkPrintSettingsClass
    structure PrintStatus = GtkPrintStatus
    structure PropagationPhase = GtkPropagationPhase
    structure RcFlags = GtkRcFlags
    structure RcStyleClass = GtkRcStyleClass
    structure RcTokenType = GtkRcTokenType
    structure RecentChooserClass = GtkRecentChooserClass
    structure RecentChooserError = GtkRecentChooserError
    exception RecentChooserError = GtkRecentChooserError
    structure RecentDataRecord = GtkRecentDataRecord
    structure RecentFilterClass = GtkRecentFilterClass
    structure RecentFilterFlags = GtkRecentFilterFlags
    structure RecentFilterInfoRecord = GtkRecentFilterInfoRecord
    structure RecentInfoRecord = GtkRecentInfoRecord
    structure RecentManagerClass = GtkRecentManagerClass
    structure RecentManagerError = GtkRecentManagerError
    exception RecentManagerError = GtkRecentManagerError
    structure RecentSortType = GtkRecentSortType
    structure RegionFlags = GtkRegionFlags
    structure ReliefStyle = GtkReliefStyle
    structure RequisitionRecord = GtkRequisitionRecord
    structure ResizeMode = GtkResizeMode
    structure ResponseType = GtkResponseType
    structure RevealerTransitionType = GtkRevealerTransitionType
    structure ScrollStep = GtkScrollStep
    structure ScrollType = GtkScrollType
    structure ScrollableClass = GtkScrollableClass
    structure ScrollablePolicy = GtkScrollablePolicy
    structure SelectionDataRecord = GtkSelectionDataRecord
    structure SelectionMode = GtkSelectionMode
    structure SensitivityType = GtkSensitivityType
    structure SettingsClass = GtkSettingsClass
    structure SettingsValueRecord = GtkSettingsValueRecord
    structure ShadowType = GtkShadowType
    structure ShortcutType = GtkShortcutType
    structure SizeGroupClass = GtkSizeGroupClass
    structure SizeGroupMode = GtkSizeGroupMode
    structure SizeRequestMode = GtkSizeRequestMode
    structure SortType = GtkSortType
    structure SpinButtonUpdatePolicy = GtkSpinButtonUpdatePolicy
    structure SpinType = GtkSpinType
    structure StackTransitionType = GtkStackTransitionType
    structure StateFlags = GtkStateFlags
    structure StateType = GtkStateType
    structure StatusIconClass = GtkStatusIconClass
    structure StockItemRecord = GtkStockItemRecord
    structure StyleClass = GtkStyleClass
    structure StyleContextClass = GtkStyleContextClass
    structure StyleContextPrintFlags = GtkStyleContextPrintFlags
    structure StylePropertiesClass = GtkStylePropertiesClass
    structure StyleProviderClass = GtkStyleProviderClass
    structure SymbolicColorRecord = GtkSymbolicColorRecord
    structure TargetEntryRecord = GtkTargetEntryRecord
    structure TargetFlags = GtkTargetFlags
    structure TargetListRecord = GtkTargetListRecord
    structure TextAttributesRecord = GtkTextAttributesRecord
    structure TextBufferClass = GtkTextBufferClass
    structure TextBufferTargetInfo = GtkTextBufferTargetInfo
    structure TextChildAnchorClass = GtkTextChildAnchorClass
    structure TextDirection = GtkTextDirection
    structure TextExtendSelection = GtkTextExtendSelection
    structure TextIterRecord = GtkTextIterRecord
    structure TextMarkClass = GtkTextMarkClass
    structure TextSearchFlags = GtkTextSearchFlags
    structure TextTagClass = GtkTextTagClass
    structure TextTagTableClass = GtkTextTagTableClass
    structure TextViewLayer = GtkTextViewLayer
    structure TextWindowType = GtkTextWindowType
    structure ThemingEngineClass = GtkThemingEngineClass
    structure ToolPaletteDragTargets = GtkToolPaletteDragTargets
    structure ToolShellClass = GtkToolShellClass
    structure ToolbarSpaceStyle = GtkToolbarSpaceStyle
    structure ToolbarStyle = GtkToolbarStyle
    structure TooltipClass = GtkTooltipClass
    structure ToplevelAccessibleClass = GtkToplevelAccessibleClass
    structure TreeDragDestClass = GtkTreeDragDestClass
    structure TreeDragSourceClass = GtkTreeDragSourceClass
    structure TreeIterRecord = GtkTreeIterRecord
    structure TreeModelClass = GtkTreeModelClass
    structure TreeModelFilterClass = GtkTreeModelFilterClass
    structure TreeModelFlags = GtkTreeModelFlags
    structure TreeModelSortClass = GtkTreeModelSortClass
    structure TreePathRecord = GtkTreePathRecord
    structure TreeSelectionClass = GtkTreeSelectionClass
    structure TreeSortableClass = GtkTreeSortableClass
    structure TreeStoreClass = GtkTreeStoreClass
    structure TreeViewColumnClass = GtkTreeViewColumnClass
    structure TreeViewColumnSizing = GtkTreeViewColumnSizing
    structure TreeViewDropPosition = GtkTreeViewDropPosition
    structure TreeViewGridLines = GtkTreeViewGridLines
    structure UIManagerClass = GtkUIManagerClass
    structure UIManagerItemType = GtkUIManagerItemType
    structure Unit = GtkUnit
    structure WidgetClass = GtkWidgetClass
    structure WidgetHelpType = GtkWidgetHelpType
    structure WidgetPathRecord = GtkWidgetPathRecord
    structure WindowGroupClass = GtkWindowGroupClass
    structure WindowPosition = GtkWindowPosition
    structure WindowType = GtkWindowType
    structure WrapMode = GtkWrapMode
    structure AccelGroup = GtkAccelGroup
    structure AccelGroupEntry = GtkAccelGroupEntry
    structure AccelKey = GtkAccelKey
    structure AccelMap = GtkAccelMap
    structure Accessible = GtkAccessible
    structure Action = GtkAction
    structure Actionable = GtkActionable
    structure Activatable = GtkActivatable
    structure Adjustment = GtkAdjustment
    structure AppChooser = GtkAppChooser
    structure Border = GtkBorder
    structure Buildable = GtkBuildable
    structure Builder = GtkBuilder
    structure CalendarClass = GtkCalendarClass
    structure CellAccessibleClass = GtkCellAccessibleClass
    structure CellArea = GtkCellArea
    structure CellAreaBoxClass = GtkCellAreaBoxClass
    structure CellAreaContext = GtkCellAreaContext
    structure CellEditable = GtkCellEditable
    structure CellLayout = GtkCellLayout
    structure CellRenderer = GtkCellRenderer
    structure CellRendererPixbufClass = GtkCellRendererPixbufClass
    structure CellRendererProgressClass = GtkCellRendererProgressClass
    structure CellRendererSpinnerClass = GtkCellRendererSpinnerClass
    structure CellRendererTextClass = GtkCellRendererTextClass
    structure CellRendererToggleClass = GtkCellRendererToggleClass
    structure CellViewClass = GtkCellViewClass
    structure Clipboard = GtkClipboard
    structure ColorChooser = GtkColorChooser
    structure ContainerClass = GtkContainerClass
    structure CssProvider = GtkCssProvider
    structure CssSection = GtkCssSection
    structure DrawingAreaClass = GtkDrawingAreaClass
    structure Editable = GtkEditable
    structure EntryClass = GtkEntryClass
    structure EntryBuffer = GtkEntryBuffer
    structure EntryCompletion = GtkEntryCompletion
    structure EntryIconAccessible = GtkEntryIconAccessible
    structure EventController = GtkEventController
    structure FileChooser = GtkFileChooser
    structure FileChooserNativeClass = GtkFileChooserNativeClass
    structure FileFilter = GtkFileFilter
    structure FileFilterInfo = GtkFileFilterInfo
    structure FontChooser = GtkFontChooser
    structure GLAreaClass = GtkGLAreaClass
    structure GestureClass = GtkGestureClass
    structure HsvClass = GtkHsvClass
    structure IMContext = GtkIMContext
    structure IMContextSimpleClass = GtkIMContextSimpleClass
    structure IMMulticontextClass = GtkIMMulticontextClass
    structure IconFactory = GtkIconFactory
    structure IconInfo = GtkIconInfo
    structure IconSet = GtkIconSet
    structure IconSize = GtkIconSize
    structure IconSource = GtkIconSource
    structure IconTheme = GtkIconTheme
    structure InvisibleClass = GtkInvisibleClass
    structure LevelBarClass = GtkLevelBarClass
    structure ListStore = GtkListStore
    structure MiscClass = GtkMiscClass
    structure NumerableIcon = GtkNumerableIcon
    structure Orientable = GtkOrientable
    structure PadControllerClass = GtkPadControllerClass
    structure PageRange = GtkPageRange
    structure PageSetup = GtkPageSetup
    structure PaperSize = GtkPaperSize
    structure PrintContext = GtkPrintContext
    structure PrintOperationPreview = GtkPrintOperationPreview
    structure PrintSettings = GtkPrintSettings
    structure ProgressBarClass = GtkProgressBarClass
    structure RangeClass = GtkRangeClass
    structure RcStyle = GtkRcStyle
    structure RecentActionClass = GtkRecentActionClass
    structure RecentChooser = GtkRecentChooser
    structure RecentData = GtkRecentData
    structure RecentFilter = GtkRecentFilter
    structure RecentFilterInfo = GtkRecentFilterInfo
    structure RecentInfo = GtkRecentInfo
    structure RecentManager = GtkRecentManager
    structure Requisition = GtkRequisition
    structure Scrollable = GtkScrollable
    structure SelectionData = GtkSelectionData
    structure SeparatorClass = GtkSeparatorClass
    structure SettingsValue = GtkSettingsValue
    structure SizeGroup = GtkSizeGroup
    structure SpinnerClass = GtkSpinnerClass
    structure StockItem = GtkStockItem
    structure Style = GtkStyle
    structure StyleContext = GtkStyleContext
    structure StyleProperties = GtkStyleProperties
    structure StyleProvider = GtkStyleProvider
    structure SwitchClass = GtkSwitchClass
    structure SymbolicColor = GtkSymbolicColor
    structure TargetEntry = GtkTargetEntry
    structure TargetList = GtkTargetList
    structure TextAttributes = GtkTextAttributes
    structure TextBuffer = GtkTextBuffer
    structure TextChildAnchor = GtkTextChildAnchor
    structure TextIter = GtkTextIter
    structure TextMark = GtkTextMark
    structure TextTag = GtkTextTag
    structure TextTagTable = GtkTextTagTable
    structure ThemingEngine = GtkThemingEngine
    structure ToggleActionClass = GtkToggleActionClass
    structure ToolShell = GtkToolShell
    structure Tooltip = GtkTooltip
    structure ToplevelAccessible = GtkToplevelAccessible
    structure TreeDragDest = GtkTreeDragDest
    structure TreeDragSource = GtkTreeDragSource
    structure TreeIter = GtkTreeIter
    structure TreeModel = GtkTreeModel
    structure TreeModelFilter = GtkTreeModelFilter
    structure TreeModelSort = GtkTreeModelSort
    structure TreePath = GtkTreePath
    structure TreeSortable = GtkTreeSortable
    structure TreeStore = GtkTreeStore
    structure TreeViewColumn = GtkTreeViewColumn
    structure UIManager = GtkUIManager
    structure WidgetAccessibleClass = GtkWidgetAccessibleClass
    structure WidgetPath = GtkWidgetPath
    structure ActionGroup = GtkActionGroup
    structure ArrowClass = GtkArrowClass
    structure ArrowAccessibleClass = GtkArrowAccessibleClass
    structure BinClass = GtkBinClass
    structure BoxClass = GtkBoxClass
    structure Calendar = GtkCalendar
    structure CellAccessible = GtkCellAccessible
    structure CellAccessibleParent = GtkCellAccessibleParent
    structure CellAreaBox = GtkCellAreaBox
    structure CellRendererAccelClass = GtkCellRendererAccelClass
    structure CellRendererComboClass = GtkCellRendererComboClass
    structure CellRendererPixbuf = GtkCellRendererPixbuf
    structure CellRendererProgress = GtkCellRendererProgress
    structure CellRendererSpinClass = GtkCellRendererSpinClass
    structure CellRendererSpinner = GtkCellRendererSpinner
    structure CellRendererText = GtkCellRendererText
    structure CellRendererToggle = GtkCellRendererToggle
    structure CellView = GtkCellView
    structure Container = GtkContainer
    structure ContainerAccessibleClass = GtkContainerAccessibleClass
    structure ContainerCellAccessibleClass = GtkContainerCellAccessibleClass
    structure DrawingArea = GtkDrawingArea
    structure Entry = GtkEntry
    structure EntryAccessibleClass = GtkEntryAccessibleClass
    structure FixedClass = GtkFixedClass
    structure FlowBoxClass = GtkFlowBoxClass
    structure GLArea = GtkGLArea
    structure Gesture = GtkGesture
    structure GestureRotateClass = GtkGestureRotateClass
    structure GestureSingleClass = GtkGestureSingleClass
    structure GestureZoomClass = GtkGestureZoomClass
    structure GridClass = GtkGridClass
    structure Hsv = GtkHsv
    structure HSeparatorClass = GtkHSeparatorClass
    structure HeaderBarClass = GtkHeaderBarClass
    structure IMContextSimple = GtkIMContextSimple
    structure IconViewClass = GtkIconViewClass
    structure ImageClass = GtkImageClass
    structure ImageAccessibleClass = GtkImageAccessibleClass
    structure Invisible = GtkInvisible
    structure LabelClass = GtkLabelClass
    structure LabelAccessibleClass = GtkLabelAccessibleClass
    structure LayoutClass = GtkLayoutClass
    structure LevelBar = GtkLevelBar
    structure LevelBarAccessibleClass = GtkLevelBarAccessibleClass
    structure ListBoxClass = GtkListBoxClass
    structure MenuShellClass = GtkMenuShellClass
    structure Misc = GtkMisc
    structure NotebookClass = GtkNotebookClass
    structure PanedClass = GtkPanedClass
    structure ProgressBar = GtkProgressBar
    structure ProgressBarAccessibleClass = GtkProgressBarAccessibleClass
    structure RadioActionClass = GtkRadioActionClass
    structure Range = GtkRange
    structure RangeAccessibleClass = GtkRangeAccessibleClass
    structure RecentAction = GtkRecentAction
    structure RendererCellAccessibleClass = GtkRendererCellAccessibleClass
    structure ScaleClass = GtkScaleClass
    structure ScrollbarClass = GtkScrollbarClass
    structure SearchEntryClass = GtkSearchEntryClass
    structure Separator = GtkSeparator
    structure Settings = GtkSettings
    structure SocketClass = GtkSocketClass
    structure SpinButtonClass = GtkSpinButtonClass
    structure Spinner = GtkSpinner
    structure SpinnerAccessibleClass = GtkSpinnerAccessibleClass
    structure StackClass = GtkStackClass
    structure Switch = GtkSwitch
    structure SwitchAccessibleClass = GtkSwitchAccessibleClass
    structure TableClass = GtkTableClass
    structure TextViewClass = GtkTextViewClass
    structure ToggleAction = GtkToggleAction
    structure ToolItemGroupClass = GtkToolItemGroupClass
    structure ToolPaletteClass = GtkToolPaletteClass
    structure ToolbarClass = GtkToolbarClass
    structure TreeViewClass = GtkTreeViewClass
    structure VSeparatorClass = GtkVSeparatorClass
    structure WidgetAccessible = GtkWidgetAccessible
    structure AccelLabelClass = GtkAccelLabelClass
    structure ActionBarClass = GtkActionBarClass
    structure AlignmentClass = GtkAlignmentClass
    structure AppChooserWidgetClass = GtkAppChooserWidgetClass
    structure Arrow = GtkArrow
    structure ArrowAccessible = GtkArrowAccessible
    structure Bin = GtkBin
    structure BooleanCellAccessibleClass = GtkBooleanCellAccessibleClass
    structure Box = GtkBox
    structure ButtonClass = GtkButtonClass
    structure ButtonAccessibleClass = GtkButtonAccessibleClass
    structure ButtonBoxClass = GtkButtonBoxClass
    structure CellRendererAccel = GtkCellRendererAccel
    structure CellRendererCombo = GtkCellRendererCombo
    structure CellRendererSpin = GtkCellRendererSpin
    structure ColorChooserWidgetClass = GtkColorChooserWidgetClass
    structure ColorSelectionClass = GtkColorSelectionClass
    structure ComboBoxClass = GtkComboBoxClass
    structure ComboBoxAccessibleClass = GtkComboBoxAccessibleClass
    structure ContainerAccessible = GtkContainerAccessible
    structure ContainerCellAccessible = GtkContainerCellAccessible
    structure EntryAccessible = GtkEntryAccessible
    structure EventBoxClass = GtkEventBoxClass
    structure ExpanderClass = GtkExpanderClass
    structure ExpanderAccessibleClass = GtkExpanderAccessibleClass
    structure FileChooserButtonClass = GtkFileChooserButtonClass
    structure FileChooserWidgetClass = GtkFileChooserWidgetClass
    structure Fixed = GtkFixed
    structure FlowBoxAccessibleClass = GtkFlowBoxAccessibleClass
    structure FlowBoxChildClass = GtkFlowBoxChildClass
    structure FlowBoxChildAccessibleClass = GtkFlowBoxChildAccessibleClass
    structure FontChooserWidgetClass = GtkFontChooserWidgetClass
    structure FontSelectionClass = GtkFontSelectionClass
    structure FrameClass = GtkFrameClass
    structure FrameAccessibleClass = GtkFrameAccessibleClass
    structure GestureDragClass = GtkGestureDragClass
    structure GestureLongPressClass = GtkGestureLongPressClass
    structure GestureMultiPressClass = GtkGestureMultiPressClass
    structure GestureRotate = GtkGestureRotate
    structure GestureSingle = GtkGestureSingle
    structure GestureSwipeClass = GtkGestureSwipeClass
    structure GestureZoom = GtkGestureZoom
    structure Grid = GtkGrid
    structure HBoxClass = GtkHBoxClass
    structure HPanedClass = GtkHPanedClass
    structure HScaleClass = GtkHScaleClass
    structure HScrollbarClass = GtkHScrollbarClass
    structure HSeparator = GtkHSeparator
    structure HandleBoxClass = GtkHandleBoxClass
    structure HeaderBar = GtkHeaderBar
    structure IMMulticontext = GtkIMMulticontext
    structure IconView = GtkIconView
    structure IconViewAccessibleClass = GtkIconViewAccessibleClass
    structure Image = GtkImage
    structure ImageAccessible = GtkImageAccessible
    structure ImageCellAccessibleClass = GtkImageCellAccessibleClass
    structure InfoBarClass = GtkInfoBarClass
    structure LabelAccessible = GtkLabelAccessible
    structure Layout = GtkLayout
    structure LevelBarAccessible = GtkLevelBarAccessible
    structure ListBoxAccessibleClass = GtkListBoxAccessibleClass
    structure ListBoxRowClass = GtkListBoxRowClass
    structure ListBoxRowAccessibleClass = GtkListBoxRowAccessibleClass
    structure MenuClass = GtkMenuClass
    structure MenuBarClass = GtkMenuBarClass
    structure MenuItemClass = GtkMenuItemClass
    structure MenuItemAccessibleClass = GtkMenuItemAccessibleClass
    structure MenuShellAccessibleClass = GtkMenuShellAccessibleClass
    structure Notebook = GtkNotebook
    structure NotebookAccessibleClass = GtkNotebookAccessibleClass
    structure OverlayClass = GtkOverlayClass
    structure Paned = GtkPaned
    structure PanedAccessibleClass = GtkPanedAccessibleClass
    structure PopoverClass = GtkPopoverClass
    structure PopoverAccessibleClass = GtkPopoverAccessibleClass
    structure ProgressBarAccessible = GtkProgressBarAccessible
    structure RadioAction = GtkRadioAction
    structure RangeAccessible = GtkRangeAccessible
    structure RecentChooserWidgetClass = GtkRecentChooserWidgetClass
    structure RendererCellAccessible = GtkRendererCellAccessible
    structure RevealerClass = GtkRevealerClass
    structure Scale = GtkScale
    structure ScaleAccessibleClass = GtkScaleAccessibleClass
    structure Scrollbar = GtkScrollbar
    structure ScrolledWindowClass = GtkScrolledWindowClass
    structure ScrolledWindowAccessibleClass = GtkScrolledWindowAccessibleClass
    structure SearchBarClass = GtkSearchBarClass
    structure SearchEntry = GtkSearchEntry
    structure ShortcutLabelClass = GtkShortcutLabelClass
    structure ShortcutsGroupClass = GtkShortcutsGroupClass
    structure ShortcutsSectionClass = GtkShortcutsSectionClass
    structure ShortcutsShortcutClass = GtkShortcutsShortcutClass
    structure Socket = GtkSocket
    structure SpinButton = GtkSpinButton
    structure SpinButtonAccessibleClass = GtkSpinButtonAccessibleClass
    structure SpinnerAccessible = GtkSpinnerAccessible
    structure Stack = GtkStack
    structure StackAccessibleClass = GtkStackAccessibleClass
    structure StackSidebarClass = GtkStackSidebarClass
    structure StackSwitcherClass = GtkStackSwitcherClass
    structure StatusbarClass = GtkStatusbarClass
    structure StatusbarAccessibleClass = GtkStatusbarAccessibleClass
    structure SwitchAccessible = GtkSwitchAccessible
    structure Table = GtkTable
    structure TextCellAccessibleClass = GtkTextCellAccessibleClass
    structure TextView = GtkTextView
    structure TextViewAccessibleClass = GtkTextViewAccessibleClass
    structure ToolItemClass = GtkToolItemClass
    structure TreeSelection = GtkTreeSelection
    structure TreeView = GtkTreeView
    structure TreeViewAccessibleClass = GtkTreeViewAccessibleClass
    structure VBoxClass = GtkVBoxClass
    structure VPanedClass = GtkVPanedClass
    structure VScaleClass = GtkVScaleClass
    structure VScrollbarClass = GtkVScrollbarClass
    structure VSeparator = GtkVSeparator
    structure ViewportClass = GtkViewportClass
    structure WindowClass = GtkWindowClass
    structure WindowAccessibleClass = GtkWindowAccessibleClass
    structure AccelLabel = GtkAccelLabel
    structure ActionBar = GtkActionBar
    structure Alignment = GtkAlignment
    structure AppChooserButtonClass = GtkAppChooserButtonClass
    structure AppChooserWidget = GtkAppChooserWidget
    structure Application = GtkApplication
    structure ApplicationWindowClass = GtkApplicationWindowClass
    structure AspectFrameClass = GtkAspectFrameClass
    structure AssistantClass = GtkAssistantClass
    structure BooleanCellAccessible = GtkBooleanCellAccessible
    structure Button = GtkButton
    structure ButtonAccessible = GtkButtonAccessible
    structure ButtonBox = GtkButtonBox
    structure CheckMenuItemClass = GtkCheckMenuItemClass
    structure CheckMenuItemAccessibleClass = GtkCheckMenuItemAccessibleClass
    structure ColorButtonClass = GtkColorButtonClass
    structure ColorChooserWidget = GtkColorChooserWidget
    structure ColorSelection = GtkColorSelection
    structure ComboBox = GtkComboBox
    structure ComboBoxAccessible = GtkComboBoxAccessible
    structure ComboBoxTextClass = GtkComboBoxTextClass
    structure DialogClass = GtkDialogClass
    structure EventBox = GtkEventBox
    structure Expander = GtkExpander
    structure ExpanderAccessible = GtkExpanderAccessible
    structure FileChooserNative = GtkFileChooserNative
    structure FileChooserWidget = GtkFileChooserWidget
    structure FlowBox = GtkFlowBox
    structure FlowBoxAccessible = GtkFlowBoxAccessible
    structure FlowBoxChild = GtkFlowBoxChild
    structure FlowBoxChildAccessible = GtkFlowBoxChildAccessible
    structure FontButtonClass = GtkFontButtonClass
    structure FontChooserWidget = GtkFontChooserWidget
    structure FontSelection = GtkFontSelection
    structure Frame = GtkFrame
    structure FrameAccessible = GtkFrameAccessible
    structure GestureDrag = GtkGestureDrag
    structure GestureLongPress = GtkGestureLongPress
    structure GestureMultiPress = GtkGestureMultiPress
    structure GesturePanClass = GtkGesturePanClass
    structure GestureSwipe = GtkGestureSwipe
    structure HBox = GtkHBox
    structure HButtonBoxClass = GtkHButtonBoxClass
    structure HPaned = GtkHPaned
    structure HScale = GtkHScale
    structure HScrollbar = GtkHScrollbar
    structure HandleBox = GtkHandleBox
    structure IconViewAccessible = GtkIconViewAccessible
    structure ImageCellAccessible = GtkImageCellAccessible
    structure ImageMenuItemClass = GtkImageMenuItemClass
    structure InfoBar = GtkInfoBar
    structure Label = GtkLabel
    structure LinkButtonClass = GtkLinkButtonClass
    structure LinkButtonAccessibleClass = GtkLinkButtonAccessibleClass
    structure ListBox = GtkListBox
    structure ListBoxAccessible = GtkListBoxAccessible
    structure ListBoxRow = GtkListBoxRow
    structure ListBoxRowAccessible = GtkListBoxRowAccessible
    structure LockButtonClass = GtkLockButtonClass
    structure LockButtonAccessibleClass = GtkLockButtonAccessibleClass
    structure Menu = GtkMenu
    structure MenuAccessibleClass = GtkMenuAccessibleClass
    structure MenuBar = GtkMenuBar
    structure MenuItem = GtkMenuItem
    structure MenuItemAccessible = GtkMenuItemAccessible
    structure MenuShell = GtkMenuShell
    structure MenuShellAccessible = GtkMenuShellAccessible
    structure ModelButtonClass = GtkModelButtonClass
    structure MountOperation = GtkMountOperation
    structure NativeDialog = GtkNativeDialog
    structure NotebookAccessible = GtkNotebookAccessible
    structure NotebookPageAccessible = GtkNotebookPageAccessible
    structure OffscreenWindowClass = GtkOffscreenWindowClass
    structure Overlay = GtkOverlay
    structure PadController = GtkPadController
    structure PanedAccessible = GtkPanedAccessible
    structure PlacesSidebarClass = GtkPlacesSidebarClass
    structure PlugClass = GtkPlugClass
    structure Popover = GtkPopover
    structure PopoverAccessible = GtkPopoverAccessible
    structure PopoverMenuClass = GtkPopoverMenuClass
    structure PrintOperation = GtkPrintOperation
    structure RecentChooserMenuClass = GtkRecentChooserMenuClass
    structure RecentChooserWidget = GtkRecentChooserWidget
    structure Revealer = GtkRevealer
    structure ScaleAccessible = GtkScaleAccessible
    structure ScaleButtonClass = GtkScaleButtonClass
    structure ScaleButtonAccessibleClass = GtkScaleButtonAccessibleClass
    structure ScrolledWindow = GtkScrolledWindow
    structure ScrolledWindowAccessible = GtkScrolledWindowAccessible
    structure SearchBar = GtkSearchBar
    structure SeparatorMenuItemClass = GtkSeparatorMenuItemClass
    structure SeparatorToolItemClass = GtkSeparatorToolItemClass
    structure ShortcutLabel = GtkShortcutLabel
    structure ShortcutsGroup = GtkShortcutsGroup
    structure ShortcutsSection = GtkShortcutsSection
    structure ShortcutsShortcut = GtkShortcutsShortcut
    structure ShortcutsWindowClass = GtkShortcutsWindowClass
    structure SpinButtonAccessible = GtkSpinButtonAccessible
    structure StackAccessible = GtkStackAccessible
    structure StackSidebar = GtkStackSidebar
    structure StackSwitcher = GtkStackSwitcher
    structure StatusIcon = GtkStatusIcon
    structure Statusbar = GtkStatusbar
    structure StatusbarAccessible = GtkStatusbarAccessible
    structure TearoffMenuItemClass = GtkTearoffMenuItemClass
    structure TextCellAccessible = GtkTextCellAccessible
    structure TextViewAccessible = GtkTextViewAccessible
    structure ToggleButtonClass = GtkToggleButtonClass
    structure ToggleButtonAccessibleClass = GtkToggleButtonAccessibleClass
    structure ToolButtonClass = GtkToolButtonClass
    structure ToolItem = GtkToolItem
    structure ToolItemGroup = GtkToolItemGroup
    structure ToolPalette = GtkToolPalette
    structure Toolbar = GtkToolbar
    structure TreeViewAccessible = GtkTreeViewAccessible
    structure VBox = GtkVBox
    structure VButtonBoxClass = GtkVButtonBoxClass
    structure VPaned = GtkVPaned
    structure VScale = GtkVScale
    structure VScrollbar = GtkVScrollbar
    structure Viewport = GtkViewport
    structure Widget = GtkWidget
    structure Window = GtkWindow
    structure WindowAccessible = GtkWindowAccessible
    structure WindowGroup = GtkWindowGroup
    structure AboutDialogClass = GtkAboutDialogClass
    structure AppChooserButton = GtkAppChooserButton
    structure AppChooserDialogClass = GtkAppChooserDialogClass
    structure ApplicationWindow = GtkApplicationWindow
    structure AspectFrame = GtkAspectFrame
    structure Assistant = GtkAssistant
    structure CheckButtonClass = GtkCheckButtonClass
    structure CheckMenuItem = GtkCheckMenuItem
    structure CheckMenuItemAccessible = GtkCheckMenuItemAccessible
    structure ColorButton = GtkColorButton
    structure ColorChooserDialogClass = GtkColorChooserDialogClass
    structure ColorSelectionDialogClass = GtkColorSelectionDialogClass
    structure ComboBoxText = GtkComboBoxText
    structure Dialog = GtkDialog
    structure FileChooserButton = GtkFileChooserButton
    structure FileChooserDialogClass = GtkFileChooserDialogClass
    structure FontButton = GtkFontButton
    structure FontChooserDialogClass = GtkFontChooserDialogClass
    structure FontSelectionDialogClass = GtkFontSelectionDialogClass
    structure GesturePan = GtkGesturePan
    structure HButtonBox = GtkHButtonBox
    structure ImageMenuItem = GtkImageMenuItem
    structure LinkButton = GtkLinkButton
    structure LinkButtonAccessible = GtkLinkButtonAccessible
    structure LockButton = GtkLockButton
    structure LockButtonAccessible = GtkLockButtonAccessible
    structure MenuAccessible = GtkMenuAccessible
    structure MenuButtonClass = GtkMenuButtonClass
    structure MenuButtonAccessibleClass = GtkMenuButtonAccessibleClass
    structure MenuToolButtonClass = GtkMenuToolButtonClass
    structure MessageDialogClass = GtkMessageDialogClass
    structure ModelButton = GtkModelButton
    structure OffscreenWindow = GtkOffscreenWindow
    structure PlacesSidebar = GtkPlacesSidebar
    structure Plug = GtkPlug
    structure PopoverMenu = GtkPopoverMenu
    structure RadioButtonAccessibleClass = GtkRadioButtonAccessibleClass
    structure RadioMenuItemClass = GtkRadioMenuItemClass
    structure RadioMenuItemAccessibleClass = GtkRadioMenuItemAccessibleClass
    structure RecentChooserDialogClass = GtkRecentChooserDialogClass
    structure RecentChooserMenu = GtkRecentChooserMenu
    structure ScaleButton = GtkScaleButton
    structure ScaleButtonAccessible = GtkScaleButtonAccessible
    structure SeparatorMenuItem = GtkSeparatorMenuItem
    structure SeparatorToolItem = GtkSeparatorToolItem
    structure ShortcutsWindow = GtkShortcutsWindow
    structure TearoffMenuItem = GtkTearoffMenuItem
    structure ToggleButton = GtkToggleButton
    structure ToggleButtonAccessible = GtkToggleButtonAccessible
    structure ToggleToolButtonClass = GtkToggleToolButtonClass
    structure ToolButton = GtkToolButton
    structure VButtonBox = GtkVButtonBox
    structure VolumeButtonClass = GtkVolumeButtonClass
    structure AboutDialog = GtkAboutDialog
    structure AppChooserDialog = GtkAppChooserDialog
    structure CheckButton = GtkCheckButton
    structure ColorChooserDialog = GtkColorChooserDialog
    structure ColorSelectionDialog = GtkColorSelectionDialog
    structure FileChooserDialog = GtkFileChooserDialog
    structure FontChooserDialog = GtkFontChooserDialog
    structure FontSelectionDialog = GtkFontSelectionDialog
    structure MenuButton = GtkMenuButton
    structure MenuButtonAccessible = GtkMenuButtonAccessible
    structure MenuToolButton = GtkMenuToolButton
    structure MessageDialog = GtkMessageDialog
    structure RadioButtonClass = GtkRadioButtonClass
    structure RadioButtonAccessible = GtkRadioButtonAccessible
    structure RadioMenuItem = GtkRadioMenuItem
    structure RadioMenuItemAccessible = GtkRadioMenuItemAccessible
    structure RadioToolButtonClass = GtkRadioToolButtonClass
    structure RecentChooserDialog = GtkRecentChooserDialog
    structure ToggleToolButton = GtkToggleToolButton
    structure VolumeButton = GtkVolumeButton
    structure RadioButton = GtkRadioButton
    structure RadioToolButton = GtkRadioToolButton
    val BINARY_AGE = 2217
    val INPUT_ERROR = ~1
    val INTERFACE_AGE = 17
    val LEVEL_BAR_OFFSET_FULL = "full"
    val LEVEL_BAR_OFFSET_HIGH = "high"
    val LEVEL_BAR_OFFSET_LOW = "low"
    val MAJOR_VERSION = 3
    val MAX_COMPOSE_LEN = 7
    val MICRO_VERSION = 17
    val MINOR_VERSION = 22
    val PAPER_NAME_A3 = "iso_a3"
    val PAPER_NAME_A4 = "iso_a4"
    val PAPER_NAME_A5 = "iso_a5"
    val PAPER_NAME_B5 = "iso_b5"
    val PAPER_NAME_EXECUTIVE = "na_executive"
    val PAPER_NAME_LEGAL = "na_legal"
    val PAPER_NAME_LETTER = "na_letter"
    val PATH_PRIO_MASK = 15
    val PRINT_SETTINGS_COLLATE = "collate"
    val PRINT_SETTINGS_DEFAULT_SOURCE = "default-source"
    val PRINT_SETTINGS_DITHER = "dither"
    val PRINT_SETTINGS_DUPLEX = "duplex"
    val PRINT_SETTINGS_FINISHINGS = "finishings"
    val PRINT_SETTINGS_MEDIA_TYPE = "media-type"
    val PRINT_SETTINGS_NUMBER_UP = "number-up"
    val PRINT_SETTINGS_NUMBER_UP_LAYOUT = "number-up-layout"
    val PRINT_SETTINGS_N_COPIES = "n-copies"
    val PRINT_SETTINGS_ORIENTATION = "orientation"
    val PRINT_SETTINGS_OUTPUT_BASENAME = "output-basename"
    val PRINT_SETTINGS_OUTPUT_BIN = "output-bin"
    val PRINT_SETTINGS_OUTPUT_DIR = "output-dir"
    val PRINT_SETTINGS_OUTPUT_FILE_FORMAT = "output-file-format"
    val PRINT_SETTINGS_OUTPUT_URI = "output-uri"
    val PRINT_SETTINGS_PAGE_RANGES = "page-ranges"
    val PRINT_SETTINGS_PAGE_SET = "page-set"
    val PRINT_SETTINGS_PAPER_FORMAT = "paper-format"
    val PRINT_SETTINGS_PAPER_HEIGHT = "paper-height"
    val PRINT_SETTINGS_PAPER_WIDTH = "paper-width"
    val PRINT_SETTINGS_PRINTER = "printer"
    val PRINT_SETTINGS_PRINTER_LPI = "printer-lpi"
    val PRINT_SETTINGS_PRINT_PAGES = "print-pages"
    val PRINT_SETTINGS_QUALITY = "quality"
    val PRINT_SETTINGS_RESOLUTION = "resolution"
    val PRINT_SETTINGS_RESOLUTION_X = "resolution-x"
    val PRINT_SETTINGS_RESOLUTION_Y = "resolution-y"
    val PRINT_SETTINGS_REVERSE = "reverse"
    val PRINT_SETTINGS_SCALE = "scale"
    val PRINT_SETTINGS_USE_COLOR = "use-color"
    val PRINT_SETTINGS_WIN32_DRIVER_EXTRA = "win32-driver-extra"
    val PRINT_SETTINGS_WIN32_DRIVER_VERSION = "win32-driver-version"
    val PRIORITY_RESIZE = 10
    val STOCK_ABOUT = "gtk-about"
    val STOCK_ADD = "gtk-add"
    val STOCK_APPLY = "gtk-apply"
    val STOCK_BOLD = "gtk-bold"
    val STOCK_CANCEL = "gtk-cancel"
    val STOCK_CAPS_LOCK_WARNING = "gtk-caps-lock-warning"
    val STOCK_CDROM = "gtk-cdrom"
    val STOCK_CLEAR = "gtk-clear"
    val STOCK_CLOSE = "gtk-close"
    val STOCK_COLOR_PICKER = "gtk-color-picker"
    val STOCK_CONNECT = "gtk-connect"
    val STOCK_CONVERT = "gtk-convert"
    val STOCK_COPY = "gtk-copy"
    val STOCK_CUT = "gtk-cut"
    val STOCK_DELETE = "gtk-delete"
    val STOCK_DIALOG_AUTHENTICATION = "gtk-dialog-authentication"
    val STOCK_DIALOG_ERROR = "gtk-dialog-error"
    val STOCK_DIALOG_INFO = "gtk-dialog-info"
    val STOCK_DIALOG_QUESTION = "gtk-dialog-question"
    val STOCK_DIALOG_WARNING = "gtk-dialog-warning"
    val STOCK_DIRECTORY = "gtk-directory"
    val STOCK_DISCARD = "gtk-discard"
    val STOCK_DISCONNECT = "gtk-disconnect"
    val STOCK_DND = "gtk-dnd"
    val STOCK_DND_MULTIPLE = "gtk-dnd-multiple"
    val STOCK_EDIT = "gtk-edit"
    val STOCK_EXECUTE = "gtk-execute"
    val STOCK_FILE = "gtk-file"
    val STOCK_FIND = "gtk-find"
    val STOCK_FIND_AND_REPLACE = "gtk-find-and-replace"
    val STOCK_FLOPPY = "gtk-floppy"
    val STOCK_FULLSCREEN = "gtk-fullscreen"
    val STOCK_GOTO_BOTTOM = "gtk-goto-bottom"
    val STOCK_GOTO_FIRST = "gtk-goto-first"
    val STOCK_GOTO_LAST = "gtk-goto-last"
    val STOCK_GOTO_TOP = "gtk-goto-top"
    val STOCK_GO_BACK = "gtk-go-back"
    val STOCK_GO_DOWN = "gtk-go-down"
    val STOCK_GO_FORWARD = "gtk-go-forward"
    val STOCK_GO_UP = "gtk-go-up"
    val STOCK_HARDDISK = "gtk-harddisk"
    val STOCK_HELP = "gtk-help"
    val STOCK_HOME = "gtk-home"
    val STOCK_INDENT = "gtk-indent"
    val STOCK_INDEX = "gtk-index"
    val STOCK_INFO = "gtk-info"
    val STOCK_ITALIC = "gtk-italic"
    val STOCK_JUMP_TO = "gtk-jump-to"
    val STOCK_JUSTIFY_CENTER = "gtk-justify-center"
    val STOCK_JUSTIFY_FILL = "gtk-justify-fill"
    val STOCK_JUSTIFY_LEFT = "gtk-justify-left"
    val STOCK_JUSTIFY_RIGHT = "gtk-justify-right"
    val STOCK_LEAVE_FULLSCREEN = "gtk-leave-fullscreen"
    val STOCK_MEDIA_FORWARD = "gtk-media-forward"
    val STOCK_MEDIA_NEXT = "gtk-media-next"
    val STOCK_MEDIA_PAUSE = "gtk-media-pause"
    val STOCK_MEDIA_PLAY = "gtk-media-play"
    val STOCK_MEDIA_PREVIOUS = "gtk-media-previous"
    val STOCK_MEDIA_RECORD = "gtk-media-record"
    val STOCK_MEDIA_REWIND = "gtk-media-rewind"
    val STOCK_MEDIA_STOP = "gtk-media-stop"
    val STOCK_MISSING_IMAGE = "gtk-missing-image"
    val STOCK_NETWORK = "gtk-network"
    val STOCK_NEW = "gtk-new"
    val STOCK_NO = "gtk-no"
    val STOCK_OK = "gtk-ok"
    val STOCK_OPEN = "gtk-open"
    val STOCK_ORIENTATION_LANDSCAPE = "gtk-orientation-landscape"
    val STOCK_ORIENTATION_PORTRAIT = "gtk-orientation-portrait"
    val STOCK_ORIENTATION_REVERSE_LANDSCAPE = "gtk-orientation-reverse-landscape"
    val STOCK_ORIENTATION_REVERSE_PORTRAIT = "gtk-orientation-reverse-portrait"
    val STOCK_PAGE_SETUP = "gtk-page-setup"
    val STOCK_PASTE = "gtk-paste"
    val STOCK_PREFERENCES = "gtk-preferences"
    val STOCK_PRINT = "gtk-print"
    val STOCK_PRINT_ERROR = "gtk-print-error"
    val STOCK_PRINT_PAUSED = "gtk-print-paused"
    val STOCK_PRINT_PREVIEW = "gtk-print-preview"
    val STOCK_PRINT_REPORT = "gtk-print-report"
    val STOCK_PRINT_WARNING = "gtk-print-warning"
    val STOCK_PROPERTIES = "gtk-properties"
    val STOCK_QUIT = "gtk-quit"
    val STOCK_REDO = "gtk-redo"
    val STOCK_REFRESH = "gtk-refresh"
    val STOCK_REMOVE = "gtk-remove"
    val STOCK_REVERT_TO_SAVED = "gtk-revert-to-saved"
    val STOCK_SAVE = "gtk-save"
    val STOCK_SAVE_AS = "gtk-save-as"
    val STOCK_SELECT_ALL = "gtk-select-all"
    val STOCK_SELECT_COLOR = "gtk-select-color"
    val STOCK_SELECT_FONT = "gtk-select-font"
    val STOCK_SORT_ASCENDING = "gtk-sort-ascending"
    val STOCK_SORT_DESCENDING = "gtk-sort-descending"
    val STOCK_SPELL_CHECK = "gtk-spell-check"
    val STOCK_STOP = "gtk-stop"
    val STOCK_STRIKETHROUGH = "gtk-strikethrough"
    val STOCK_UNDELETE = "gtk-undelete"
    val STOCK_UNDERLINE = "gtk-underline"
    val STOCK_UNDO = "gtk-undo"
    val STOCK_UNINDENT = "gtk-unindent"
    val STOCK_YES = "gtk-yes"
    val STOCK_ZOOM_100 = "gtk-zoom-100"
    val STOCK_ZOOM_FIT = "gtk-zoom-fit"
    val STOCK_ZOOM_IN = "gtk-zoom-in"
    val STOCK_ZOOM_OUT = "gtk-zoom-out"
    val STYLE_CLASS_ACCELERATOR = "accelerator"
    val STYLE_CLASS_ARROW = "arrow"
    val STYLE_CLASS_BACKGROUND = "background"
    val STYLE_CLASS_BOTTOM = "bottom"
    val STYLE_CLASS_BUTTON = "button"
    val STYLE_CLASS_CALENDAR = "calendar"
    val STYLE_CLASS_CELL = "cell"
    val STYLE_CLASS_CHECK = "check"
    val STYLE_CLASS_COMBOBOX_ENTRY = "combobox-entry"
    val STYLE_CLASS_CONTEXT_MENU = "context-menu"
    val STYLE_CLASS_CSD = "csd"
    val STYLE_CLASS_CURSOR_HANDLE = "cursor-handle"
    val STYLE_CLASS_DEFAULT = "default"
    val STYLE_CLASS_DESTRUCTIVE_ACTION = "destructive-action"
    val STYLE_CLASS_DIM_LABEL = "dim-label"
    val STYLE_CLASS_DND = "dnd"
    val STYLE_CLASS_DOCK = "dock"
    val STYLE_CLASS_ENTRY = "entry"
    val STYLE_CLASS_ERROR = "error"
    val STYLE_CLASS_EXPANDER = "expander"
    val STYLE_CLASS_FLAT = "flat"
    val STYLE_CLASS_FRAME = "frame"
    val STYLE_CLASS_GRIP = "grip"
    val STYLE_CLASS_HEADER = "header"
    val STYLE_CLASS_HIGHLIGHT = "highlight"
    val STYLE_CLASS_HORIZONTAL = "horizontal"
    val STYLE_CLASS_IMAGE = "image"
    val STYLE_CLASS_INFO = "info"
    val STYLE_CLASS_INLINE_TOOLBAR = "inline-toolbar"
    val STYLE_CLASS_INSERTION_CURSOR = "insertion-cursor"
    val STYLE_CLASS_LABEL = "label"
    val STYLE_CLASS_LEFT = "left"
    val STYLE_CLASS_LEVEL_BAR = "level-bar"
    val STYLE_CLASS_LINKED = "linked"
    val STYLE_CLASS_LIST = "list"
    val STYLE_CLASS_LIST_ROW = "list-row"
    val STYLE_CLASS_MARK = "mark"
    val STYLE_CLASS_MENU = "menu"
    val STYLE_CLASS_MENUBAR = "menubar"
    val STYLE_CLASS_MENUITEM = "menuitem"
    val STYLE_CLASS_MESSAGE_DIALOG = "message-dialog"
    val STYLE_CLASS_MONOSPACE = "monospace"
    val STYLE_CLASS_NEEDS_ATTENTION = "needs-attention"
    val STYLE_CLASS_NOTEBOOK = "notebook"
    val STYLE_CLASS_OSD = "osd"
    val STYLE_CLASS_OVERSHOOT = "overshoot"
    val STYLE_CLASS_PANE_SEPARATOR = "pane-separator"
    val STYLE_CLASS_PAPER = "paper"
    val STYLE_CLASS_POPOVER = "popover"
    val STYLE_CLASS_POPUP = "popup"
    val STYLE_CLASS_PRIMARY_TOOLBAR = "primary-toolbar"
    val STYLE_CLASS_PROGRESSBAR = "progressbar"
    val STYLE_CLASS_PULSE = "pulse"
    val STYLE_CLASS_QUESTION = "question"
    val STYLE_CLASS_RADIO = "radio"
    val STYLE_CLASS_RAISED = "raised"
    val STYLE_CLASS_READ_ONLY = "read-only"
    val STYLE_CLASS_RIGHT = "right"
    val STYLE_CLASS_RUBBERBAND = "rubberband"
    val STYLE_CLASS_SCALE = "scale"
    val STYLE_CLASS_SCALE_HAS_MARKS_ABOVE = "scale-has-marks-above"
    val STYLE_CLASS_SCALE_HAS_MARKS_BELOW = "scale-has-marks-below"
    val STYLE_CLASS_SCROLLBAR = "scrollbar"
    val STYLE_CLASS_SCROLLBARS_JUNCTION = "scrollbars-junction"
    val STYLE_CLASS_SEPARATOR = "separator"
    val STYLE_CLASS_SIDEBAR = "sidebar"
    val STYLE_CLASS_SLIDER = "slider"
    val STYLE_CLASS_SPINBUTTON = "spinbutton"
    val STYLE_CLASS_SPINNER = "spinner"
    val STYLE_CLASS_STATUSBAR = "statusbar"
    val STYLE_CLASS_SUBTITLE = "subtitle"
    val STYLE_CLASS_SUGGESTED_ACTION = "suggested-action"
    val STYLE_CLASS_TITLE = "title"
    val STYLE_CLASS_TITLEBAR = "titlebar"
    val STYLE_CLASS_TOOLBAR = "toolbar"
    val STYLE_CLASS_TOOLTIP = "tooltip"
    val STYLE_CLASS_TOP = "top"
    val STYLE_CLASS_TOUCH_SELECTION = "touch-selection"
    val STYLE_CLASS_TROUGH = "trough"
    val STYLE_CLASS_UNDERSHOOT = "undershoot"
    val STYLE_CLASS_VERTICAL = "vertical"
    val STYLE_CLASS_VIEW = "view"
    val STYLE_CLASS_WARNING = "warning"
    val STYLE_CLASS_WIDE = "wide"
    val STYLE_PROPERTY_BACKGROUND_COLOR = "background-color"
    val STYLE_PROPERTY_BACKGROUND_IMAGE = "background-image"
    val STYLE_PROPERTY_BORDER_COLOR = "border-color"
    val STYLE_PROPERTY_BORDER_RADIUS = "border-radius"
    val STYLE_PROPERTY_BORDER_STYLE = "border-style"
    val STYLE_PROPERTY_BORDER_WIDTH = "border-width"
    val STYLE_PROPERTY_COLOR = "color"
    val STYLE_PROPERTY_FONT = "font"
    val STYLE_PROPERTY_MARGIN = "margin"
    val STYLE_PROPERTY_PADDING = "padding"
    val STYLE_PROVIDER_PRIORITY_APPLICATION = 600
    val STYLE_PROVIDER_PRIORITY_FALLBACK = 1
    val STYLE_PROVIDER_PRIORITY_SETTINGS = 400
    val STYLE_PROVIDER_PRIORITY_THEME = 200
    val STYLE_PROVIDER_PRIORITY_USER = 800
    val STYLE_REGION_COLUMN = "column"
    val STYLE_REGION_COLUMN_HEADER = "column-header"
    val STYLE_REGION_ROW = "row"
    val STYLE_REGION_TAB = "tab"
    val TEXT_VIEW_PRIORITY_VALIDATE = 5
    val TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = ~1
    val TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = ~2
    fun accelGroupsActivate
      (
        object,
        accelKey,
        accelMods
      ) =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        accelGroupsActivate_
        (
          object
           & accelKey
           & accelMods
        )
    fun acceleratorGetDefaultModMask () = (I ---> GdkModifierType.FFI.fromVal) acceleratorGetDefaultModMask_ ()
    fun acceleratorGetLabel (acceleratorKey, acceleratorMods) = (GUInt32.FFI.withVal &&&> GdkModifierType.FFI.withVal ---> Utf8.FFI.fromPtr 1) acceleratorGetLabel_ (acceleratorKey & acceleratorMods)
    fun acceleratorGetLabelWithKeycode
      (
        display,
        acceleratorKey,
        keycode,
        acceleratorMods
      ) =
      (
        GdkDisplayClass.FFI.withOptPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        acceleratorGetLabelWithKeycode_
        (
          display
           & acceleratorKey
           & keycode
           & acceleratorMods
        )
    fun acceleratorName (acceleratorKey, acceleratorMods) = (GUInt32.FFI.withVal &&&> GdkModifierType.FFI.withVal ---> Utf8.FFI.fromPtr 1) acceleratorName_ (acceleratorKey & acceleratorMods)
    fun acceleratorNameWithKeycode
      (
        display,
        acceleratorKey,
        keycode,
        acceleratorMods
      ) =
      (
        GdkDisplayClass.FFI.withOptPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        acceleratorNameWithKeycode_
        (
          display
           & acceleratorKey
           & keycode
           & acceleratorMods
        )
    fun acceleratorParse accelerator =
      let
        val acceleratorKey
         & acceleratorMods
         & () =
          (
            Utf8.FFI.withPtr
             &&&> GUInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && I
          )
            acceleratorParse_
            (
              accelerator
               & GUInt32.null
               & GdkModifierType.flags []
            )
      in
        (acceleratorKey, acceleratorMods)
      end
    fun acceleratorParseWithKeycode accelerator =
      let
        val acceleratorKey
         & acceleratorCodes
         & acceleratorMods
         & () =
          (
            Utf8.FFI.withPtr
             &&&> GUInt32.FFI.withRefVal
             &&&> GUInt32CVector.FFI.withRefOptPtr
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GUInt32CVector.FFI.fromPtr 1
                   && GdkModifierType.FFI.fromVal
                   && I
          )
            acceleratorParseWithKeycode_
            (
              accelerator
               & GUInt32.null
               & NONE
               & GdkModifierType.flags []
            )
      in
        (
          acceleratorKey,
          acceleratorCodes,
          acceleratorMods
        )
      end
    fun acceleratorSetDefaultModMask defaultModMask = (GdkModifierType.FFI.withVal ---> I) acceleratorSetDefaultModMask_ defaultModMask
    fun acceleratorValid (keyval, modifiers) = (GUInt32.FFI.withVal &&&> GdkModifierType.FFI.withVal ---> GBool.FFI.fromVal) acceleratorValid_ (keyval & modifiers)
    fun alternativeDialogButtonOrder screen = (GdkScreenClass.FFI.withOptPtr ---> GBool.FFI.fromVal) alternativeDialogButtonOrder_ screen
    fun builderErrorQuark () = (I ---> GUInt32.FFI.fromVal) builderErrorQuark_ ()
    fun cairoShouldDrawWindow (cr, window) = (CairoContextRecord.FFI.withPtr &&&> GdkWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) cairoShouldDrawWindow_ (cr & window)
    fun cairoTransformToWindow
      (
        cr,
        widget,
        window
      ) =
      (
        CairoContextRecord.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withPtr
         ---> I
      )
        cairoTransformToWindow_
        (
          cr
           & widget
           & window
        )
    fun checkVersion
      (
        requiredMajor,
        requiredMinor,
        requiredMicro
      ) =
      (
        GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> Utf8.FFI.fromOptPtr 0
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun cssProviderErrorQuark () = (I ---> GUInt32.FFI.fromVal) cssProviderErrorQuark_ ()
    fun deviceGrabAdd
      (
        widget,
        device,
        blockOthers
      ) =
      (
        GtkWidgetClass.FFI.withPtr
         &&&> GdkDeviceClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        deviceGrabAdd_
        (
          widget
           & device
           & blockOthers
        )
    fun deviceGrabRemove (widget, device) = (GtkWidgetClass.FFI.withPtr &&&> GdkDeviceClass.FFI.withPtr ---> I) deviceGrabRemove_ (widget & device)
    fun disableSetlocale () = (I ---> I) disableSetlocale_ ()
    fun dragCancel context = (GdkDragContextClass.FFI.withPtr ---> I) dragCancel_ context
    fun dragFinish
      (
        context,
        success,
        del,
        time
      ) =
      (
        GdkDragContextClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        dragFinish_
        (
          context
           & success
           & del
           & time
        )
    fun dragGetSourceWidget context = (GdkDragContextClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) dragGetSourceWidget_ context
    fun dragSetIconDefault context = (GdkDragContextClass.FFI.withPtr ---> I) dragSetIconDefault_ context
    fun dragSetIconGicon
      (
        context,
        icon,
        hotX,
        hotY
      ) =
      (
        GdkDragContextClass.FFI.withPtr
         &&&> GioIconClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        dragSetIconGicon_
        (
          context
           & icon
           & hotX
           & hotY
        )
    fun dragSetIconName
      (
        context,
        iconName,
        hotX,
        hotY
      ) =
      (
        GdkDragContextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        dragSetIconName_
        (
          context
           & iconName
           & hotX
           & hotY
        )
    fun dragSetIconPixbuf
      (
        context,
        pixbuf,
        hotX,
        hotY
      ) =
      (
        GdkDragContextClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        dragSetIconPixbuf_
        (
          context
           & pixbuf
           & hotX
           & hotY
        )
    fun dragSetIconStock
      (
        context,
        stockId,
        hotX,
        hotY
      ) =
      (
        GdkDragContextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        dragSetIconStock_
        (
          context
           & stockId
           & hotX
           & hotY
        )
    fun dragSetIconSurface (context, surface) = (GdkDragContextClass.FFI.withPtr &&&> CairoSurfaceRecord.FFI.withPtr ---> I) dragSetIconSurface_ (context & surface)
    fun dragSetIconWidget
      (
        context,
        widget,
        hotX,
        hotY
      ) =
      (
        GdkDragContextClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        dragSetIconWidget_
        (
          context
           & widget
           & hotX
           & hotY
        )
    fun drawInsertionCursor
      (
        widget,
        cr,
        location,
        isPrimary,
        direction,
        drawArrow
      ) =
      (
        GtkWidgetClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GtkTextDirection.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        drawInsertionCursor_
        (
          widget
           & cr
           & location
           & isPrimary
           & direction
           & drawArrow
        )
    fun eventsPending () = (I ---> GBool.FFI.fromVal) eventsPending_ ()
    fun fileChooserErrorQuark () = (I ---> GUInt32.FFI.fromVal) fileChooserErrorQuark_ ()
    fun getBinaryAge () = (I ---> GUInt32.FFI.fromVal) getBinaryAge_ ()
    fun getCurrentEvent () = (I ---> GdkEvent.FFI.fromOptPtr true) getCurrentEvent_ ()
    fun getCurrentEventDevice () = (I ---> GdkDeviceClass.FFI.fromOptPtr false) getCurrentEventDevice_ ()
    fun getCurrentEventState () =
      let
        val state & retVal = (GdkModifierType.FFI.withRefVal ---> GdkModifierType.FFI.fromVal && GBool.FFI.fromVal) getCurrentEventState_ (GdkModifierType.flags [])
      in
        if retVal then SOME state else NONE
      end
    fun getCurrentEventTime () = (I ---> GUInt32.FFI.fromVal) getCurrentEventTime_ ()
    fun getDebugFlags () = (I ---> GUInt32.FFI.fromVal) getDebugFlags_ ()
    fun getDefaultLanguage () = (I ---> PangoLanguageRecord.FFI.fromPtr false) getDefaultLanguage_ ()
    fun getEventWidget event = (GdkEvent.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getEventWidget_ event
    fun getInterfaceAge () = (I ---> GUInt32.FFI.fromVal) getInterfaceAge_ ()
    fun getLocaleDirection () = (I ---> GtkTextDirection.FFI.fromVal) getLocaleDirection_ ()
    fun getMajorVersion () = (I ---> GUInt32.FFI.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> GUInt32.FFI.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> GUInt32.FFI.fromVal) getMinorVersion_ ()
    fun getOptionGroup openDefaultDisplay = (GBool.FFI.withVal ---> GLibOptionGroupRecord.FFI.fromPtr true) getOptionGroup_ openDefaultDisplay
    fun grabGetCurrent () = (I ---> GtkWidgetClass.FFI.fromOptPtr false) grabGetCurrent_ ()
    fun iconSizeFromName name = (Utf8.FFI.withPtr ---> GInt32.FFI.fromVal) iconSizeFromName_ name
    fun iconSizeGetName size = (GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) iconSizeGetName_ size
    fun iconSizeLookup size =
      let
        val width
         & height
         & retVal =
          (
            GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            iconSizeLookup_
            (
              size
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun iconSizeLookupForSettings (settings, size) =
      let
        val width
         & height
         & retVal =
          (
            GtkSettingsClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            iconSizeLookupForSettings_
            (
              settings
               & size
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun iconSizeRegister
      (
        name,
        width,
        height
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        iconSizeRegister_
        (
          name
           & width
           & height
        )
    fun iconSizeRegisterAlias (alias, target) = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) iconSizeRegisterAlias_ (alias & target)
    fun iconThemeErrorQuark () = (I ---> GUInt32.FFI.fromVal) iconThemeErrorQuark_ ()
    fun init argv =
      let
        val argc = LargeInt.fromInt (Utf8CVectorN.length argv)
        val argc
         & argv
         & () =
          (
            GInt32.FFI.withRefVal &&&> Utf8CVectorN.FFI.withRefDupPtr 2
             ---> GInt32.FFI.fromVal
                   && Utf8CVectorN.FFI.fromPtr 2
                   && I
          )
            init_
            (argc & argv)
      in
        argv (LargeInt.toInt argc)
      end
    fun initCheck argv =
      let
        val argc = LargeInt.fromInt (Utf8CVectorN.length argv)
        val argc
         & argv
         & retVal =
          (
            GInt32.FFI.withRefVal &&&> Utf8CVectorN.FFI.withRefDupPtr 2
             ---> GInt32.FFI.fromVal
                   && Utf8CVectorN.FFI.fromPtr 2
                   && GBool.FFI.fromVal
          )
            initCheck_
            (argc & argv)
      in
        (retVal, argv (LargeInt.toInt argc))
      end
    fun initWithArgs
      (
        argv,
        parameterString,
        entries,
        translationDomain
      ) =
      let
        val argc = LargeInt.fromInt (Utf8CVectorN.length argv)
        val argc
         & argv
         & () =
          (
            GInt32.FFI.withRefVal
             &&&> Utf8CVectorN.FFI.withRefDupPtr 2
             &&&> Utf8.FFI.withOptPtr
             &&&> GLibOptionEntryRecordCVector.FFI.withPtr
             &&&> Utf8.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt32.FFI.fromVal
                   && Utf8CVectorN.FFI.fromPtr 2
                   && ignore
          )
            initWithArgs_
            (
              argc
               & argv
               & parameterString
               & entries
               & translationDomain
               & []
            )
      in
        argv (LargeInt.toInt argc)
      end
    fun keySnooperRemove snooperHandlerId = (GUInt32.FFI.withVal ---> I) keySnooperRemove_ snooperHandlerId
    fun main () = (I ---> I) main_ ()
    fun mainDoEvent event = (GdkEvent.FFI.withPtr ---> I) mainDoEvent_ event
    fun mainIteration () = (I ---> GBool.FFI.fromVal) mainIteration_ ()
    fun mainIterationDo blocking = (GBool.FFI.withVal ---> GBool.FFI.fromVal) mainIterationDo_ blocking
    fun mainLevel () = (I ---> GUInt32.FFI.fromVal) mainLevel_ ()
    fun mainQuit () = (I ---> I) mainQuit_ ()
    fun paintArrow
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        arrowType,
        fill,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GtkArrowType.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintArrow_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & arrowType
           & fill
           & x
           & y
           & width
           & height
        )
    fun paintBox
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintBox_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintBoxGap
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height,
        gapSide,
        gapX,
        gapWidth
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkPositionType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintBoxGap_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & gapSide
           & gapX
           & gapWidth
        )
    fun paintCheck
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintCheck_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintDiamond
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintDiamond_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintExpander
      (
        style,
        cr,
        stateType,
        widget,
        detail,
        x,
        y,
        expanderStyle
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkExpanderStyle.FFI.withVal
         ---> I
      )
        paintExpander_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & x
           & y
           & expanderStyle
        )
    fun paintExtension
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height,
        gapSide
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkPositionType.FFI.withVal
         ---> I
      )
        paintExtension_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & gapSide
        )
    fun paintFlatBox
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintFlatBox_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintFocus
      (
        style,
        cr,
        stateType,
        widget,
        detail,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintFocus_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintHandle
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height,
        orientation
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkOrientation.FFI.withVal
         ---> I
      )
        paintHandle_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & orientation
        )
    fun paintHline
      (
        style,
        cr,
        stateType,
        widget,
        detail,
        x1,
        x2,
        y
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintHline_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & x1
           & x2
           & y
        )
    fun paintLayout
      (
        style,
        cr,
        stateType,
        useText,
        widget,
        detail,
        x,
        y,
        layout
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> PangoLayoutClass.FFI.withPtr
         ---> I
      )
        paintLayout_
        (
          style
           & cr
           & stateType
           & useText
           & widget
           & detail
           & x
           & y
           & layout
        )
    fun paintOption
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintOption_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintResizeGrip
      (
        style,
        cr,
        stateType,
        widget,
        detail,
        edge,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GdkWindowEdge.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintResizeGrip_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & edge
           & x
           & y
           & width
           & height
        )
    fun paintShadow
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintShadow_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintShadowGap
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height,
        gapSide,
        gapX,
        gapWidth
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkPositionType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintShadowGap_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & gapSide
           & gapX
           & gapWidth
        )
    fun paintSlider
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height,
        orientation
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkOrientation.FFI.withVal
         ---> I
      )
        paintSlider_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
           & orientation
        )
    fun paintSpinner
      (
        style,
        cr,
        stateType,
        widget,
        detail,
        step,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GUInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintSpinner_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & step
           & x
           & y
           & width
           & height
        )
    fun paintTab
      (
        style,
        cr,
        stateType,
        shadowType,
        widget,
        detail,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkShadowType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintTab_
        (
          style
           & cr
           & stateType
           & shadowType
           & widget
           & detail
           & x
           & y
           & width
           & height
        )
    fun paintVline
      (
        style,
        cr,
        stateType,
        widget,
        detail,
        y1,
        y2,
        x
      ) =
      (
        GtkStyleClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GtkStateType.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        paintVline_
        (
          style
           & cr
           & stateType
           & widget
           & detail
           & y1
           & y2
           & x
        )
    fun paperSizeGetDefault () = (I ---> Utf8.FFI.fromPtr 0) paperSizeGetDefault_ ()
    fun parseArgs argv =
      let
        val argc = LargeInt.fromInt (Utf8CVectorN.length argv)
        val argc
         & argv
         & retVal =
          (
            GInt32.FFI.withRefVal &&&> Utf8CVectorN.FFI.withRefDupPtr 2
             ---> GInt32.FFI.fromVal
                   && Utf8CVectorN.FFI.fromPtr 2
                   && GBool.FFI.fromVal
          )
            parseArgs_
            (argc & argv)
      in
        (retVal, argv (LargeInt.toInt argc))
      end
    fun printErrorQuark () = (I ---> GUInt32.FFI.fromVal) printErrorQuark_ ()
    fun printRunPageSetupDialog
      (
        parent,
        pageSetup,
        settings
      ) =
      (
        GtkWindowClass.FFI.withOptPtr
         &&&> GtkPageSetupClass.FFI.withOptPtr
         &&&> GtkPrintSettingsClass.FFI.withPtr
         ---> GtkPageSetupClass.FFI.fromPtr true
      )
        printRunPageSetupDialog_
        (
          parent
           & pageSetup
           & settings
        )
    fun propagateEvent (widget, event) = (GtkWidgetClass.FFI.withPtr &&&> GdkEvent.FFI.withPtr ---> I) propagateEvent_ (widget & event)
    fun rcAddDefaultFile filename = (Utf8.FFI.withPtr ---> I) rcAddDefaultFile_ filename
    fun rcFindModuleInPath moduleFile = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) rcFindModuleInPath_ moduleFile
    fun rcGetDefaultFiles () = (I ---> Utf8CVector.FFI.fromPtr 0) rcGetDefaultFiles_ ()
    fun rcGetImModuleFile () = (I ---> Utf8.FFI.fromPtr 1) rcGetImModuleFile_ ()
    fun rcGetImModulePath () = (I ---> Utf8.FFI.fromPtr 1) rcGetImModulePath_ ()
    fun rcGetModuleDir () = (I ---> Utf8.FFI.fromPtr 1) rcGetModuleDir_ ()
    fun rcGetStyle widget = (GtkWidgetClass.FFI.withPtr ---> GtkStyleClass.FFI.fromPtr false) rcGetStyle_ widget
    fun rcGetThemeDir () = (I ---> Utf8.FFI.fromPtr 1) rcGetThemeDir_ ()
    fun rcParse filename = (Utf8.FFI.withPtr ---> I) rcParse_ filename
    fun rcParseString rcString = (Utf8.FFI.withPtr ---> I) rcParseString_ rcString
    fun rcReparseAll () = (I ---> GBool.FFI.fromVal) rcReparseAll_ ()
    fun rcReparseAllForSettings (settings, forceLoad) = (GtkSettingsClass.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) rcReparseAllForSettings_ (settings & forceLoad)
    fun rcResetStyles settings = (GtkSettingsClass.FFI.withPtr ---> I) rcResetStyles_ settings
    fun rcSetDefaultFiles filenames = (Utf8CVector.FFI.withPtr ---> I) rcSetDefaultFiles_ filenames
    fun recentChooserErrorQuark () = (I ---> GUInt32.FFI.fromVal) recentChooserErrorQuark_ ()
    fun recentManagerErrorQuark () = (I ---> GUInt32.FFI.fromVal) recentManagerErrorQuark_ ()
    fun renderActivity
      (
        context,
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderActivity_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderArrow
      (
        context,
        cr,
        angle,
        x,
        y,
        size
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderArrow_
        (
          context
           & cr
           & angle
           & x
           & y
           & size
        )
    fun renderBackground
      (
        context,
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderBackground_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderBackgroundGetClip
      (
        context,
        x,
        y,
        width,
        height
      ) =
      let
        val outClip & () =
          (
            GtkStyleContextClass.FFI.withPtr
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            renderBackgroundGetClip_
            (
              context
               & x
               & y
               & width
               & height
               & ()
            )
      in
        outClip
      end
    fun renderCheck
      (
        context,
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderCheck_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderExpander
      (
        context,
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderExpander_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderExtension
      (
        context,
        cr,
        x,
        y,
        width,
        height,
        gapSide
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GtkPositionType.FFI.withVal
         ---> I
      )
        renderExtension_
        (
          context
           & cr
           & x
           & y
           & width
           & height
           & gapSide
        )
    fun renderFocus
      (
        context,
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderFocus_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderFrame
      (
        context,
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderFrame_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderFrameGap
      (
        context,
        cr,
        x,
        y,
        width,
        height,
        gapSide,
        xy0Gap,
        xy1Gap
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GtkPositionType.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderFrameGap_
        (
          context
           & cr
           & x
           & y
           & width
           & height
           & gapSide
           & xy0Gap
           & xy1Gap
        )
    fun renderHandle
      (
        context,
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderHandle_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderIcon
      (
        context,
        cr,
        pixbuf,
        x,
        y
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderIcon_
        (
          context
           & cr
           & pixbuf
           & x
           & y
        )
    fun renderIconPixbuf
      (
        context,
        source,
        size
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> GtkIconSourceRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        renderIconPixbuf_
        (
          context
           & source
           & size
        )
    fun renderIconSurface
      (
        context,
        cr,
        surface,
        x,
        y
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> CairoSurfaceRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderIconSurface_
        (
          context
           & cr
           & surface
           & x
           & y
        )
    fun renderInsertionCursor
      (
        context,
        cr,
        x,
        y,
        layout,
        index,
        direction
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> PangoLayoutClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> PangoDirection.FFI.withVal
         ---> I
      )
        renderInsertionCursor_
        (
          context
           & cr
           & x
           & y
           & layout
           & index
           & direction
        )
    fun renderLayout
      (
        context,
        cr,
        x,
        y,
        layout
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> PangoLayoutClass.FFI.withPtr
         ---> I
      )
        renderLayout_
        (
          context
           & cr
           & x
           & y
           & layout
        )
    fun renderLine
      (
        context,
        cr,
        x0,
        y0,
        x1,
        y1
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderLine_
        (
          context
           & cr
           & x0
           & y0
           & x1
           & y1
        )
    fun renderOption
      (
        context,
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        renderOption_
        (
          context
           & cr
           & x
           & y
           & width
           & height
        )
    fun renderSlider
      (
        context,
        cr,
        x,
        y,
        width,
        height,
        orientation
      ) =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GtkOrientation.FFI.withVal
         ---> I
      )
        renderSlider_
        (
          context
           & cr
           & x
           & y
           & width
           & height
           & orientation
        )
    fun rgbToHsv
      (
        r,
        g,
        b
      ) =
      let
        val h
         & s
         & v
         & () =
          (
            GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            rgbToHsv_
            (
              r
               & g
               & b
               & GDouble.null
               & GDouble.null
               & GDouble.null
            )
      in
        (
          h,
          s,
          v
        )
      end
    fun selectionAddTarget
      (
        widget,
        selection,
        target,
        info
      ) =
      (
        GtkWidgetClass.FFI.withPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        selectionAddTarget_
        (
          widget
           & selection
           & target
           & info
        )
    fun selectionAddTargets
      (
        widget,
        selection,
        targets
      ) =
      let
        val ntargets = LargeInt.fromInt (GtkTargetEntryRecordCVectorN.length targets)
        val () =
          (
            GtkWidgetClass.FFI.withPtr
             &&&> GdkAtomRecord.FFI.withPtr
             &&&> GtkTargetEntryRecordCVectorN.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             ---> I
          )
            selectionAddTargets_
            (
              widget
               & selection
               & targets
               & ntargets
            )
      in
        ()
      end
    fun selectionClearTargets (widget, selection) = (GtkWidgetClass.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> I) selectionClearTargets_ (widget & selection)
    fun selectionConvert
      (
        widget,
        selection,
        target,
        time
      ) =
      (
        GtkWidgetClass.FFI.withPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        selectionConvert_
        (
          widget
           & selection
           & target
           & time
        )
    fun selectionOwnerSet
      (
        widget,
        selection,
        time
      ) =
      (
        GtkWidgetClass.FFI.withOptPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        selectionOwnerSet_
        (
          widget
           & selection
           & time
        )
    fun selectionOwnerSetForDisplay
      (
        display,
        widget,
        selection,
        time
      ) =
      (
        GdkDisplayClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        selectionOwnerSetForDisplay_
        (
          display
           & widget
           & selection
           & time
        )
    fun selectionRemoveAll widget = (GtkWidgetClass.FFI.withPtr ---> I) selectionRemoveAll_ widget
    fun setDebugFlags flags = (GUInt32.FFI.withVal ---> I) setDebugFlags_ flags
    fun showUri
      (
        screen,
        uri,
        timestamp
      ) =
      (
        GdkScreenClass.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        showUri_
        (
          screen
           & uri
           & timestamp
           & []
        )
    fun showUriOnWindow
      (
        parent,
        uri,
        timestamp
      ) =
      (
        GtkWindowClass.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        showUriOnWindow_
        (
          parent
           & uri
           & timestamp
           & []
        )
    fun stockAdd items =
      let
        val nItems = LargeInt.fromInt (GtkStockItemRecordCVectorN.length items)
        val () = (GtkStockItemRecordCVectorN.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) stockAdd_ (items & nItems)
      in
        ()
      end
    fun stockAddStatic items =
      let
        val nItems = LargeInt.fromInt (GtkStockItemRecordCVectorN.length items)
        val () = (GtkStockItemRecordCVectorN.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) stockAddStatic_ (items & nItems)
      in
        ()
      end
    fun stockLookup stockId =
      let
        val item & retVal = (Utf8.FFI.withPtr &&&> GtkStockItemRecord.FFI.withNewPtr ---> GtkStockItemRecord.FFI.fromPtr true && GBool.FFI.fromVal) stockLookup_ (stockId & ())
      in
        if retVal then SOME item else NONE
      end
    fun targetTableFree targets =
      let
        val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCVectorN.length targets)
        val () = (GtkTargetEntryRecordCVectorN.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) targetTableFree_ (targets & nTargets)
      in
        ()
      end
    fun targetTableNewFromList list =
      let
        val nTargets & retVal = (GtkTargetListRecord.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GtkTargetEntryRecordCVectorN.FFI.fromPtr 1) targetTableNewFromList_ (list & GInt32.null)
      in
        retVal (LargeInt.toInt nTargets)
      end
    fun targetsIncludeImage (targets, writable) =
      let
        val nTargets = LargeInt.fromInt (GdkAtomRecordCVectorN.length targets)
        val retVal =
          (
            GdkAtomRecordCVectorN.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GBool.FFI.withVal
             ---> GBool.FFI.fromVal
          )
            targetsIncludeImage_
            (
              targets
               & nTargets
               & writable
            )
      in
        retVal
      end
    fun targetsIncludeRichText (targets, buffer) =
      let
        val nTargets = LargeInt.fromInt (GdkAtomRecordCVectorN.length targets)
        val retVal =
          (
            GdkAtomRecordCVectorN.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GtkTextBufferClass.FFI.withPtr
             ---> GBool.FFI.fromVal
          )
            targetsIncludeRichText_
            (
              targets
               & nTargets
               & buffer
            )
      in
        retVal
      end
    fun targetsIncludeText targets =
      let
        val nTargets = LargeInt.fromInt (GdkAtomRecordCVectorN.length targets)
        val retVal = (GdkAtomRecordCVectorN.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) targetsIncludeText_ (targets & nTargets)
      in
        retVal
      end
    fun targetsIncludeUri targets =
      let
        val nTargets = LargeInt.fromInt (GdkAtomRecordCVectorN.length targets)
        val retVal = (GdkAtomRecordCVectorN.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) targetsIncludeUri_ (targets & nTargets)
      in
        retVal
      end
    fun testCreateSimpleWindow (windowTitle, dialogText) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) testCreateSimpleWindow_ (windowTitle & dialogText)
    fun testFindLabel (widget, labelPattern) = (GtkWidgetClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) testFindLabel_ (widget & labelPattern)
    fun testRegisterAllTypes () = (I ---> I) testRegisterAllTypes_ ()
    fun testSliderGetValue widget = (GtkWidgetClass.FFI.withPtr ---> GDouble.FFI.fromVal) testSliderGetValue_ widget
    fun testSliderSetPerc (widget, percentage) = (GtkWidgetClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) testSliderSetPerc_ (widget & percentage)
    fun testSpinButtonClick
      (
        spinner,
        button,
        upwards
      ) =
      (
        GtkSpinButtonClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        testSpinButtonClick_
        (
          spinner
           & button
           & upwards
        )
    fun testTextGet widget = (GtkWidgetClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) testTextGet_ widget
    fun testTextSet (widget, string) = (GtkWidgetClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) testTextSet_ (widget & string)
    fun testWidgetClick
      (
        widget,
        button,
        modifiers
      ) =
      (
        GtkWidgetClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        testWidgetClick_
        (
          widget
           & button
           & modifiers
        )
    fun testWidgetSendKey
      (
        widget,
        keyval,
        modifiers
      ) =
      (
        GtkWidgetClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        testWidgetSendKey_
        (
          widget
           & keyval
           & modifiers
        )
    fun testWidgetWaitForDraw widget = (GtkWidgetClass.FFI.withPtr ---> I) testWidgetWaitForDraw_ widget
    fun treeGetRowDragData selectionData =
      let
        val treeModel
         & path
         & retVal =
          (
            GtkSelectionDataRecord.FFI.withPtr
             &&&> GtkTreeModelClass.FFI.withRefOptPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             ---> GtkTreeModelClass.FFI.fromPtr false
                   && GtkTreePathRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            treeGetRowDragData_
            (
              selectionData
               & NONE
               & NONE
            )
      in
        if retVal then SOME (treeModel, path) else NONE
      end
    fun treeRowReferenceDeleted (proxy, path) = (GObjectObjectClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) treeRowReferenceDeleted_ (proxy & path)
    fun treeRowReferenceInserted (proxy, path) = (GObjectObjectClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) treeRowReferenceInserted_ (proxy & path)
    fun treeSetRowDragData
      (
        selectionData,
        treeModel,
        path
      ) =
      (
        GtkSelectionDataRecord.FFI.withPtr
         &&&> GtkTreeModelClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        treeSetRowDragData_
        (
          selectionData
           & treeModel
           & path
        )
  end
