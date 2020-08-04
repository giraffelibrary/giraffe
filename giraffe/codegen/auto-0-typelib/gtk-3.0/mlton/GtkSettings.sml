structure GtkSettings :>
  GTK_SETTINGS
    where type 'a class = 'a GtkSettingsClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class
    where type settings_value_t = GtkSettingsValueRecord.t
    where type i_m_preedit_style_t = GtkIMPreeditStyle.t
    where type i_m_status_style_t = GtkIMStatusStyle.t
    where type corner_type_t = GtkCornerType.t
    where type icon_size_t = GtkIconSize.t
    where type toolbar_style_t = GtkToolbarStyle.t
    where type policy_type_t = GtkPolicyType.t =
  struct
    val getType_ = _import "gtk_settings_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "gtk_settings_get_default" : unit -> GtkSettingsClass.FFI.opt GtkSettingsClass.FFI.p;
    val getForScreen_ = _import "gtk_settings_get_for_screen" : GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p -> GtkSettingsClass.FFI.non_opt GtkSettingsClass.FFI.p;
    val installProperty_ = _import "gtk_settings_install_property" : GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p -> unit;
    val resetProperty_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_settings_reset_property" :
              GtkSettingsClass.FFI.non_opt GtkSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDoubleProperty_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6) =>
          (
            _import "mlton_gtk_settings_set_double_property" :
              GtkSettingsClass.FFI.non_opt GtkSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GDouble.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val setLongProperty_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6) =>
          (
            _import "mlton_gtk_settings_set_long_property" :
              GtkSettingsClass.FFI.non_opt GtkSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt64.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val setPropertyValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_settings_set_property_value" :
              GtkSettingsClass.FFI.non_opt GtkSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkSettingsValueRecord.FFI.non_opt GtkSettingsValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setStringProperty_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7) =>
          (
            _import "mlton_gtk_settings_set_string_property" :
              GtkSettingsClass.FFI.non_opt GtkSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    type 'a class = 'a GtkSettingsClass.class
    type 'a style_provider_class = 'a GtkStyleProviderClass.class
    type settings_value_t = GtkSettingsValueRecord.t
    type i_m_preedit_style_t = GtkIMPreeditStyle.t
    type i_m_status_style_t = GtkIMStatusStyle.t
    type corner_type_t = GtkCornerType.t
    type icon_size_t = GtkIconSize.t
    type toolbar_style_t = GtkToolbarStyle.t
    type policy_type_t = GtkPolicyType.t
    type t = base class
    fun asStyleProvider self = (GObjectObjectClass.FFI.withPtr false ---> GtkStyleProviderClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GtkSettingsClass.FFI.fromOptPtr false) getDefault_ ()
    fun getForScreen screen = (GdkScreenClass.FFI.withPtr false ---> GtkSettingsClass.FFI.fromPtr false) getForScreen_ screen
    fun installProperty pspec = (GObjectParamSpecClass.FFI.withPtr false ---> I) installProperty_ pspec
    fun resetProperty self name = (GtkSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) resetProperty_ (self & name)
    fun setDoubleProperty
      self
      (
        name,
        vDouble,
        origin
      ) =
      (
        GtkSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setDoubleProperty_
        (
          self
           & name
           & vDouble
           & origin
        )
    fun setLongProperty
      self
      (
        name,
        vLong,
        origin
      ) =
      (
        GtkSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setLongProperty_
        (
          self
           & name
           & vLong
           & origin
        )
    fun setPropertyValue self (name, svalue) =
      (
        GtkSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkSettingsValueRecord.FFI.withPtr false
         ---> I
      )
        setPropertyValue_
        (
          self
           & name
           & svalue
        )
    fun setStringProperty
      self
      (
        name,
        vString,
        origin
      ) =
      (
        GtkSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
          set = fn x => set "gtk-alternative-button-order" boolean x,
          new = fn x => new "gtk-alternative-button-order" boolean x
        }
      val gtkAlternativeSortArrowsProp =
        {
          get = fn x => get "gtk-alternative-sort-arrows" boolean x,
          set = fn x => set "gtk-alternative-sort-arrows" boolean x,
          new = fn x => new "gtk-alternative-sort-arrows" boolean x
        }
      val gtkApplicationPreferDarkThemeProp =
        {
          get = fn x => get "gtk-application-prefer-dark-theme" boolean x,
          set = fn x => set "gtk-application-prefer-dark-theme" boolean x,
          new = fn x => new "gtk-application-prefer-dark-theme" boolean x
        }
      val gtkAutoMnemonicsProp =
        {
          get = fn x => get "gtk-auto-mnemonics" boolean x,
          set = fn x => set "gtk-auto-mnemonics" boolean x,
          new = fn x => new "gtk-auto-mnemonics" boolean x
        }
      val gtkButtonImagesProp =
        {
          get = fn x => get "gtk-button-images" boolean x,
          set = fn x => set "gtk-button-images" boolean x,
          new = fn x => new "gtk-button-images" boolean x
        }
      val gtkCanChangeAccelsProp =
        {
          get = fn x => get "gtk-can-change-accels" boolean x,
          set = fn x => set "gtk-can-change-accels" boolean x,
          new = fn x => new "gtk-can-change-accels" boolean x
        }
      val gtkColorPaletteProp =
        {
          get = fn x => get "gtk-color-palette" stringOpt x,
          set = fn x => set "gtk-color-palette" stringOpt x,
          new = fn x => new "gtk-color-palette" stringOpt x
        }
      val gtkColorSchemeProp =
        {
          get = fn x => get "gtk-color-scheme" stringOpt x,
          set = fn x => set "gtk-color-scheme" stringOpt x,
          new = fn x => new "gtk-color-scheme" stringOpt x
        }
      val gtkCursorBlinkProp =
        {
          get = fn x => get "gtk-cursor-blink" boolean x,
          set = fn x => set "gtk-cursor-blink" boolean x,
          new = fn x => new "gtk-cursor-blink" boolean x
        }
      val gtkCursorBlinkTimeProp =
        {
          get = fn x => get "gtk-cursor-blink-time" int x,
          set = fn x => set "gtk-cursor-blink-time" int x,
          new = fn x => new "gtk-cursor-blink-time" int x
        }
      val gtkCursorBlinkTimeoutProp =
        {
          get = fn x => get "gtk-cursor-blink-timeout" int x,
          set = fn x => set "gtk-cursor-blink-timeout" int x,
          new = fn x => new "gtk-cursor-blink-timeout" int x
        }
      val gtkCursorThemeNameProp =
        {
          get = fn x => get "gtk-cursor-theme-name" stringOpt x,
          set = fn x => set "gtk-cursor-theme-name" stringOpt x,
          new = fn x => new "gtk-cursor-theme-name" stringOpt x
        }
      val gtkCursorThemeSizeProp =
        {
          get = fn x => get "gtk-cursor-theme-size" int x,
          set = fn x => set "gtk-cursor-theme-size" int x,
          new = fn x => new "gtk-cursor-theme-size" int x
        }
      val gtkDecorationLayoutProp =
        {
          get = fn x => get "gtk-decoration-layout" stringOpt x,
          set = fn x => set "gtk-decoration-layout" stringOpt x,
          new = fn x => new "gtk-decoration-layout" stringOpt x
        }
      val gtkDialogsUseHeaderProp =
        {
          get = fn x => get "gtk-dialogs-use-header" boolean x,
          set = fn x => set "gtk-dialogs-use-header" boolean x,
          new = fn x => new "gtk-dialogs-use-header" boolean x
        }
      val gtkDndDragThresholdProp =
        {
          get = fn x => get "gtk-dnd-drag-threshold" int x,
          set = fn x => set "gtk-dnd-drag-threshold" int x,
          new = fn x => new "gtk-dnd-drag-threshold" int x
        }
      val gtkDoubleClickDistanceProp =
        {
          get = fn x => get "gtk-double-click-distance" int x,
          set = fn x => set "gtk-double-click-distance" int x,
          new = fn x => new "gtk-double-click-distance" int x
        }
      val gtkDoubleClickTimeProp =
        {
          get = fn x => get "gtk-double-click-time" int x,
          set = fn x => set "gtk-double-click-time" int x,
          new = fn x => new "gtk-double-click-time" int x
        }
      val gtkEnableAccelsProp =
        {
          get = fn x => get "gtk-enable-accels" boolean x,
          set = fn x => set "gtk-enable-accels" boolean x,
          new = fn x => new "gtk-enable-accels" boolean x
        }
      val gtkEnableAnimationsProp =
        {
          get = fn x => get "gtk-enable-animations" boolean x,
          set = fn x => set "gtk-enable-animations" boolean x,
          new = fn x => new "gtk-enable-animations" boolean x
        }
      val gtkEnableEventSoundsProp =
        {
          get = fn x => get "gtk-enable-event-sounds" boolean x,
          set = fn x => set "gtk-enable-event-sounds" boolean x,
          new = fn x => new "gtk-enable-event-sounds" boolean x
        }
      val gtkEnableInputFeedbackSoundsProp =
        {
          get = fn x => get "gtk-enable-input-feedback-sounds" boolean x,
          set = fn x => set "gtk-enable-input-feedback-sounds" boolean x,
          new = fn x => new "gtk-enable-input-feedback-sounds" boolean x
        }
      val gtkEnableMnemonicsProp =
        {
          get = fn x => get "gtk-enable-mnemonics" boolean x,
          set = fn x => set "gtk-enable-mnemonics" boolean x,
          new = fn x => new "gtk-enable-mnemonics" boolean x
        }
      val gtkEnablePrimaryPasteProp =
        {
          get = fn x => get "gtk-enable-primary-paste" boolean x,
          set = fn x => set "gtk-enable-primary-paste" boolean x,
          new = fn x => new "gtk-enable-primary-paste" boolean x
        }
      val gtkEnableTooltipsProp =
        {
          get = fn x => get "gtk-enable-tooltips" boolean x,
          set = fn x => set "gtk-enable-tooltips" boolean x,
          new = fn x => new "gtk-enable-tooltips" boolean x
        }
      val gtkEntryPasswordHintTimeoutProp =
        {
          get = fn x => get "gtk-entry-password-hint-timeout" uint x,
          set = fn x => set "gtk-entry-password-hint-timeout" uint x,
          new = fn x => new "gtk-entry-password-hint-timeout" uint x
        }
      val gtkEntrySelectOnFocusProp =
        {
          get = fn x => get "gtk-entry-select-on-focus" boolean x,
          set = fn x => set "gtk-entry-select-on-focus" boolean x,
          new = fn x => new "gtk-entry-select-on-focus" boolean x
        }
      val gtkErrorBellProp =
        {
          get = fn x => get "gtk-error-bell" boolean x,
          set = fn x => set "gtk-error-bell" boolean x,
          new = fn x => new "gtk-error-bell" boolean x
        }
      val gtkFallbackIconThemeProp =
        {
          get = fn x => get "gtk-fallback-icon-theme" stringOpt x,
          set = fn x => set "gtk-fallback-icon-theme" stringOpt x,
          new = fn x => new "gtk-fallback-icon-theme" stringOpt x
        }
      val gtkFileChooserBackendProp =
        {
          get = fn x => get "gtk-file-chooser-backend" stringOpt x,
          set = fn x => set "gtk-file-chooser-backend" stringOpt x,
          new = fn x => new "gtk-file-chooser-backend" stringOpt x
        }
      val gtkFontNameProp =
        {
          get = fn x => get "gtk-font-name" stringOpt x,
          set = fn x => set "gtk-font-name" stringOpt x,
          new = fn x => new "gtk-font-name" stringOpt x
        }
      val gtkFontconfigTimestampProp =
        {
          get = fn x => get "gtk-fontconfig-timestamp" uint x,
          set = fn x => set "gtk-fontconfig-timestamp" uint x,
          new = fn x => new "gtk-fontconfig-timestamp" uint x
        }
      val gtkIconSizesProp =
        {
          get = fn x => get "gtk-icon-sizes" stringOpt x,
          set = fn x => set "gtk-icon-sizes" stringOpt x,
          new = fn x => new "gtk-icon-sizes" stringOpt x
        }
      val gtkIconThemeNameProp =
        {
          get = fn x => get "gtk-icon-theme-name" stringOpt x,
          set = fn x => set "gtk-icon-theme-name" stringOpt x,
          new = fn x => new "gtk-icon-theme-name" stringOpt x
        }
      val gtkImModuleProp =
        {
          get = fn x => get "gtk-im-module" stringOpt x,
          set = fn x => set "gtk-im-module" stringOpt x,
          new = fn x => new "gtk-im-module" stringOpt x
        }
      val gtkImPreeditStyleProp =
        {
          get = fn x => get "gtk-im-preedit-style" GtkIMPreeditStyle.t x,
          set = fn x => set "gtk-im-preedit-style" GtkIMPreeditStyle.t x,
          new = fn x => new "gtk-im-preedit-style" GtkIMPreeditStyle.t x
        }
      val gtkImStatusStyleProp =
        {
          get = fn x => get "gtk-im-status-style" GtkIMStatusStyle.t x,
          set = fn x => set "gtk-im-status-style" GtkIMStatusStyle.t x,
          new = fn x => new "gtk-im-status-style" GtkIMStatusStyle.t x
        }
      val gtkKeyThemeNameProp =
        {
          get = fn x => get "gtk-key-theme-name" stringOpt x,
          set = fn x => set "gtk-key-theme-name" stringOpt x,
          new = fn x => new "gtk-key-theme-name" stringOpt x
        }
      val gtkKeynavCursorOnlyProp =
        {
          get = fn x => get "gtk-keynav-cursor-only" boolean x,
          set = fn x => set "gtk-keynav-cursor-only" boolean x,
          new = fn x => new "gtk-keynav-cursor-only" boolean x
        }
      val gtkKeynavUseCaretProp =
        {
          get = fn x => get "gtk-keynav-use-caret" boolean x,
          set = fn x => set "gtk-keynav-use-caret" boolean x,
          new = fn x => new "gtk-keynav-use-caret" boolean x
        }
      val gtkKeynavWrapAroundProp =
        {
          get = fn x => get "gtk-keynav-wrap-around" boolean x,
          set = fn x => set "gtk-keynav-wrap-around" boolean x,
          new = fn x => new "gtk-keynav-wrap-around" boolean x
        }
      val gtkLabelSelectOnFocusProp =
        {
          get = fn x => get "gtk-label-select-on-focus" boolean x,
          set = fn x => set "gtk-label-select-on-focus" boolean x,
          new = fn x => new "gtk-label-select-on-focus" boolean x
        }
      val gtkLongPressTimeProp =
        {
          get = fn x => get "gtk-long-press-time" uint x,
          set = fn x => set "gtk-long-press-time" uint x,
          new = fn x => new "gtk-long-press-time" uint x
        }
      val gtkMenuBarAccelProp =
        {
          get = fn x => get "gtk-menu-bar-accel" stringOpt x,
          set = fn x => set "gtk-menu-bar-accel" stringOpt x,
          new = fn x => new "gtk-menu-bar-accel" stringOpt x
        }
      val gtkMenuBarPopupDelayProp =
        {
          get = fn x => get "gtk-menu-bar-popup-delay" int x,
          set = fn x => set "gtk-menu-bar-popup-delay" int x,
          new = fn x => new "gtk-menu-bar-popup-delay" int x
        }
      val gtkMenuImagesProp =
        {
          get = fn x => get "gtk-menu-images" boolean x,
          set = fn x => set "gtk-menu-images" boolean x,
          new = fn x => new "gtk-menu-images" boolean x
        }
      val gtkMenuPopdownDelayProp =
        {
          get = fn x => get "gtk-menu-popdown-delay" int x,
          set = fn x => set "gtk-menu-popdown-delay" int x,
          new = fn x => new "gtk-menu-popdown-delay" int x
        }
      val gtkMenuPopupDelayProp =
        {
          get = fn x => get "gtk-menu-popup-delay" int x,
          set = fn x => set "gtk-menu-popup-delay" int x,
          new = fn x => new "gtk-menu-popup-delay" int x
        }
      val gtkModulesProp =
        {
          get = fn x => get "gtk-modules" stringOpt x,
          set = fn x => set "gtk-modules" stringOpt x,
          new = fn x => new "gtk-modules" stringOpt x
        }
      val gtkPrimaryButtonWarpsSliderProp =
        {
          get = fn x => get "gtk-primary-button-warps-slider" boolean x,
          set = fn x => set "gtk-primary-button-warps-slider" boolean x,
          new = fn x => new "gtk-primary-button-warps-slider" boolean x
        }
      val gtkPrintBackendsProp =
        {
          get = fn x => get "gtk-print-backends" stringOpt x,
          set = fn x => set "gtk-print-backends" stringOpt x,
          new = fn x => new "gtk-print-backends" stringOpt x
        }
      val gtkPrintPreviewCommandProp =
        {
          get = fn x => get "gtk-print-preview-command" stringOpt x,
          set = fn x => set "gtk-print-preview-command" stringOpt x,
          new = fn x => new "gtk-print-preview-command" stringOpt x
        }
      val gtkRecentFilesEnabledProp =
        {
          get = fn x => get "gtk-recent-files-enabled" boolean x,
          set = fn x => set "gtk-recent-files-enabled" boolean x,
          new = fn x => new "gtk-recent-files-enabled" boolean x
        }
      val gtkRecentFilesLimitProp =
        {
          get = fn x => get "gtk-recent-files-limit" int x,
          set = fn x => set "gtk-recent-files-limit" int x,
          new = fn x => new "gtk-recent-files-limit" int x
        }
      val gtkRecentFilesMaxAgeProp =
        {
          get = fn x => get "gtk-recent-files-max-age" int x,
          set = fn x => set "gtk-recent-files-max-age" int x,
          new = fn x => new "gtk-recent-files-max-age" int x
        }
      val gtkScrolledWindowPlacementProp =
        {
          get = fn x => get "gtk-scrolled-window-placement" GtkCornerType.t x,
          set = fn x => set "gtk-scrolled-window-placement" GtkCornerType.t x,
          new = fn x => new "gtk-scrolled-window-placement" GtkCornerType.t x
        }
      val gtkShellShowsAppMenuProp =
        {
          get = fn x => get "gtk-shell-shows-app-menu" boolean x,
          set = fn x => set "gtk-shell-shows-app-menu" boolean x,
          new = fn x => new "gtk-shell-shows-app-menu" boolean x
        }
      val gtkShellShowsDesktopProp =
        {
          get = fn x => get "gtk-shell-shows-desktop" boolean x,
          set = fn x => set "gtk-shell-shows-desktop" boolean x,
          new = fn x => new "gtk-shell-shows-desktop" boolean x
        }
      val gtkShellShowsMenubarProp =
        {
          get = fn x => get "gtk-shell-shows-menubar" boolean x,
          set = fn x => set "gtk-shell-shows-menubar" boolean x,
          new = fn x => new "gtk-shell-shows-menubar" boolean x
        }
      val gtkShowInputMethodMenuProp =
        {
          get = fn x => get "gtk-show-input-method-menu" boolean x,
          set = fn x => set "gtk-show-input-method-menu" boolean x,
          new = fn x => new "gtk-show-input-method-menu" boolean x
        }
      val gtkShowUnicodeMenuProp =
        {
          get = fn x => get "gtk-show-unicode-menu" boolean x,
          set = fn x => set "gtk-show-unicode-menu" boolean x,
          new = fn x => new "gtk-show-unicode-menu" boolean x
        }
      val gtkSoundThemeNameProp =
        {
          get = fn x => get "gtk-sound-theme-name" stringOpt x,
          set = fn x => set "gtk-sound-theme-name" stringOpt x,
          new = fn x => new "gtk-sound-theme-name" stringOpt x
        }
      val gtkSplitCursorProp =
        {
          get = fn x => get "gtk-split-cursor" boolean x,
          set = fn x => set "gtk-split-cursor" boolean x,
          new = fn x => new "gtk-split-cursor" boolean x
        }
      val gtkThemeNameProp =
        {
          get = fn x => get "gtk-theme-name" stringOpt x,
          set = fn x => set "gtk-theme-name" stringOpt x,
          new = fn x => new "gtk-theme-name" stringOpt x
        }
      val gtkTimeoutExpandProp =
        {
          get = fn x => get "gtk-timeout-expand" int x,
          set = fn x => set "gtk-timeout-expand" int x,
          new = fn x => new "gtk-timeout-expand" int x
        }
      val gtkTimeoutInitialProp =
        {
          get = fn x => get "gtk-timeout-initial" int x,
          set = fn x => set "gtk-timeout-initial" int x,
          new = fn x => new "gtk-timeout-initial" int x
        }
      val gtkTimeoutRepeatProp =
        {
          get = fn x => get "gtk-timeout-repeat" int x,
          set = fn x => set "gtk-timeout-repeat" int x,
          new = fn x => new "gtk-timeout-repeat" int x
        }
      val gtkTitlebarDoubleClickProp =
        {
          get = fn x => get "gtk-titlebar-double-click" stringOpt x,
          set = fn x => set "gtk-titlebar-double-click" stringOpt x,
          new = fn x => new "gtk-titlebar-double-click" stringOpt x
        }
      val gtkTitlebarMiddleClickProp =
        {
          get = fn x => get "gtk-titlebar-middle-click" stringOpt x,
          set = fn x => set "gtk-titlebar-middle-click" stringOpt x,
          new = fn x => new "gtk-titlebar-middle-click" stringOpt x
        }
      val gtkTitlebarRightClickProp =
        {
          get = fn x => get "gtk-titlebar-right-click" stringOpt x,
          set = fn x => set "gtk-titlebar-right-click" stringOpt x,
          new = fn x => new "gtk-titlebar-right-click" stringOpt x
        }
      val gtkToolbarIconSizeProp =
        {
          get = fn x => get "gtk-toolbar-icon-size" GtkIconSize.t x,
          set = fn x => set "gtk-toolbar-icon-size" GtkIconSize.t x,
          new = fn x => new "gtk-toolbar-icon-size" GtkIconSize.t x
        }
      val gtkToolbarStyleProp =
        {
          get = fn x => get "gtk-toolbar-style" GtkToolbarStyle.t x,
          set = fn x => set "gtk-toolbar-style" GtkToolbarStyle.t x,
          new = fn x => new "gtk-toolbar-style" GtkToolbarStyle.t x
        }
      val gtkTooltipBrowseModeTimeoutProp =
        {
          get = fn x => get "gtk-tooltip-browse-mode-timeout" int x,
          set = fn x => set "gtk-tooltip-browse-mode-timeout" int x,
          new = fn x => new "gtk-tooltip-browse-mode-timeout" int x
        }
      val gtkTooltipBrowseTimeoutProp =
        {
          get = fn x => get "gtk-tooltip-browse-timeout" int x,
          set = fn x => set "gtk-tooltip-browse-timeout" int x,
          new = fn x => new "gtk-tooltip-browse-timeout" int x
        }
      val gtkTooltipTimeoutProp =
        {
          get = fn x => get "gtk-tooltip-timeout" int x,
          set = fn x => set "gtk-tooltip-timeout" int x,
          new = fn x => new "gtk-tooltip-timeout" int x
        }
      val gtkTouchscreenModeProp =
        {
          get = fn x => get "gtk-touchscreen-mode" boolean x,
          set = fn x => set "gtk-touchscreen-mode" boolean x,
          new = fn x => new "gtk-touchscreen-mode" boolean x
        }
      val gtkVisibleFocusProp =
        {
          get = fn x => get "gtk-visible-focus" GtkPolicyType.t x,
          set = fn x => set "gtk-visible-focus" GtkPolicyType.t x,
          new = fn x => new "gtk-visible-focus" GtkPolicyType.t x
        }
      val gtkXftAntialiasProp =
        {
          get = fn x => get "gtk-xft-antialias" int x,
          set = fn x => set "gtk-xft-antialias" int x,
          new = fn x => new "gtk-xft-antialias" int x
        }
      val gtkXftDpiProp =
        {
          get = fn x => get "gtk-xft-dpi" int x,
          set = fn x => set "gtk-xft-dpi" int x,
          new = fn x => new "gtk-xft-dpi" int x
        }
      val gtkXftHintingProp =
        {
          get = fn x => get "gtk-xft-hinting" int x,
          set = fn x => set "gtk-xft-hinting" int x,
          new = fn x => new "gtk-xft-hinting" int x
        }
      val gtkXftHintstyleProp =
        {
          get = fn x => get "gtk-xft-hintstyle" stringOpt x,
          set = fn x => set "gtk-xft-hintstyle" stringOpt x,
          new = fn x => new "gtk-xft-hintstyle" stringOpt x
        }
      val gtkXftRgbaProp =
        {
          get = fn x => get "gtk-xft-rgba" stringOpt x,
          set = fn x => set "gtk-xft-rgba" stringOpt x,
          new = fn x => new "gtk-xft-rgba" stringOpt x
        }
    end
  end
