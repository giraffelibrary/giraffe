structure GtkSettings :>
  GTK_SETTINGS
    where type 'a class_t = 'a GtkSettingsClass.t
    where type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    where type settings_value_record_t = GtkSettingsValueRecord.t
    where type i_m_preedit_style_t = GtkIMPreeditStyle.t
    where type i_m_status_style_t = GtkIMStatusStyle.t
    where type corner_type_t = GtkCornerType.t
    where type icon_size_t = GtkIconSize.t
    where type toolbar_style_t = GtkToolbarStyle.t
    where type policy_type_t = GtkPolicyType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_settings_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libgtk "gtk_settings_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getForScreen_ = call (load_sym libgtk "gtk_settings_get_for_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val installProperty_ = call (load_sym libgtk "gtk_settings_install_property") (GObjectParamSpecClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setDoubleProperty_ =
        call (load_sym libgtk "gtk_settings_set_double_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             &&> Utf8.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val setLongProperty_ =
        call (load_sym libgtk "gtk_settings_set_long_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> FFI.Int64.PolyML.VAL
             &&> Utf8.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val setPropertyValue_ =
        call (load_sym libgtk "gtk_settings_set_property_value")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GtkSettingsValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val setStringProperty_ =
        call (load_sym libgtk "gtk_settings_set_string_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkSettingsClass.t
    type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    type settings_value_record_t = GtkSettingsValueRecord.t
    type i_m_preedit_style_t = GtkIMPreeditStyle.t
    type i_m_status_style_t = GtkIMStatusStyle.t
    type corner_type_t = GtkCornerType.t
    type icon_size_t = GtkIconSize.t
    type toolbar_style_t = GtkToolbarStyle.t
    type policy_type_t = GtkPolicyType.t
    type t = base class_t
    fun asStyleProvider self = (GObjectObjectClass.C.withPtr ---> GtkStyleProviderClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GtkSettingsClass.C.fromPtr false) getDefault_ ()
    fun getForScreen screen = (GObjectObjectClass.C.withPtr ---> GtkSettingsClass.C.fromPtr false) getForScreen_ screen
    fun installProperty pspec = (GObjectParamSpecClass.C.withPtr ---> I) installProperty_ pspec
    fun setDoubleProperty self name vDouble origin =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> Utf8.C.withPtr
         ---> I
      )
        setDoubleProperty_
        (
          self
           & name
           & vDouble
           & origin
        )
    fun setLongProperty self name vLong origin =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> Utf8.C.withPtr
         ---> I
      )
        setLongProperty_
        (
          self
           & name
           & vLong
           & origin
        )
    fun setPropertyValue self name svalue =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkSettingsValueRecord.C.withPtr
         ---> I
      )
        setPropertyValue_
        (
          self
           & name
           & svalue
        )
    fun setStringProperty self name vString origin =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        setStringProperty_
        (
          self
           & name
           & vString
           & origin
        )
    local
      open Property
    in
      val gtkAlternativeButtonOrderProp =
        {
          get = fn x => get "gtk-alternative-button-order" boolean x,
          set = fn x => set "gtk-alternative-button-order" boolean x
        }
      val gtkAlternativeSortArrowsProp =
        {
          get = fn x => get "gtk-alternative-sort-arrows" boolean x,
          set = fn x => set "gtk-alternative-sort-arrows" boolean x
        }
      val gtkApplicationPreferDarkThemeProp =
        {
          get = fn x => get "gtk-application-prefer-dark-theme" boolean x,
          set = fn x => set "gtk-application-prefer-dark-theme" boolean x
        }
      val gtkAutoMnemonicsProp =
        {
          get = fn x => get "gtk-auto-mnemonics" boolean x,
          set = fn x => set "gtk-auto-mnemonics" boolean x
        }
      val gtkButtonImagesProp =
        {
          get = fn x => get "gtk-button-images" boolean x,
          set = fn x => set "gtk-button-images" boolean x
        }
      val gtkCanChangeAccelsProp =
        {
          get = fn x => get "gtk-can-change-accels" boolean x,
          set = fn x => set "gtk-can-change-accels" boolean x
        }
      val gtkColorPaletteProp =
        {
          get = fn x => get "gtk-color-palette" stringOpt x,
          set = fn x => set "gtk-color-palette" stringOpt x
        }
      val gtkColorSchemeProp =
        {
          get = fn x => get "gtk-color-scheme" stringOpt x,
          set = fn x => set "gtk-color-scheme" stringOpt x
        }
      val gtkCursorBlinkProp =
        {
          get = fn x => get "gtk-cursor-blink" boolean x,
          set = fn x => set "gtk-cursor-blink" boolean x
        }
      val gtkCursorBlinkTimeProp =
        {
          get = fn x => get "gtk-cursor-blink-time" int x,
          set = fn x => set "gtk-cursor-blink-time" int x
        }
      val gtkCursorBlinkTimeoutProp =
        {
          get = fn x => get "gtk-cursor-blink-timeout" int x,
          set = fn x => set "gtk-cursor-blink-timeout" int x
        }
      val gtkCursorThemeNameProp =
        {
          get = fn x => get "gtk-cursor-theme-name" stringOpt x,
          set = fn x => set "gtk-cursor-theme-name" stringOpt x
        }
      val gtkCursorThemeSizeProp =
        {
          get = fn x => get "gtk-cursor-theme-size" int x,
          set = fn x => set "gtk-cursor-theme-size" int x
        }
      val gtkDndDragThresholdProp =
        {
          get = fn x => get "gtk-dnd-drag-threshold" int x,
          set = fn x => set "gtk-dnd-drag-threshold" int x
        }
      val gtkDoubleClickDistanceProp =
        {
          get = fn x => get "gtk-double-click-distance" int x,
          set = fn x => set "gtk-double-click-distance" int x
        }
      val gtkDoubleClickTimeProp =
        {
          get = fn x => get "gtk-double-click-time" int x,
          set = fn x => set "gtk-double-click-time" int x
        }
      val gtkEnableAccelsProp =
        {
          get = fn x => get "gtk-enable-accels" boolean x,
          set = fn x => set "gtk-enable-accels" boolean x
        }
      val gtkEnableAnimationsProp =
        {
          get = fn x => get "gtk-enable-animations" boolean x,
          set = fn x => set "gtk-enable-animations" boolean x
        }
      val gtkEnableEventSoundsProp =
        {
          get = fn x => get "gtk-enable-event-sounds" boolean x,
          set = fn x => set "gtk-enable-event-sounds" boolean x
        }
      val gtkEnableInputFeedbackSoundsProp =
        {
          get = fn x => get "gtk-enable-input-feedback-sounds" boolean x,
          set = fn x => set "gtk-enable-input-feedback-sounds" boolean x
        }
      val gtkEnableMnemonicsProp =
        {
          get = fn x => get "gtk-enable-mnemonics" boolean x,
          set = fn x => set "gtk-enable-mnemonics" boolean x
        }
      val gtkEnableTooltipsProp =
        {
          get = fn x => get "gtk-enable-tooltips" boolean x,
          set = fn x => set "gtk-enable-tooltips" boolean x
        }
      val gtkEntryPasswordHintTimeoutProp =
        {
          get = fn x => get "gtk-entry-password-hint-timeout" uint x,
          set = fn x => set "gtk-entry-password-hint-timeout" uint x
        }
      val gtkEntrySelectOnFocusProp =
        {
          get = fn x => get "gtk-entry-select-on-focus" boolean x,
          set = fn x => set "gtk-entry-select-on-focus" boolean x
        }
      val gtkErrorBellProp =
        {
          get = fn x => get "gtk-error-bell" boolean x,
          set = fn x => set "gtk-error-bell" boolean x
        }
      val gtkFallbackIconThemeProp =
        {
          get = fn x => get "gtk-fallback-icon-theme" stringOpt x,
          set = fn x => set "gtk-fallback-icon-theme" stringOpt x
        }
      val gtkFileChooserBackendProp =
        {
          get = fn x => get "gtk-file-chooser-backend" stringOpt x,
          set = fn x => set "gtk-file-chooser-backend" stringOpt x
        }
      val gtkFontNameProp =
        {
          get = fn x => get "gtk-font-name" stringOpt x,
          set = fn x => set "gtk-font-name" stringOpt x
        }
      val gtkFontconfigTimestampProp =
        {
          get = fn x => get "gtk-fontconfig-timestamp" uint x,
          set = fn x => set "gtk-fontconfig-timestamp" uint x
        }
      val gtkIconSizesProp =
        {
          get = fn x => get "gtk-icon-sizes" stringOpt x,
          set = fn x => set "gtk-icon-sizes" stringOpt x
        }
      val gtkIconThemeNameProp =
        {
          get = fn x => get "gtk-icon-theme-name" stringOpt x,
          set = fn x => set "gtk-icon-theme-name" stringOpt x
        }
      val gtkImModuleProp =
        {
          get = fn x => get "gtk-im-module" stringOpt x,
          set = fn x => set "gtk-im-module" stringOpt x
        }
      val gtkImPreeditStyleProp =
        {
          get = fn x => get "gtk-im-preedit-style" GtkIMPreeditStyle.t x,
          set = fn x => set "gtk-im-preedit-style" GtkIMPreeditStyle.t x
        }
      val gtkImStatusStyleProp =
        {
          get = fn x => get "gtk-im-status-style" GtkIMStatusStyle.t x,
          set = fn x => set "gtk-im-status-style" GtkIMStatusStyle.t x
        }
      val gtkKeyThemeNameProp =
        {
          get = fn x => get "gtk-key-theme-name" stringOpt x,
          set = fn x => set "gtk-key-theme-name" stringOpt x
        }
      val gtkKeynavCursorOnlyProp =
        {
          get = fn x => get "gtk-keynav-cursor-only" boolean x,
          set = fn x => set "gtk-keynav-cursor-only" boolean x
        }
      val gtkKeynavWrapAroundProp =
        {
          get = fn x => get "gtk-keynav-wrap-around" boolean x,
          set = fn x => set "gtk-keynav-wrap-around" boolean x
        }
      val gtkLabelSelectOnFocusProp =
        {
          get = fn x => get "gtk-label-select-on-focus" boolean x,
          set = fn x => set "gtk-label-select-on-focus" boolean x
        }
      val gtkMenuBarAccelProp =
        {
          get = fn x => get "gtk-menu-bar-accel" stringOpt x,
          set = fn x => set "gtk-menu-bar-accel" stringOpt x
        }
      val gtkMenuBarPopupDelayProp =
        {
          get = fn x => get "gtk-menu-bar-popup-delay" int x,
          set = fn x => set "gtk-menu-bar-popup-delay" int x
        }
      val gtkMenuImagesProp =
        {
          get = fn x => get "gtk-menu-images" boolean x,
          set = fn x => set "gtk-menu-images" boolean x
        }
      val gtkMenuPopdownDelayProp =
        {
          get = fn x => get "gtk-menu-popdown-delay" int x,
          set = fn x => set "gtk-menu-popdown-delay" int x
        }
      val gtkMenuPopupDelayProp =
        {
          get = fn x => get "gtk-menu-popup-delay" int x,
          set = fn x => set "gtk-menu-popup-delay" int x
        }
      val gtkModulesProp =
        {
          get = fn x => get "gtk-modules" stringOpt x,
          set = fn x => set "gtk-modules" stringOpt x
        }
      val gtkPrintBackendsProp =
        {
          get = fn x => get "gtk-print-backends" stringOpt x,
          set = fn x => set "gtk-print-backends" stringOpt x
        }
      val gtkPrintPreviewCommandProp =
        {
          get = fn x => get "gtk-print-preview-command" stringOpt x,
          set = fn x => set "gtk-print-preview-command" stringOpt x
        }
      val gtkRecentFilesLimitProp =
        {
          get = fn x => get "gtk-recent-files-limit" int x,
          set = fn x => set "gtk-recent-files-limit" int x
        }
      val gtkRecentFilesMaxAgeProp =
        {
          get = fn x => get "gtk-recent-files-max-age" int x,
          set = fn x => set "gtk-recent-files-max-age" int x
        }
      val gtkScrolledWindowPlacementProp =
        {
          get = fn x => get "gtk-scrolled-window-placement" GtkCornerType.t x,
          set = fn x => set "gtk-scrolled-window-placement" GtkCornerType.t x
        }
      val gtkShowInputMethodMenuProp =
        {
          get = fn x => get "gtk-show-input-method-menu" boolean x,
          set = fn x => set "gtk-show-input-method-menu" boolean x
        }
      val gtkShowUnicodeMenuProp =
        {
          get = fn x => get "gtk-show-unicode-menu" boolean x,
          set = fn x => set "gtk-show-unicode-menu" boolean x
        }
      val gtkSoundThemeNameProp =
        {
          get = fn x => get "gtk-sound-theme-name" stringOpt x,
          set = fn x => set "gtk-sound-theme-name" stringOpt x
        }
      val gtkSplitCursorProp =
        {
          get = fn x => get "gtk-split-cursor" boolean x,
          set = fn x => set "gtk-split-cursor" boolean x
        }
      val gtkThemeNameProp =
        {
          get = fn x => get "gtk-theme-name" stringOpt x,
          set = fn x => set "gtk-theme-name" stringOpt x
        }
      val gtkTimeoutExpandProp =
        {
          get = fn x => get "gtk-timeout-expand" int x,
          set = fn x => set "gtk-timeout-expand" int x
        }
      val gtkTimeoutInitialProp =
        {
          get = fn x => get "gtk-timeout-initial" int x,
          set = fn x => set "gtk-timeout-initial" int x
        }
      val gtkTimeoutRepeatProp =
        {
          get = fn x => get "gtk-timeout-repeat" int x,
          set = fn x => set "gtk-timeout-repeat" int x
        }
      val gtkToolbarIconSizeProp =
        {
          get = fn x => get "gtk-toolbar-icon-size" GtkIconSize.t x,
          set = fn x => set "gtk-toolbar-icon-size" GtkIconSize.t x
        }
      val gtkToolbarStyleProp =
        {
          get = fn x => get "gtk-toolbar-style" GtkToolbarStyle.t x,
          set = fn x => set "gtk-toolbar-style" GtkToolbarStyle.t x
        }
      val gtkTooltipBrowseModeTimeoutProp =
        {
          get = fn x => get "gtk-tooltip-browse-mode-timeout" int x,
          set = fn x => set "gtk-tooltip-browse-mode-timeout" int x
        }
      val gtkTooltipBrowseTimeoutProp =
        {
          get = fn x => get "gtk-tooltip-browse-timeout" int x,
          set = fn x => set "gtk-tooltip-browse-timeout" int x
        }
      val gtkTooltipTimeoutProp =
        {
          get = fn x => get "gtk-tooltip-timeout" int x,
          set = fn x => set "gtk-tooltip-timeout" int x
        }
      val gtkTouchscreenModeProp =
        {
          get = fn x => get "gtk-touchscreen-mode" boolean x,
          set = fn x => set "gtk-touchscreen-mode" boolean x
        }
      val gtkVisibleFocusProp =
        {
          get = fn x => get "gtk-visible-focus" GtkPolicyType.t x,
          set = fn x => set "gtk-visible-focus" GtkPolicyType.t x
        }
      val gtkXftAntialiasProp =
        {
          get = fn x => get "gtk-xft-antialias" int x,
          set = fn x => set "gtk-xft-antialias" int x
        }
      val gtkXftDpiProp =
        {
          get = fn x => get "gtk-xft-dpi" int x,
          set = fn x => set "gtk-xft-dpi" int x
        }
      val gtkXftHintingProp =
        {
          get = fn x => get "gtk-xft-hinting" int x,
          set = fn x => set "gtk-xft-hinting" int x
        }
      val gtkXftHintstyleProp =
        {
          get = fn x => get "gtk-xft-hintstyle" stringOpt x,
          set = fn x => set "gtk-xft-hintstyle" stringOpt x
        }
      val gtkXftRgbaProp =
        {
          get = fn x => get "gtk-xft-rgba" stringOpt x,
          set = fn x => set "gtk-xft-rgba" stringOpt x
        }
    end
  end
