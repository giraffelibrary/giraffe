signature GTK_SETTINGS =
  sig
    type 'a class
    type 'a style_provider_class
    type i_m_preedit_style_t
    type i_m_status_style_t
    type corner_type_t
    type icon_size_t
    type toolbar_style_t
    type policy_type_t
    type t = base class
    val asStyleProvider : 'a class -> base style_provider_class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class option
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
    val setStringProperty :
      'a class
       -> string
           * string
           * string
       -> unit
    val gtkAlternativeButtonOrderProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkAlternativeSortArrowsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkApplicationPreferDarkThemeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkAutoMnemonicsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkButtonImagesProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkCanChangeAccelsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkColorPaletteProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkColorSchemeProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkCursorBlinkProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkCursorBlinkTimeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkCursorBlinkTimeoutProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkCursorThemeNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkCursorThemeSizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkDecorationLayoutProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkDialogsUseHeaderProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkDndDragThresholdProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkDoubleClickDistanceProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkDoubleClickTimeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkEnableAccelsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkEnableAnimationsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkEnableEventSoundsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkEnableInputFeedbackSoundsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkEnableMnemonicsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkEnablePrimaryPasteProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkEnableTooltipsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkEntryPasswordHintTimeoutProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkEntrySelectOnFocusProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkErrorBellProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkFallbackIconThemeProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkFileChooserBackendProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkFontNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkFontconfigTimestampProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkIconSizesProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkIconThemeNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkImModuleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkImPreeditStyleProp : ('a class, unit -> i_m_preedit_style_t, i_m_preedit_style_t -> unit, i_m_preedit_style_t -> unit) Property.t
    val gtkImStatusStyleProp : ('a class, unit -> i_m_status_style_t, i_m_status_style_t -> unit, i_m_status_style_t -> unit) Property.t
    val gtkKeyThemeNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkKeynavCursorOnlyProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkKeynavUseCaretProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkKeynavWrapAroundProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkLabelSelectOnFocusProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkLongPressTimeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkMenuBarAccelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkMenuBarPopupDelayProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkMenuImagesProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkMenuPopdownDelayProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkMenuPopupDelayProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkModulesProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkPrimaryButtonWarpsSliderProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkPrintBackendsProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkPrintPreviewCommandProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkRecentFilesEnabledProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkRecentFilesLimitProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkRecentFilesMaxAgeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkScrolledWindowPlacementProp : ('a class, unit -> corner_type_t, corner_type_t -> unit, corner_type_t -> unit) Property.t
    val gtkShellShowsAppMenuProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkShellShowsDesktopProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkShellShowsMenubarProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkShowInputMethodMenuProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkShowUnicodeMenuProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkSoundThemeNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkSplitCursorProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkThemeNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkTimeoutExpandProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkTimeoutInitialProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkTimeoutRepeatProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkTitlebarDoubleClickProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkTitlebarMiddleClickProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkTitlebarRightClickProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkToolbarIconSizeProp : ('a class, unit -> icon_size_t, icon_size_t -> unit, icon_size_t -> unit) Property.t
    val gtkToolbarStyleProp : ('a class, unit -> toolbar_style_t, toolbar_style_t -> unit, toolbar_style_t -> unit) Property.t
    val gtkTooltipBrowseModeTimeoutProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkTooltipBrowseTimeoutProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkTooltipTimeoutProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkTouchscreenModeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val gtkVisibleFocusProp : ('a class, unit -> policy_type_t, policy_type_t -> unit, policy_type_t -> unit) Property.t
    val gtkXftAntialiasProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkXftDpiProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkXftHintingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val gtkXftHintstyleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val gtkXftRgbaProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
