structure GtkSettings :>
  GTK_SETTINGS
    where type 'a class = 'a GtkSettingsClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class
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
               * GLong.FFI.val_
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
    fun getForScreen screen = (GdkScreenClass.FFI.withPtr false ---> GtkSettingsClass.FFI.fromPtr false) getForScreen_ screen before GdkScreenClass.FFI.touchPtr screen
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
         &&&> GLong.FFI.withVal
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
      open ValueAccessor
    in
      val gtkAlternativeButtonOrderProp =
        {
          name = "gtk-alternative-button-order",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkAlternativeSortArrowsProp =
        {
          name = "gtk-alternative-sort-arrows",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkApplicationPreferDarkThemeProp =
        {
          name = "gtk-application-prefer-dark-theme",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkAutoMnemonicsProp =
        {
          name = "gtk-auto-mnemonics",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkButtonImagesProp =
        {
          name = "gtk-button-images",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkCanChangeAccelsProp =
        {
          name = "gtk-can-change-accels",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkColorPaletteProp =
        {
          name = "gtk-color-palette",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkColorSchemeProp =
        {
          name = "gtk-color-scheme",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkCursorBlinkProp =
        {
          name = "gtk-cursor-blink",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkCursorBlinkTimeProp =
        {
          name = "gtk-cursor-blink-time",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkCursorBlinkTimeoutProp =
        {
          name = "gtk-cursor-blink-timeout",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkCursorThemeNameProp =
        {
          name = "gtk-cursor-theme-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkCursorThemeSizeProp =
        {
          name = "gtk-cursor-theme-size",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkDecorationLayoutProp =
        {
          name = "gtk-decoration-layout",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkDialogsUseHeaderProp =
        {
          name = "gtk-dialogs-use-header",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkDndDragThresholdProp =
        {
          name = "gtk-dnd-drag-threshold",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkDoubleClickDistanceProp =
        {
          name = "gtk-double-click-distance",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkDoubleClickTimeProp =
        {
          name = "gtk-double-click-time",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkEnableAccelsProp =
        {
          name = "gtk-enable-accels",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkEnableAnimationsProp =
        {
          name = "gtk-enable-animations",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkEnableEventSoundsProp =
        {
          name = "gtk-enable-event-sounds",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkEnableInputFeedbackSoundsProp =
        {
          name = "gtk-enable-input-feedback-sounds",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkEnableMnemonicsProp =
        {
          name = "gtk-enable-mnemonics",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkEnablePrimaryPasteProp =
        {
          name = "gtk-enable-primary-paste",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkEnableTooltipsProp =
        {
          name = "gtk-enable-tooltips",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkEntryPasswordHintTimeoutProp =
        {
          name = "gtk-entry-password-hint-timeout",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val gtkEntrySelectOnFocusProp =
        {
          name = "gtk-entry-select-on-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkErrorBellProp =
        {
          name = "gtk-error-bell",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkFallbackIconThemeProp =
        {
          name = "gtk-fallback-icon-theme",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkFileChooserBackendProp =
        {
          name = "gtk-file-chooser-backend",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkFontNameProp =
        {
          name = "gtk-font-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkFontconfigTimestampProp =
        {
          name = "gtk-fontconfig-timestamp",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val gtkIconSizesProp =
        {
          name = "gtk-icon-sizes",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkIconThemeNameProp =
        {
          name = "gtk-icon-theme-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkImModuleProp =
        {
          name = "gtk-im-module",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkImPreeditStyleProp =
        {
          name = "gtk-im-preedit-style",
          gtype = fn () => C.gtype GtkIMPreeditStyle.t (),
          get = fn x => fn () => C.get GtkIMPreeditStyle.t x,
          set = fn x => C.set GtkIMPreeditStyle.t x,
          init = fn x => C.set GtkIMPreeditStyle.t x
        }
      val gtkImStatusStyleProp =
        {
          name = "gtk-im-status-style",
          gtype = fn () => C.gtype GtkIMStatusStyle.t (),
          get = fn x => fn () => C.get GtkIMStatusStyle.t x,
          set = fn x => C.set GtkIMStatusStyle.t x,
          init = fn x => C.set GtkIMStatusStyle.t x
        }
      val gtkKeyThemeNameProp =
        {
          name = "gtk-key-theme-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkKeynavCursorOnlyProp =
        {
          name = "gtk-keynav-cursor-only",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkKeynavUseCaretProp =
        {
          name = "gtk-keynav-use-caret",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkKeynavWrapAroundProp =
        {
          name = "gtk-keynav-wrap-around",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkLabelSelectOnFocusProp =
        {
          name = "gtk-label-select-on-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkLongPressTimeProp =
        {
          name = "gtk-long-press-time",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val gtkMenuBarAccelProp =
        {
          name = "gtk-menu-bar-accel",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkMenuBarPopupDelayProp =
        {
          name = "gtk-menu-bar-popup-delay",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkMenuImagesProp =
        {
          name = "gtk-menu-images",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkMenuPopdownDelayProp =
        {
          name = "gtk-menu-popdown-delay",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkMenuPopupDelayProp =
        {
          name = "gtk-menu-popup-delay",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkModulesProp =
        {
          name = "gtk-modules",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkPrimaryButtonWarpsSliderProp =
        {
          name = "gtk-primary-button-warps-slider",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkPrintBackendsProp =
        {
          name = "gtk-print-backends",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkPrintPreviewCommandProp =
        {
          name = "gtk-print-preview-command",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkRecentFilesEnabledProp =
        {
          name = "gtk-recent-files-enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkRecentFilesLimitProp =
        {
          name = "gtk-recent-files-limit",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkRecentFilesMaxAgeProp =
        {
          name = "gtk-recent-files-max-age",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkScrolledWindowPlacementProp =
        {
          name = "gtk-scrolled-window-placement",
          gtype = fn () => C.gtype GtkCornerType.t (),
          get = fn x => fn () => C.get GtkCornerType.t x,
          set = fn x => C.set GtkCornerType.t x,
          init = fn x => C.set GtkCornerType.t x
        }
      val gtkShellShowsAppMenuProp =
        {
          name = "gtk-shell-shows-app-menu",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkShellShowsDesktopProp =
        {
          name = "gtk-shell-shows-desktop",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkShellShowsMenubarProp =
        {
          name = "gtk-shell-shows-menubar",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkShowInputMethodMenuProp =
        {
          name = "gtk-show-input-method-menu",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkShowUnicodeMenuProp =
        {
          name = "gtk-show-unicode-menu",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkSoundThemeNameProp =
        {
          name = "gtk-sound-theme-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkSplitCursorProp =
        {
          name = "gtk-split-cursor",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkThemeNameProp =
        {
          name = "gtk-theme-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkTimeoutExpandProp =
        {
          name = "gtk-timeout-expand",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkTimeoutInitialProp =
        {
          name = "gtk-timeout-initial",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkTimeoutRepeatProp =
        {
          name = "gtk-timeout-repeat",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkTitlebarDoubleClickProp =
        {
          name = "gtk-titlebar-double-click",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkTitlebarMiddleClickProp =
        {
          name = "gtk-titlebar-middle-click",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkTitlebarRightClickProp =
        {
          name = "gtk-titlebar-right-click",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkToolbarIconSizeProp =
        {
          name = "gtk-toolbar-icon-size",
          gtype = fn () => C.gtype GtkIconSize.t (),
          get = fn x => fn () => C.get GtkIconSize.t x,
          set = fn x => C.set GtkIconSize.t x,
          init = fn x => C.set GtkIconSize.t x
        }
      val gtkToolbarStyleProp =
        {
          name = "gtk-toolbar-style",
          gtype = fn () => C.gtype GtkToolbarStyle.t (),
          get = fn x => fn () => C.get GtkToolbarStyle.t x,
          set = fn x => C.set GtkToolbarStyle.t x,
          init = fn x => C.set GtkToolbarStyle.t x
        }
      val gtkTooltipBrowseModeTimeoutProp =
        {
          name = "gtk-tooltip-browse-mode-timeout",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkTooltipBrowseTimeoutProp =
        {
          name = "gtk-tooltip-browse-timeout",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkTooltipTimeoutProp =
        {
          name = "gtk-tooltip-timeout",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkTouchscreenModeProp =
        {
          name = "gtk-touchscreen-mode",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val gtkVisibleFocusProp =
        {
          name = "gtk-visible-focus",
          gtype = fn () => C.gtype GtkPolicyType.t (),
          get = fn x => fn () => C.get GtkPolicyType.t x,
          set = fn x => C.set GtkPolicyType.t x,
          init = fn x => C.set GtkPolicyType.t x
        }
      val gtkXftAntialiasProp =
        {
          name = "gtk-xft-antialias",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkXftDpiProp =
        {
          name = "gtk-xft-dpi",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkXftHintingProp =
        {
          name = "gtk-xft-hinting",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gtkXftHintstyleProp =
        {
          name = "gtk-xft-hintstyle",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val gtkXftRgbaProp =
        {
          name = "gtk-xft-rgba",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
