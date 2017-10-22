signature GTK_SETTINGS =
  sig
    type 'a class
    type 'a style_provider_class
    type settings_value_t
    type i_m_preedit_style_t
    type i_m_status_style_t
    type corner_type_t
    type icon_size_t
    type toolbar_style_t
    type policy_type_t
    type t = base class
    val asStyleProvider : 'a class -> base style_provider_class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val getForScreen : 'a Gdk.ScreenClass.class -> base class
    val installProperty : 'a GObject.ParamSpecClass.class -> unit
    val resetProperty :
      'a class
       -> string
       -> unit
    val setDoubleProperty :
      'a class
       -> string
           * real
           * string
       -> unit
    val setLongProperty :
      'a class
       -> string
           * LargeInt.int
           * string
       -> unit
    val setPropertyValue :
      'a class
       -> string * settings_value_t
       -> unit
    val setStringProperty :
      'a class
       -> string
           * string
           * string
       -> unit
    val gtkAlternativeButtonOrderProp : ('a class, bool, bool) Property.readwrite
    val gtkAlternativeSortArrowsProp : ('a class, bool, bool) Property.readwrite
    val gtkApplicationPreferDarkThemeProp : ('a class, bool, bool) Property.readwrite
    val gtkAutoMnemonicsProp : ('a class, bool, bool) Property.readwrite
    val gtkButtonImagesProp : ('a class, bool, bool) Property.readwrite
    val gtkCanChangeAccelsProp : ('a class, bool, bool) Property.readwrite
    val gtkColorPaletteProp : ('a class, string option, string option) Property.readwrite
    val gtkColorSchemeProp : ('a class, string option, string option) Property.readwrite
    val gtkCursorBlinkProp : ('a class, bool, bool) Property.readwrite
    val gtkCursorBlinkTimeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkCursorBlinkTimeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkCursorThemeNameProp : ('a class, string option, string option) Property.readwrite
    val gtkCursorThemeSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkDecorationLayoutProp : ('a class, string option, string option) Property.readwrite
    val gtkDialogsUseHeaderProp : ('a class, bool, bool) Property.readwrite
    val gtkDndDragThresholdProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkDoubleClickDistanceProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkDoubleClickTimeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkEnableAccelsProp : ('a class, bool, bool) Property.readwrite
    val gtkEnableAnimationsProp : ('a class, bool, bool) Property.readwrite
    val gtkEnableEventSoundsProp : ('a class, bool, bool) Property.readwrite
    val gtkEnableInputFeedbackSoundsProp : ('a class, bool, bool) Property.readwrite
    val gtkEnableMnemonicsProp : ('a class, bool, bool) Property.readwrite
    val gtkEnablePrimaryPasteProp : ('a class, bool, bool) Property.readwrite
    val gtkEnableTooltipsProp : ('a class, bool, bool) Property.readwrite
    val gtkEntryPasswordHintTimeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkEntrySelectOnFocusProp : ('a class, bool, bool) Property.readwrite
    val gtkErrorBellProp : ('a class, bool, bool) Property.readwrite
    val gtkFallbackIconThemeProp : ('a class, string option, string option) Property.readwrite
    val gtkFileChooserBackendProp : ('a class, string option, string option) Property.readwrite
    val gtkFontNameProp : ('a class, string option, string option) Property.readwrite
    val gtkFontconfigTimestampProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkIconSizesProp : ('a class, string option, string option) Property.readwrite
    val gtkIconThemeNameProp : ('a class, string option, string option) Property.readwrite
    val gtkImModuleProp : ('a class, string option, string option) Property.readwrite
    val gtkImPreeditStyleProp : ('a class, i_m_preedit_style_t, i_m_preedit_style_t) Property.readwrite
    val gtkImStatusStyleProp : ('a class, i_m_status_style_t, i_m_status_style_t) Property.readwrite
    val gtkKeyThemeNameProp : ('a class, string option, string option) Property.readwrite
    val gtkKeynavCursorOnlyProp : ('a class, bool, bool) Property.readwrite
    val gtkKeynavUseCaretProp : ('a class, bool, bool) Property.readwrite
    val gtkKeynavWrapAroundProp : ('a class, bool, bool) Property.readwrite
    val gtkLabelSelectOnFocusProp : ('a class, bool, bool) Property.readwrite
    val gtkLongPressTimeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkMenuBarAccelProp : ('a class, string option, string option) Property.readwrite
    val gtkMenuBarPopupDelayProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkMenuImagesProp : ('a class, bool, bool) Property.readwrite
    val gtkMenuPopdownDelayProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkMenuPopupDelayProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkModulesProp : ('a class, string option, string option) Property.readwrite
    val gtkPrimaryButtonWarpsSliderProp : ('a class, bool, bool) Property.readwrite
    val gtkPrintBackendsProp : ('a class, string option, string option) Property.readwrite
    val gtkPrintPreviewCommandProp : ('a class, string option, string option) Property.readwrite
    val gtkRecentFilesEnabledProp : ('a class, bool, bool) Property.readwrite
    val gtkRecentFilesLimitProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkRecentFilesMaxAgeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkScrolledWindowPlacementProp : ('a class, corner_type_t, corner_type_t) Property.readwrite
    val gtkShellShowsAppMenuProp : ('a class, bool, bool) Property.readwrite
    val gtkShellShowsDesktopProp : ('a class, bool, bool) Property.readwrite
    val gtkShellShowsMenubarProp : ('a class, bool, bool) Property.readwrite
    val gtkShowInputMethodMenuProp : ('a class, bool, bool) Property.readwrite
    val gtkShowUnicodeMenuProp : ('a class, bool, bool) Property.readwrite
    val gtkSoundThemeNameProp : ('a class, string option, string option) Property.readwrite
    val gtkSplitCursorProp : ('a class, bool, bool) Property.readwrite
    val gtkThemeNameProp : ('a class, string option, string option) Property.readwrite
    val gtkTimeoutExpandProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTimeoutInitialProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTimeoutRepeatProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTitlebarDoubleClickProp : ('a class, string option, string option) Property.readwrite
    val gtkTitlebarMiddleClickProp : ('a class, string option, string option) Property.readwrite
    val gtkTitlebarRightClickProp : ('a class, string option, string option) Property.readwrite
    val gtkToolbarIconSizeProp : ('a class, icon_size_t, icon_size_t) Property.readwrite
    val gtkToolbarStyleProp : ('a class, toolbar_style_t, toolbar_style_t) Property.readwrite
    val gtkTooltipBrowseModeTimeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTooltipBrowseTimeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTooltipTimeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkTouchscreenModeProp : ('a class, bool, bool) Property.readwrite
    val gtkVisibleFocusProp : ('a class, policy_type_t, policy_type_t) Property.readwrite
    val gtkXftAntialiasProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkXftDpiProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkXftHintingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val gtkXftHintstyleProp : ('a class, string option, string option) Property.readwrite
    val gtkXftRgbaProp : ('a class, string option, string option) Property.readwrite
  end
