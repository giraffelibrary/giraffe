signature GTK =
  sig
    structure AllocationRecord : GTK_ALLOCATION_RECORD
    structure AccelFlags : GTK_ACCEL_FLAGS
    structure AccelGroupClass : GTK_ACCEL_GROUP_CLASS
    structure AccelKeyRecord : GTK_ACCEL_KEY_RECORD
    structure AccelMapClass : GTK_ACCEL_MAP_CLASS
    structure AccessibleClass : GTK_ACCESSIBLE_CLASS
    structure ActionClass : GTK_ACTION_CLASS
    structure ActionGroupClass : GTK_ACTION_GROUP_CLASS
    structure ActionableClass : GTK_ACTIONABLE_CLASS
    structure ActivatableClass : GTK_ACTIVATABLE_CLASS
    structure AdjustmentClass : GTK_ADJUSTMENT_CLASS
    structure Align : GTK_ALIGN
    structure AppChooserClass : GTK_APP_CHOOSER_CLASS
    structure ApplicationClass : GTK_APPLICATION_CLASS
    structure ApplicationInhibitFlags : GTK_APPLICATION_INHIBIT_FLAGS
    structure ArrowPlacement : GTK_ARROW_PLACEMENT
    structure ArrowType : GTK_ARROW_TYPE
    structure AssistantPageType : GTK_ASSISTANT_PAGE_TYPE
    structure AttachOptions : GTK_ATTACH_OPTIONS
    structure BaselinePosition : GTK_BASELINE_POSITION
    structure BorderRecord : GTK_BORDER_RECORD
    structure BorderStyle : GTK_BORDER_STYLE
    structure BuildableClass : GTK_BUILDABLE_CLASS
    structure BuilderClass : GTK_BUILDER_CLASS
    structure BuilderError : GTK_BUILDER_ERROR
    exception BuilderError of BuilderError.t
    structure ButtonBoxStyle : GTK_BUTTON_BOX_STYLE
    structure ButtonRole : GTK_BUTTON_ROLE
    structure ButtonsType : GTK_BUTTONS_TYPE
    structure CalendarDisplayOptions : GTK_CALENDAR_DISPLAY_OPTIONS
    structure CellAccessibleParentClass : GTK_CELL_ACCESSIBLE_PARENT_CLASS
    structure CellAreaClass : GTK_CELL_AREA_CLASS
    structure CellAreaContextClass : GTK_CELL_AREA_CONTEXT_CLASS
    structure CellEditableClass : GTK_CELL_EDITABLE_CLASS
    structure CellLayoutClass : GTK_CELL_LAYOUT_CLASS
    structure CellRendererClass : GTK_CELL_RENDERER_CLASS
    structure CellRendererAccelMode : GTK_CELL_RENDERER_ACCEL_MODE
    structure CellRendererMode : GTK_CELL_RENDERER_MODE
    structure CellRendererState : GTK_CELL_RENDERER_STATE
    structure ClipboardClass : GTK_CLIPBOARD_CLASS
    structure ColorChooserClass : GTK_COLOR_CHOOSER_CLASS
    structure CornerType : GTK_CORNER_TYPE
    structure CssProviderClass : GTK_CSS_PROVIDER_CLASS
    structure CssProviderError : GTK_CSS_PROVIDER_ERROR
    exception CssProviderError of CssProviderError.t
    structure CssSectionRecord : GTK_CSS_SECTION_RECORD
    structure CssSectionType : GTK_CSS_SECTION_TYPE
    structure DebugFlag : GTK_DEBUG_FLAG
    structure DeleteType : GTK_DELETE_TYPE
    structure DestDefaults : GTK_DEST_DEFAULTS
    structure DialogFlags : GTK_DIALOG_FLAGS
    structure DirectionType : GTK_DIRECTION_TYPE
    structure DragResult : GTK_DRAG_RESULT
    structure EditableClass : GTK_EDITABLE_CLASS
    structure EntryBufferClass : GTK_ENTRY_BUFFER_CLASS
    structure EntryCompletionClass : GTK_ENTRY_COMPLETION_CLASS
    structure EntryIconAccessibleClass : GTK_ENTRY_ICON_ACCESSIBLE_CLASS
    structure EntryIconPosition : GTK_ENTRY_ICON_POSITION
    structure EventControllerClass : GTK_EVENT_CONTROLLER_CLASS
    structure EventSequenceState : GTK_EVENT_SEQUENCE_STATE
    structure ExpanderStyle : GTK_EXPANDER_STYLE
    structure FileChooserClass : GTK_FILE_CHOOSER_CLASS
    structure FileChooserAction : GTK_FILE_CHOOSER_ACTION
    structure FileChooserConfirmation : GTK_FILE_CHOOSER_CONFIRMATION
    structure FileChooserError : GTK_FILE_CHOOSER_ERROR
    exception FileChooserError of FileChooserError.t
    structure FileFilterClass : GTK_FILE_FILTER_CLASS
    structure FileFilterFlags : GTK_FILE_FILTER_FLAGS
    structure FontChooserClass : GTK_FONT_CHOOSER_CLASS
    structure GradientRecord : GTK_GRADIENT_RECORD
    structure IMContextClass : GTK_I_M_CONTEXT_CLASS
    structure IMPreeditStyle : GTK_I_M_PREEDIT_STYLE
    structure IMStatusStyle : GTK_I_M_STATUS_STYLE
    structure IconFactoryClass : GTK_ICON_FACTORY_CLASS
    structure IconInfoClass : GTK_ICON_INFO_CLASS
    structure IconLookupFlags : GTK_ICON_LOOKUP_FLAGS
    structure IconSetRecord : GTK_ICON_SET_RECORD
    structure IconSourceRecord : GTK_ICON_SOURCE_RECORD
    structure IconThemeClass : GTK_ICON_THEME_CLASS
    structure IconThemeError : GTK_ICON_THEME_ERROR
    exception IconThemeError of IconThemeError.t
    structure IconViewDropPosition : GTK_ICON_VIEW_DROP_POSITION
    structure ImageType : GTK_IMAGE_TYPE
    structure InputHints : GTK_INPUT_HINTS
    structure InputPurpose : GTK_INPUT_PURPOSE
    structure JunctionSides : GTK_JUNCTION_SIDES
    structure Justification : GTK_JUSTIFICATION
    structure LevelBarMode : GTK_LEVEL_BAR_MODE
    structure License : GTK_LICENSE
    structure ListStoreClass : GTK_LIST_STORE_CLASS
    structure MenuDirectionType : GTK_MENU_DIRECTION_TYPE
    structure MessageType : GTK_MESSAGE_TYPE
    structure MountOperationClass : GTK_MOUNT_OPERATION_CLASS
    structure MovementStep : GTK_MOVEMENT_STEP
    structure NativeDialogClass : GTK_NATIVE_DIALOG_CLASS
    structure NotebookPageAccessibleClass : GTK_NOTEBOOK_PAGE_ACCESSIBLE_CLASS
    structure NotebookTab : GTK_NOTEBOOK_TAB
    structure NumberUpLayout : GTK_NUMBER_UP_LAYOUT
    structure NumerableIconClass : GTK_NUMERABLE_ICON_CLASS
    structure OrientableClass : GTK_ORIENTABLE_CLASS
    structure Orientation : GTK_ORIENTATION
    structure PackDirection : GTK_PACK_DIRECTION
    structure PackType : GTK_PACK_TYPE
    structure PadActionType : GTK_PAD_ACTION_TYPE
    structure PageOrientation : GTK_PAGE_ORIENTATION
    structure PageRangeRecord : GTK_PAGE_RANGE_RECORD
    structure PageSet : GTK_PAGE_SET
    structure PageSetupClass : GTK_PAGE_SETUP_CLASS
    structure PanDirection : GTK_PAN_DIRECTION
    structure PaperSizeRecord : GTK_PAPER_SIZE_RECORD
    structure PathPriorityType : GTK_PATH_PRIORITY_TYPE
    structure PathType : GTK_PATH_TYPE
    structure PlacesOpenFlags : GTK_PLACES_OPEN_FLAGS
    structure PolicyType : GTK_POLICY_TYPE
    structure PopoverConstraint : GTK_POPOVER_CONSTRAINT
    structure PositionType : GTK_POSITION_TYPE
    structure PrintContextClass : GTK_PRINT_CONTEXT_CLASS
    structure PrintDuplex : GTK_PRINT_DUPLEX
    structure PrintError : GTK_PRINT_ERROR
    exception PrintError of PrintError.t
    structure PrintOperationClass : GTK_PRINT_OPERATION_CLASS
    structure PrintOperationAction : GTK_PRINT_OPERATION_ACTION
    structure PrintOperationPreviewClass : GTK_PRINT_OPERATION_PREVIEW_CLASS
    structure PrintOperationResult : GTK_PRINT_OPERATION_RESULT
    structure PrintPages : GTK_PRINT_PAGES
    structure PrintQuality : GTK_PRINT_QUALITY
    structure PrintSettingsClass : GTK_PRINT_SETTINGS_CLASS
    structure PrintStatus : GTK_PRINT_STATUS
    structure PropagationPhase : GTK_PROPAGATION_PHASE
    structure RcFlags : GTK_RC_FLAGS
    structure RcStyleClass : GTK_RC_STYLE_CLASS
    structure RcTokenType : GTK_RC_TOKEN_TYPE
    structure RecentChooserClass : GTK_RECENT_CHOOSER_CLASS
    structure RecentChooserError : GTK_RECENT_CHOOSER_ERROR
    exception RecentChooserError of RecentChooserError.t
    structure RecentFilterClass : GTK_RECENT_FILTER_CLASS
    structure RecentFilterFlags : GTK_RECENT_FILTER_FLAGS
    structure RecentInfoRecord : GTK_RECENT_INFO_RECORD
    structure RecentManagerClass : GTK_RECENT_MANAGER_CLASS
    structure RecentManagerError : GTK_RECENT_MANAGER_ERROR
    exception RecentManagerError of RecentManagerError.t
    structure RecentSortType : GTK_RECENT_SORT_TYPE
    structure RegionFlags : GTK_REGION_FLAGS
    structure ReliefStyle : GTK_RELIEF_STYLE
    structure RequisitionRecord : GTK_REQUISITION_RECORD
    structure ResizeMode : GTK_RESIZE_MODE
    structure ResponseType : GTK_RESPONSE_TYPE
    structure RevealerTransitionType : GTK_REVEALER_TRANSITION_TYPE
    structure ScrollStep : GTK_SCROLL_STEP
    structure ScrollType : GTK_SCROLL_TYPE
    structure ScrollableClass : GTK_SCROLLABLE_CLASS
    structure ScrollablePolicy : GTK_SCROLLABLE_POLICY
    structure SelectionDataRecord : GTK_SELECTION_DATA_RECORD
    structure SelectionMode : GTK_SELECTION_MODE
    structure SensitivityType : GTK_SENSITIVITY_TYPE
    structure SettingsClass : GTK_SETTINGS_CLASS
    structure ShadowType : GTK_SHADOW_TYPE
    structure ShortcutType : GTK_SHORTCUT_TYPE
    structure SizeGroupClass : GTK_SIZE_GROUP_CLASS
    structure SizeGroupMode : GTK_SIZE_GROUP_MODE
    structure SizeRequestMode : GTK_SIZE_REQUEST_MODE
    structure SortType : GTK_SORT_TYPE
    structure SpinButtonUpdatePolicy : GTK_SPIN_BUTTON_UPDATE_POLICY
    structure SpinType : GTK_SPIN_TYPE
    structure StackTransitionType : GTK_STACK_TRANSITION_TYPE
    structure StateFlags : GTK_STATE_FLAGS
    structure StateType : GTK_STATE_TYPE
    structure StatusIconClass : GTK_STATUS_ICON_CLASS
    structure StyleClass : GTK_STYLE_CLASS
    structure StyleContextClass : GTK_STYLE_CONTEXT_CLASS
    structure StyleContextPrintFlags : GTK_STYLE_CONTEXT_PRINT_FLAGS
    structure StylePropertiesClass : GTK_STYLE_PROPERTIES_CLASS
    structure StyleProviderClass : GTK_STYLE_PROVIDER_CLASS
    structure SymbolicColorRecord : GTK_SYMBOLIC_COLOR_RECORD
    structure TableRowColRecord : GTK_TABLE_ROW_COL_RECORD
    structure TargetEntryRecord : GTK_TARGET_ENTRY_RECORD
    structure TargetFlags : GTK_TARGET_FLAGS
    structure TargetListRecord : GTK_TARGET_LIST_RECORD
    structure TextAppearanceRecord : GTK_TEXT_APPEARANCE_RECORD
    structure TextAttributesRecord : GTK_TEXT_ATTRIBUTES_RECORD
    structure TextBufferClass : GTK_TEXT_BUFFER_CLASS
    structure TextBufferTargetInfo : GTK_TEXT_BUFFER_TARGET_INFO
    structure TextChildAnchorClass : GTK_TEXT_CHILD_ANCHOR_CLASS
    structure TextDirection : GTK_TEXT_DIRECTION
    structure TextExtendSelection : GTK_TEXT_EXTEND_SELECTION
    structure TextIterRecord : GTK_TEXT_ITER_RECORD
    structure TextMarkClass : GTK_TEXT_MARK_CLASS
    structure TextSearchFlags : GTK_TEXT_SEARCH_FLAGS
    structure TextTagClass : GTK_TEXT_TAG_CLASS
    structure TextTagTableClass : GTK_TEXT_TAG_TABLE_CLASS
    structure TextViewLayer : GTK_TEXT_VIEW_LAYER
    structure TextWindowType : GTK_TEXT_WINDOW_TYPE
    structure ThemingEngineClass : GTK_THEMING_ENGINE_CLASS
    structure ToolPaletteDragTargets : GTK_TOOL_PALETTE_DRAG_TARGETS
    structure ToolShellClass : GTK_TOOL_SHELL_CLASS
    structure ToolbarSpaceStyle : GTK_TOOLBAR_SPACE_STYLE
    structure ToolbarStyle : GTK_TOOLBAR_STYLE
    structure TooltipClass : GTK_TOOLTIP_CLASS
    structure ToplevelAccessibleClass : GTK_TOPLEVEL_ACCESSIBLE_CLASS
    structure TreeDragDestClass : GTK_TREE_DRAG_DEST_CLASS
    structure TreeDragSourceClass : GTK_TREE_DRAG_SOURCE_CLASS
    structure TreeIterRecord : GTK_TREE_ITER_RECORD
    structure TreeModelClass : GTK_TREE_MODEL_CLASS
    structure TreeModelFilterClass : GTK_TREE_MODEL_FILTER_CLASS
    structure TreeModelFlags : GTK_TREE_MODEL_FLAGS
    structure TreeModelSortClass : GTK_TREE_MODEL_SORT_CLASS
    structure TreePathRecord : GTK_TREE_PATH_RECORD
    structure TreeRowReferenceRecord : GTK_TREE_ROW_REFERENCE_RECORD
    structure TreeSelectionClass : GTK_TREE_SELECTION_CLASS
    structure TreeSortableClass : GTK_TREE_SORTABLE_CLASS
    structure TreeStoreClass : GTK_TREE_STORE_CLASS
    structure TreeViewColumnClass : GTK_TREE_VIEW_COLUMN_CLASS
    structure TreeViewColumnSizing : GTK_TREE_VIEW_COLUMN_SIZING
    structure TreeViewDropPosition : GTK_TREE_VIEW_DROP_POSITION
    structure TreeViewGridLines : GTK_TREE_VIEW_GRID_LINES
    structure UIManagerClass : GTK_U_I_MANAGER_CLASS
    structure UIManagerItemType : GTK_U_I_MANAGER_ITEM_TYPE
    structure Unit : GTK_UNIT
    structure WidgetClass : GTK_WIDGET_CLASS
    structure WidgetHelpType : GTK_WIDGET_HELP_TYPE
    structure WidgetPathRecord : GTK_WIDGET_PATH_RECORD
    structure WindowGroupClass : GTK_WINDOW_GROUP_CLASS
    structure WindowPosition : GTK_WINDOW_POSITION
    structure WindowType : GTK_WINDOW_TYPE
    structure WrapMode : GTK_WRAP_MODE
    structure AccelGroup :
      GTK_ACCEL_GROUP
        where type 'a class = 'a AccelGroupClass.class
        where type accel_flags_t = AccelFlags.t
    structure AccelKey :
      GTK_ACCEL_KEY
        where type t = AccelKeyRecord.t
    structure AccelMap :
      GTK_ACCEL_MAP
        where type 'a class = 'a AccelMapClass.class
        where type accel_key_t = AccelKeyRecord.t
    structure Accessible :
      GTK_ACCESSIBLE
        where type 'a class = 'a AccessibleClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure Action :
      GTK_ACTION
        where type 'a class = 'a ActionClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a accel_group_class = 'a AccelGroupClass.class
        where type 'a action_group_class = 'a ActionGroupClass.class
    structure ActionGroup :
      GTK_ACTION_GROUP
        where type 'a class = 'a ActionGroupClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a action_class = 'a ActionClass.class
        where type 'a accel_group_class = 'a AccelGroupClass.class
    structure Actionable :
      GTK_ACTIONABLE
        where type 'a class = 'a ActionableClass.class
    structure Activatable :
      GTK_ACTIVATABLE
        where type 'a class = 'a ActivatableClass.class
        where type 'a action_class = 'a ActionClass.class
    structure Adjustment :
      GTK_ADJUSTMENT
        where type 'a class = 'a AdjustmentClass.class
    structure AppChooser :
      GTK_APP_CHOOSER
        where type 'a class = 'a AppChooserClass.class
    structure Border :
      GTK_BORDER
        where type t = BorderRecord.t
    structure Buildable :
      GTK_BUILDABLE
        where type 'a class = 'a BuildableClass.class
        where type 'a builder_class = 'a BuilderClass.class
    structure Builder :
      GTK_BUILDER
        where type 'a class = 'a BuilderClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a application_class = 'a ApplicationClass.class
    structure CalendarClass :
      GTK_CALENDAR_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure CellAccessibleClass :
      GTK_CELL_ACCESSIBLE_CLASS
        where type 'a accessible_class = 'a AccessibleClass.class
    structure CellArea :
      GTK_CELL_AREA
        where type 'a class = 'a CellAreaClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
        where type direction_type_t = DirectionType.t
        where type size_request_mode_t = SizeRequestMode.t
        where type cell_renderer_state_t = CellRendererState.t
        where type 'a cell_area_context_class = 'a CellAreaContextClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type orientation_t = Orientation.t
        where type tree_iter_t = TreeIterRecord.t
        where type 'a tree_model_class = 'a TreeModelClass.class
        where type 'a cell_editable_class = 'a CellEditableClass.class
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure CellAreaBoxClass :
      GTK_CELL_AREA_BOX_CLASS
        where type 'a cell_area_class = 'a CellAreaClass.class
    structure CellAreaContext :
      GTK_CELL_AREA_CONTEXT
        where type 'a class = 'a CellAreaContextClass.class
        where type 'a cell_area_class = 'a CellAreaClass.class
    structure CellEditable :
      GTK_CELL_EDITABLE
        where type 'a class = 'a CellEditableClass.class
    structure CellLayout :
      GTK_CELL_LAYOUT
        where type 'a class = 'a CellLayoutClass.class
        where type 'a cell_area_class = 'a CellAreaClass.class
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure CellRenderer :
      GTK_CELL_RENDERER
        where type 'a class = 'a CellRendererClass.class
        where type requisition_t = RequisitionRecord.t
        where type size_request_mode_t = SizeRequestMode.t
        where type state_flags_t = StateFlags.t
        where type cell_renderer_state_t = CellRendererState.t
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a cell_editable_class = 'a CellEditableClass.class
        where type cell_renderer_mode_t = CellRendererMode.t
    structure CellRendererPixbufClass :
      GTK_CELL_RENDERER_PIXBUF_CLASS
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure CellRendererProgressClass :
      GTK_CELL_RENDERER_PROGRESS_CLASS
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure CellRendererSpinnerClass :
      GTK_CELL_RENDERER_SPINNER_CLASS
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure CellRendererTextClass :
      GTK_CELL_RENDERER_TEXT_CLASS
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure CellRendererToggleClass :
      GTK_CELL_RENDERER_TOGGLE_CLASS
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure CellViewClass :
      GTK_CELL_VIEW_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure ColorChooser :
      GTK_COLOR_CHOOSER
        where type 'a class = 'a ColorChooserClass.class
        where type orientation_t = Orientation.t
    structure ContainerClass :
      GTK_CONTAINER_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure CssProvider :
      GTK_CSS_PROVIDER
        where type 'a class = 'a CssProviderClass.class
        where type 'a style_provider_class = 'a StyleProviderClass.class
    structure CssSection :
      GTK_CSS_SECTION
        where type t = CssSectionRecord.t
        where type css_section_type_t = CssSectionType.t
    structure DrawingAreaClass :
      GTK_DRAWING_AREA_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure Editable :
      GTK_EDITABLE
        where type 'a class = 'a EditableClass.class
    structure EntryClass :
      GTK_ENTRY_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure EntryBuffer :
      GTK_ENTRY_BUFFER
        where type 'a class = 'a EntryBufferClass.class
    structure EntryCompletion :
      GTK_ENTRY_COMPLETION
        where type 'a class = 'a EntryCompletionClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type tree_iter_t = TreeIterRecord.t
        where type 'a cell_area_class = 'a CellAreaClass.class
        where type 'a tree_model_class = 'a TreeModelClass.class
    structure EntryIconAccessible :
      GTK_ENTRY_ICON_ACCESSIBLE
        where type 'a class = 'a EntryIconAccessibleClass.class
    structure EventController :
      GTK_EVENT_CONTROLLER
        where type 'a class = 'a EventControllerClass.class
        where type propagation_phase_t = PropagationPhase.t
        where type 'a widget_class = 'a WidgetClass.class
    structure FileChooser :
      GTK_FILE_CHOOSER
        where type 'a class = 'a FileChooserClass.class
        where type file_chooser_confirmation_t = FileChooserConfirmation.t
        where type file_chooser_action_t = FileChooserAction.t
        where type 'a file_filter_class = 'a FileFilterClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure FileChooserNativeClass :
      GTK_FILE_CHOOSER_NATIVE_CLASS
        where type 'a native_dialog_class = 'a NativeDialogClass.class
    structure FileFilter :
      GTK_FILE_FILTER
        where type 'a class = 'a FileFilterClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type file_filter_flags_t = FileFilterFlags.t
    structure FontChooser :
      GTK_FONT_CHOOSER
        where type 'a class = 'a FontChooserClass.class
    structure GLAreaClass :
      GTK_G_L_AREA_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure GestureClass :
      GTK_GESTURE_CLASS
        where type 'a event_controller_class = 'a EventControllerClass.class
    structure Gradient :
      GTK_GRADIENT
        where type t = GradientRecord.t
        where type symbolic_color_t = SymbolicColorRecord.t
        where type 'a style_properties_class = 'a StylePropertiesClass.class
        where type 'a style_context_class = 'a StyleContextClass.class
    structure HsvClass :
      GTK_HSV_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure IMContext :
      GTK_I_M_CONTEXT
        where type 'a class = 'a IMContextClass.class
        where type input_hints_t = InputHints.t
        where type input_purpose_t = InputPurpose.t
    structure IMContextSimpleClass :
      GTK_I_M_CONTEXT_SIMPLE_CLASS
        where type 'a i_m_context_class = 'a IMContextClass.class
    structure IMMulticontextClass :
      GTK_I_M_MULTICONTEXT_CLASS
        where type 'a i_m_context_class = 'a IMContextClass.class
    structure IconFactory :
      GTK_ICON_FACTORY
        where type 'a class = 'a IconFactoryClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type icon_set_t = IconSetRecord.t
    structure IconInfo :
      GTK_ICON_INFO
        where type 'a class = 'a IconInfoClass.class
        where type 'a icon_theme_class = 'a IconThemeClass.class
        where type 'a style_context_class = 'a StyleContextClass.class
        where type state_type_t = StateType.t
        where type 'a style_class = 'a StyleClass.class
    structure IconSet :
      GTK_ICON_SET
        where type t = IconSetRecord.t
        where type icon_source_t = IconSourceRecord.t
        where type 'a widget_class = 'a WidgetClass.class
        where type state_type_t = StateType.t
        where type text_direction_t = TextDirection.t
        where type 'a style_class = 'a StyleClass.class
        where type 'a style_context_class = 'a StyleContextClass.class
    structure IconSize :
      GTK_ICON_SIZE
        where type 'a settings_class = 'a SettingsClass.class
    structure IconSource :
      GTK_ICON_SOURCE
        where type t = IconSourceRecord.t
        where type text_direction_t = TextDirection.t
        where type state_type_t = StateType.t
    structure IconTheme :
      GTK_ICON_THEME
        where type 'a class = 'a IconThemeClass.class
        where type 'a icon_info_class = 'a IconInfoClass.class
        where type icon_lookup_flags_t = IconLookupFlags.t
    structure InvisibleClass :
      GTK_INVISIBLE_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure LevelBarClass :
      GTK_LEVEL_BAR_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure ListStore :
      GTK_LIST_STORE
        where type 'a class = 'a ListStoreClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a tree_drag_dest_class = 'a TreeDragDestClass.class
        where type 'a tree_drag_source_class = 'a TreeDragSourceClass.class
        where type 'a tree_model_class = 'a TreeModelClass.class
        where type 'a tree_sortable_class = 'a TreeSortableClass.class
        where type tree_iter_t = TreeIterRecord.t
    structure MiscClass :
      GTK_MISC_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure NumerableIcon :
      GTK_NUMERABLE_ICON
        where type 'a class = 'a NumerableIconClass.class
        where type 'a style_context_class = 'a StyleContextClass.class
    structure Orientable :
      GTK_ORIENTABLE
        where type 'a class = 'a OrientableClass.class
        where type orientation_t = Orientation.t
    structure PadControllerClass :
      GTK_PAD_CONTROLLER_CLASS
        where type 'a event_controller_class = 'a EventControllerClass.class
    structure PageRange :
      GTK_PAGE_RANGE
        where type t = PageRangeRecord.t
    structure PageSetup :
      GTK_PAGE_SETUP
        where type 'a class = 'a PageSetupClass.class
        where type page_orientation_t = PageOrientation.t
        where type paper_size_t = PaperSizeRecord.t
        where type unit_t = Unit.t
    structure PaperSize :
      GTK_PAPER_SIZE
        where type t = PaperSizeRecord.t
        where type unit_t = Unit.t
    structure PrintContext :
      GTK_PRINT_CONTEXT
        where type 'a class = 'a PrintContextClass.class
        where type 'a page_setup_class = 'a PageSetupClass.class
    structure PrintOperationPreview :
      GTK_PRINT_OPERATION_PREVIEW
        where type 'a class = 'a PrintOperationPreviewClass.class
        where type 'a page_setup_class = 'a PageSetupClass.class
        where type 'a print_context_class = 'a PrintContextClass.class
    structure PageRangeRecordCArrayN :
      C_ARRAY
        where type elem = PageRangeRecord.t
    structure ProgressBarClass :
      GTK_PROGRESS_BAR_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure RangeClass :
      GTK_RANGE_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure RcStyle :
      GTK_RC_STYLE
        where type 'a class = 'a RcStyleClass.class
    structure RecentActionClass :
      GTK_RECENT_ACTION_CLASS
        where type 'a action_class = 'a ActionClass.class
    structure RecentChooser :
      GTK_RECENT_CHOOSER
        where type 'a class = 'a RecentChooserClass.class
        where type recent_info_t = RecentInfoRecord.t
        where type 'a recent_filter_class = 'a RecentFilterClass.class
        where type 'a recent_manager_class = 'a RecentManagerClass.class
        where type recent_sort_type_t = RecentSortType.t
    structure RecentFilter :
      GTK_RECENT_FILTER
        where type 'a class = 'a RecentFilterClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type recent_filter_flags_t = RecentFilterFlags.t
    structure RecentInfo :
      GTK_RECENT_INFO
        where type t = RecentInfoRecord.t
    structure RecentManager :
      GTK_RECENT_MANAGER
        where type 'a class = 'a RecentManagerClass.class
        where type recent_info_t = RecentInfoRecord.t
    structure Requisition :
      GTK_REQUISITION
        where type t = RequisitionRecord.t
    structure Scrollable :
      GTK_SCROLLABLE
        where type 'a class = 'a ScrollableClass.class
        where type border_t = BorderRecord.t
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type scrollable_policy_t = ScrollablePolicy.t
    structure SelectionData :
      GTK_SELECTION_DATA
        where type t = SelectionDataRecord.t
        where type 'a text_buffer_class = 'a TextBufferClass.class
    structure SeparatorClass :
      GTK_SEPARATOR_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure SizeGroup :
      GTK_SIZE_GROUP
        where type 'a class = 'a SizeGroupClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type size_group_mode_t = SizeGroupMode.t
    structure SpinnerClass :
      GTK_SPINNER_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure Style :
      GTK_STYLE
        where type 'a class = 'a StyleClass.class
        where type icon_set_t = IconSetRecord.t
        where type 'a widget_class = 'a WidgetClass.class
        where type text_direction_t = TextDirection.t
        where type icon_source_t = IconSourceRecord.t
        where type state_type_t = StateType.t
        where type 'a style_context_class = 'a StyleContextClass.class
    structure StyleContext :
      GTK_STYLE_CONTEXT
        where type 'a class = 'a StyleContextClass.class
        where type border_t = BorderRecord.t
        where type css_section_t = CssSectionRecord.t
        where type region_flags_t = RegionFlags.t
        where type icon_set_t = IconSetRecord.t
        where type 'a style_provider_class = 'a StyleProviderClass.class
        where type junction_sides_t = JunctionSides.t
        where type widget_path_t = WidgetPathRecord.t
        where type state_flags_t = StateFlags.t
        where type state_type_t = StateType.t
        where type style_context_print_flags_t = StyleContextPrintFlags.t
        where type text_direction_t = TextDirection.t
    structure StyleProperties :
      GTK_STYLE_PROPERTIES
        where type 'a class = 'a StylePropertiesClass.class
        where type 'a style_provider_class = 'a StyleProviderClass.class
        where type symbolic_color_t = SymbolicColorRecord.t
        where type state_flags_t = StateFlags.t
    structure StyleProvider :
      GTK_STYLE_PROVIDER
        where type 'a class = 'a StyleProviderClass.class
        where type 'a icon_factory_class = 'a IconFactoryClass.class
        where type 'a style_properties_class = 'a StylePropertiesClass.class
        where type state_flags_t = StateFlags.t
        where type widget_path_t = WidgetPathRecord.t
    structure SwitchClass :
      GTK_SWITCH_CLASS
        where type 'a widget_class = 'a WidgetClass.class
    structure SymbolicColor :
      GTK_SYMBOLIC_COLOR
        where type t = SymbolicColorRecord.t
        where type 'a style_properties_class = 'a StylePropertiesClass.class
    structure TableRowCol :
      GTK_TABLE_ROW_COL
        where type t = TableRowColRecord.t
    structure TargetEntry :
      GTK_TARGET_ENTRY
        where type t = TargetEntryRecord.t
    structure TextAppearance :
      GTK_TEXT_APPEARANCE
        where type t = TextAppearanceRecord.t
    structure TextAttributes :
      GTK_TEXT_ATTRIBUTES
        where type t = TextAttributesRecord.t
    structure TextBuffer :
      GTK_TEXT_BUFFER
        where type 'a class = 'a TextBufferClass.class
        where type 'a text_child_anchor_class = 'a TextChildAnchorClass.class
        where type 'a text_mark_class = 'a TextMarkClass.class
        where type 'a clipboard_class = 'a ClipboardClass.class
        where type text_iter_t = TextIterRecord.t
        where type 'a text_tag_class = 'a TextTagClass.class
        where type target_list_t = TargetListRecord.t
        where type 'a text_tag_table_class = 'a TextTagTableClass.class
    structure TextChildAnchor :
      GTK_TEXT_CHILD_ANCHOR
        where type 'a class = 'a TextChildAnchorClass.class
    structure TextIter :
      GTK_TEXT_ITER
        where type t = TextIterRecord.t
        where type text_search_flags_t = TextSearchFlags.t
        where type text_attributes_t = TextAttributesRecord.t
        where type 'a text_buffer_class = 'a TextBufferClass.class
        where type 'a text_child_anchor_class = 'a TextChildAnchorClass.class
        where type 'a text_tag_class = 'a TextTagClass.class
    structure TextMark :
      GTK_TEXT_MARK
        where type 'a class = 'a TextMarkClass.class
        where type 'a text_buffer_class = 'a TextBufferClass.class
    structure TextTag :
      GTK_TEXT_TAG
        where type 'a class = 'a TextTagClass.class
        where type text_iter_t = TextIterRecord.t
        where type text_direction_t = TextDirection.t
        where type justification_t = Justification.t
        where type wrap_mode_t = WrapMode.t
    structure TextTagTable :
      GTK_TEXT_TAG_TABLE
        where type 'a class = 'a TextTagTableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a text_tag_class = 'a TextTagClass.class
    structure ThemingEngine :
      GTK_THEMING_ENGINE
        where type 'a class = 'a ThemingEngineClass.class
        where type text_direction_t = TextDirection.t
        where type junction_sides_t = JunctionSides.t
        where type border_t = BorderRecord.t
        where type widget_path_t = WidgetPathRecord.t
        where type state_flags_t = StateFlags.t
        where type region_flags_t = RegionFlags.t
        where type state_type_t = StateType.t
    structure ToggleActionClass :
      GTK_TOGGLE_ACTION_CLASS
        where type 'a action_class = 'a ActionClass.class
    structure ToolShell :
      GTK_TOOL_SHELL
        where type 'a class = 'a ToolShellClass.class
        where type relief_style_t = ReliefStyle.t
        where type toolbar_style_t = ToolbarStyle.t
        where type orientation_t = Orientation.t
        where type 'a size_group_class = 'a SizeGroupClass.class
    structure Tooltip :
      GTK_TOOLTIP
        where type 'a class = 'a TooltipClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure ToplevelAccessible :
      GTK_TOPLEVEL_ACCESSIBLE
        where type 'a class = 'a ToplevelAccessibleClass.class
    structure TreeDragDest :
      GTK_TREE_DRAG_DEST
        where type 'a class = 'a TreeDragDestClass.class
        where type selection_data_t = SelectionDataRecord.t
        where type tree_path_t = TreePathRecord.t
    structure TreeDragSource :
      GTK_TREE_DRAG_SOURCE
        where type 'a class = 'a TreeDragSourceClass.class
        where type tree_path_t = TreePathRecord.t
    structure TreeIter :
      GTK_TREE_ITER
        where type t = TreeIterRecord.t
    structure TreeModel :
      GTK_TREE_MODEL
        where type 'a class = 'a TreeModelClass.class
        where type tree_model_flags_t = TreeModelFlags.t
        where type tree_iter_t = TreeIterRecord.t
        where type tree_path_t = TreePathRecord.t
    structure TreeModelFilter :
      GTK_TREE_MODEL_FILTER
        where type 'a class = 'a TreeModelFilterClass.class
        where type 'a tree_drag_source_class = 'a TreeDragSourceClass.class
        where type tree_iter_t = TreeIterRecord.t
        where type 'a tree_model_class = 'a TreeModelClass.class
        where type tree_path_t = TreePathRecord.t
    structure TreeModelSort :
      GTK_TREE_MODEL_SORT
        where type 'a class = 'a TreeModelSortClass.class
        where type 'a tree_drag_source_class = 'a TreeDragSourceClass.class
        where type 'a tree_sortable_class = 'a TreeSortableClass.class
        where type tree_path_t = TreePathRecord.t
        where type tree_iter_t = TreeIterRecord.t
        where type 'a tree_model_class = 'a TreeModelClass.class
    structure TreePath :
      GTK_TREE_PATH
        where type t = TreePathRecord.t
    structure TreeRowReference :
      GTK_TREE_ROW_REFERENCE
        where type t = TreeRowReferenceRecord.t
        where type 'a tree_model_class = 'a TreeModelClass.class
        where type tree_path_t = TreePathRecord.t
    structure TreeSortable :
      GTK_TREE_SORTABLE
        where type 'a class = 'a TreeSortableClass.class
        where type sort_type_t = SortType.t
    structure TreeStore :
      GTK_TREE_STORE
        where type 'a class = 'a TreeStoreClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a tree_drag_dest_class = 'a TreeDragDestClass.class
        where type 'a tree_drag_source_class = 'a TreeDragSourceClass.class
        where type 'a tree_model_class = 'a TreeModelClass.class
        where type 'a tree_sortable_class = 'a TreeSortableClass.class
        where type tree_iter_t = TreeIterRecord.t
    structure TreeViewColumn :
      GTK_TREE_VIEW_COLUMN
        where type 'a class = 'a TreeViewColumnClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
        where type tree_iter_t = TreeIterRecord.t
        where type 'a tree_model_class = 'a TreeModelClass.class
        where type 'a cell_renderer_class = 'a CellRendererClass.class
        where type 'a cell_area_class = 'a CellAreaClass.class
        where type tree_view_column_sizing_t = TreeViewColumnSizing.t
        where type sort_type_t = SortType.t
        where type 'a widget_class = 'a WidgetClass.class
    structure UIManager :
      GTK_U_I_MANAGER
        where type 'a class = 'a UIManagerClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type u_i_manager_item_type_t = UIManagerItemType.t
        where type 'a accel_group_class = 'a AccelGroupClass.class
        where type 'a action_group_class = 'a ActionGroupClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a action_class = 'a ActionClass.class
    structure WidgetAccessibleClass :
      GTK_WIDGET_ACCESSIBLE_CLASS
        where type 'a accessible_class = 'a AccessibleClass.class
    structure WidgetPath :
      GTK_WIDGET_PATH
        where type t = WidgetPathRecord.t
        where type 'a widget_class = 'a WidgetClass.class
        where type region_flags_t = RegionFlags.t
        where type state_flags_t = StateFlags.t
    structure TargetEntryRecordCArrayN :
      C_ARRAY
        where type elem = TargetEntryRecord.t
    structure ArrowClass :
      GTK_ARROW_CLASS
        where type 'a misc_class = 'a MiscClass.class
    structure ArrowAccessibleClass :
      GTK_ARROW_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure BinClass :
      GTK_BIN_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure BoxClass :
      GTK_BOX_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure Calendar :
      GTK_CALENDAR
        where type 'a class = 'a CalendarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type calendar_display_options_t = CalendarDisplayOptions.t
    structure CellAccessible :
      GTK_CELL_ACCESSIBLE
        where type 'a class = 'a CellAccessibleClass.class
    structure CellAccessibleParent :
      GTK_CELL_ACCESSIBLE_PARENT
        where type 'a class = 'a CellAccessibleParentClass.class
        where type cell_renderer_state_t = CellRendererState.t
        where type 'a cell_accessible_class = 'a CellAccessibleClass.class
    structure CellAreaBox :
      GTK_CELL_AREA_BOX
        where type 'a class = 'a CellAreaBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure CellRendererAccelClass :
      GTK_CELL_RENDERER_ACCEL_CLASS
        where type 'a cell_renderer_text_class = 'a CellRendererTextClass.class
    structure CellRendererComboClass :
      GTK_CELL_RENDERER_COMBO_CLASS
        where type 'a cell_renderer_text_class = 'a CellRendererTextClass.class
    structure CellRendererPixbuf :
      GTK_CELL_RENDERER_PIXBUF
        where type 'a class = 'a CellRendererPixbufClass.class
    structure CellRendererProgress :
      GTK_CELL_RENDERER_PROGRESS
        where type 'a class = 'a CellRendererProgressClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure CellRendererSpinClass :
      GTK_CELL_RENDERER_SPIN_CLASS
        where type 'a cell_renderer_text_class = 'a CellRendererTextClass.class
    structure CellRendererSpinner :
      GTK_CELL_RENDERER_SPINNER
        where type 'a class = 'a CellRendererSpinnerClass.class
        where type icon_size_t = IconSize.t
    structure CellRendererText :
      GTK_CELL_RENDERER_TEXT
        where type 'a class = 'a CellRendererTextClass.class
    structure CellRendererToggle :
      GTK_CELL_RENDERER_TOGGLE
        where type 'a class = 'a CellRendererToggleClass.class
    structure CellView :
      GTK_CELL_VIEW
        where type 'a class = 'a CellViewClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type requisition_t = RequisitionRecord.t
        where type tree_path_t = TreePathRecord.t
        where type 'a cell_area_class = 'a CellAreaClass.class
        where type 'a cell_area_context_class = 'a CellAreaContextClass.class
        where type 'a tree_model_class = 'a TreeModelClass.class
    structure Clipboard :
      GTK_CLIPBOARD
        where type 'a class = 'a ClipboardClass.class
        where type target_entry_record_c_array_n_t = TargetEntryRecordCArrayN.t
        where type selection_data_t = SelectionDataRecord.t
        where type 'a text_buffer_class = 'a TextBufferClass.class
    structure Container :
      GTK_CONTAINER
        where type 'a class = 'a ContainerClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type widget_path_t = WidgetPathRecord.t
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type resize_mode_t = ResizeMode.t
    structure ContainerAccessibleClass :
      GTK_CONTAINER_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure ContainerCellAccessibleClass :
      GTK_CONTAINER_CELL_ACCESSIBLE_CLASS
        where type 'a cell_accessible_class = 'a CellAccessibleClass.class
    structure DrawingArea :
      GTK_DRAWING_AREA
        where type 'a class = 'a DrawingAreaClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure Entry :
      GTK_ENTRY
        where type 'a class = 'a EntryClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_editable_class = 'a CellEditableClass.class
        where type 'a editable_class = 'a EditableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type target_list_t = TargetListRecord.t
        where type delete_type_t = DeleteType.t
        where type entry_icon_position_t = EntryIconPosition.t
        where type movement_step_t = MovementStep.t
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a entry_buffer_class = 'a EntryBufferClass.class
        where type 'a entry_completion_class = 'a EntryCompletionClass.class
        where type border_t = BorderRecord.t
        where type input_hints_t = InputHints.t
        where type input_purpose_t = InputPurpose.t
        where type image_type_t = ImageType.t
        where type shadow_type_t = ShadowType.t
    structure EntryAccessibleClass :
      GTK_ENTRY_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure FixedClass :
      GTK_FIXED_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure FlowBoxClass :
      GTK_FLOW_BOX_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure GLArea :
      GTK_G_L_AREA
        where type 'a class = 'a GLAreaClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure Gesture :
      GTK_GESTURE
        where type 'a class = 'a GestureClass.class
        where type event_sequence_state_t = EventSequenceState.t
    structure GestureRotateClass :
      GTK_GESTURE_ROTATE_CLASS
        where type 'a gesture_class = 'a GestureClass.class
    structure GestureSingleClass :
      GTK_GESTURE_SINGLE_CLASS
        where type 'a gesture_class = 'a GestureClass.class
    structure GestureZoomClass :
      GTK_GESTURE_ZOOM_CLASS
        where type 'a gesture_class = 'a GestureClass.class
    structure GridClass :
      GTK_GRID_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure Hsv :
      GTK_HSV
        where type 'a class = 'a HsvClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type direction_type_t = DirectionType.t
    structure HSeparatorClass :
      GTK_H_SEPARATOR_CLASS
        where type 'a separator_class = 'a SeparatorClass.class
    structure HeaderBarClass :
      GTK_HEADER_BAR_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure IMContextSimple :
      GTK_I_M_CONTEXT_SIMPLE
        where type 'a class = 'a IMContextSimpleClass.class
    structure IconViewClass :
      GTK_ICON_VIEW_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure ImageClass :
      GTK_IMAGE_CLASS
        where type 'a misc_class = 'a MiscClass.class
    structure ImageAccessibleClass :
      GTK_IMAGE_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure Invisible :
      GTK_INVISIBLE
        where type 'a class = 'a InvisibleClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure LabelClass :
      GTK_LABEL_CLASS
        where type 'a misc_class = 'a MiscClass.class
    structure LabelAccessibleClass :
      GTK_LABEL_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure LayoutClass :
      GTK_LAYOUT_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure LevelBar :
      GTK_LEVEL_BAR
        where type 'a class = 'a LevelBarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type level_bar_mode_t = LevelBarMode.t
    structure LevelBarAccessibleClass :
      GTK_LEVEL_BAR_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure ListBoxClass :
      GTK_LIST_BOX_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure MenuShellClass :
      GTK_MENU_SHELL_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure Misc :
      GTK_MISC
        where type 'a class = 'a MiscClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure NotebookClass :
      GTK_NOTEBOOK_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure PanedClass :
      GTK_PANED_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure PrintSettings :
      GTK_PRINT_SETTINGS
        where type 'a class = 'a PrintSettingsClass.class
        where type print_duplex_t = PrintDuplex.t
        where type number_up_layout_t = NumberUpLayout.t
        where type page_orientation_t = PageOrientation.t
        where type page_range_record_c_array_n_t = PageRangeRecordCArrayN.t
        where type page_set_t = PageSet.t
        where type paper_size_t = PaperSizeRecord.t
        where type unit_t = Unit.t
        where type print_pages_t = PrintPages.t
        where type print_quality_t = PrintQuality.t
    structure ProgressBar :
      GTK_PROGRESS_BAR
        where type 'a class = 'a ProgressBarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure ProgressBarAccessibleClass :
      GTK_PROGRESS_BAR_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure RadioActionClass :
      GTK_RADIO_ACTION_CLASS
        where type 'a toggle_action_class = 'a ToggleActionClass.class
    structure Range :
      GTK_RANGE
        where type 'a class = 'a RangeClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type scroll_type_t = ScrollType.t
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type sensitivity_type_t = SensitivityType.t
    structure RangeAccessibleClass :
      GTK_RANGE_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure RecentAction :
      GTK_RECENT_ACTION
        where type 'a class = 'a RecentActionClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a recent_chooser_class = 'a RecentChooserClass.class
        where type 'a recent_manager_class = 'a RecentManagerClass.class
    structure RendererCellAccessibleClass :
      GTK_RENDERER_CELL_ACCESSIBLE_CLASS
        where type 'a cell_accessible_class = 'a CellAccessibleClass.class
    structure ScaleClass :
      GTK_SCALE_CLASS
        where type 'a range_class = 'a RangeClass.class
    structure ScrollbarClass :
      GTK_SCROLLBAR_CLASS
        where type 'a range_class = 'a RangeClass.class
    structure SearchEntryClass :
      GTK_SEARCH_ENTRY_CLASS
        where type 'a entry_class = 'a EntryClass.class
    structure Separator :
      GTK_SEPARATOR
        where type 'a class = 'a SeparatorClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type orientation_t = Orientation.t
    structure Settings :
      GTK_SETTINGS
        where type 'a class = 'a SettingsClass.class
        where type 'a style_provider_class = 'a StyleProviderClass.class
        where type i_m_preedit_style_t = IMPreeditStyle.t
        where type i_m_status_style_t = IMStatusStyle.t
        where type corner_type_t = CornerType.t
        where type icon_size_t = IconSize.t
        where type toolbar_style_t = ToolbarStyle.t
        where type policy_type_t = PolicyType.t
    structure SocketClass :
      GTK_SOCKET_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure SpinButtonClass :
      GTK_SPIN_BUTTON_CLASS
        where type 'a entry_class = 'a EntryClass.class
    structure Spinner :
      GTK_SPINNER
        where type 'a class = 'a SpinnerClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure SpinnerAccessibleClass :
      GTK_SPINNER_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure StackClass :
      GTK_STACK_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure Switch :
      GTK_SWITCH
        where type 'a class = 'a SwitchClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure SwitchAccessibleClass :
      GTK_SWITCH_ACCESSIBLE_CLASS
        where type 'a widget_accessible_class = 'a WidgetAccessibleClass.class
    structure TableClass :
      GTK_TABLE_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure TargetList :
      GTK_TARGET_LIST
        where type t = TargetListRecord.t
        where type 'a text_buffer_class = 'a TextBufferClass.class
        where type target_entry_record_c_array_n_t = TargetEntryRecordCArrayN.t
    structure TextViewClass :
      GTK_TEXT_VIEW_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure ToggleAction :
      GTK_TOGGLE_ACTION
        where type 'a class = 'a ToggleActionClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure ToolItemGroupClass :
      GTK_TOOL_ITEM_GROUP_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure ToolPaletteClass :
      GTK_TOOL_PALETTE_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure ToolbarClass :
      GTK_TOOLBAR_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure TreeViewClass :
      GTK_TREE_VIEW_CLASS
        where type 'a container_class = 'a ContainerClass.class
    structure VSeparatorClass :
      GTK_V_SEPARATOR_CLASS
        where type 'a separator_class = 'a SeparatorClass.class
    structure WidgetAccessible :
      GTK_WIDGET_ACCESSIBLE
        where type 'a class = 'a WidgetAccessibleClass.class
    structure AccelLabelClass :
      GTK_ACCEL_LABEL_CLASS
        where type 'a label_class = 'a LabelClass.class
    structure ActionBarClass :
      GTK_ACTION_BAR_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure AlignmentClass :
      GTK_ALIGNMENT_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure AppChooserWidgetClass :
      GTK_APP_CHOOSER_WIDGET_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure Arrow :
      GTK_ARROW
        where type 'a class = 'a ArrowClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type arrow_type_t = ArrowType.t
        where type shadow_type_t = ShadowType.t
    structure ArrowAccessible :
      GTK_ARROW_ACCESSIBLE
        where type 'a class = 'a ArrowAccessibleClass.class
    structure Bin :
      GTK_BIN
        where type 'a class = 'a BinClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure BooleanCellAccessibleClass :
      GTK_BOOLEAN_CELL_ACCESSIBLE_CLASS
        where type 'a renderer_cell_accessible_class = 'a RendererCellAccessibleClass.class
    structure Box :
      GTK_BOX
        where type 'a class = 'a BoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type orientation_t = Orientation.t
        where type pack_type_t = PackType.t
        where type 'a widget_class = 'a WidgetClass.class
        where type baseline_position_t = BaselinePosition.t
    structure ButtonClass :
      GTK_BUTTON_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure ButtonAccessibleClass :
      GTK_BUTTON_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure ButtonBoxClass :
      GTK_BUTTON_BOX_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure CellRendererAccel :
      GTK_CELL_RENDERER_ACCEL
        where type 'a class = 'a CellRendererAccelClass.class
        where type cell_renderer_accel_mode_t = CellRendererAccelMode.t
    structure CellRendererCombo :
      GTK_CELL_RENDERER_COMBO
        where type 'a class = 'a CellRendererComboClass.class
        where type tree_iter_t = TreeIterRecord.t
        where type 'a tree_model_class = 'a TreeModelClass.class
    structure CellRendererSpin :
      GTK_CELL_RENDERER_SPIN
        where type 'a class = 'a CellRendererSpinClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
    structure ColorChooserWidgetClass :
      GTK_COLOR_CHOOSER_WIDGET_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure ColorSelectionClass :
      GTK_COLOR_SELECTION_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure ComboBoxClass :
      GTK_COMBO_BOX_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure ComboBoxAccessibleClass :
      GTK_COMBO_BOX_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure ContainerAccessible :
      GTK_CONTAINER_ACCESSIBLE
        where type 'a class = 'a ContainerAccessibleClass.class
    structure ContainerCellAccessible :
      GTK_CONTAINER_CELL_ACCESSIBLE
        where type 'a class = 'a ContainerCellAccessibleClass.class
        where type 'a cell_accessible_class = 'a CellAccessibleClass.class
    structure EntryAccessible :
      GTK_ENTRY_ACCESSIBLE
        where type 'a class = 'a EntryAccessibleClass.class
    structure EventBoxClass :
      GTK_EVENT_BOX_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure ExpanderClass :
      GTK_EXPANDER_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure ExpanderAccessibleClass :
      GTK_EXPANDER_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure FileChooserButtonClass :
      GTK_FILE_CHOOSER_BUTTON_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure FileChooserWidgetClass :
      GTK_FILE_CHOOSER_WIDGET_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure Fixed :
      GTK_FIXED
        where type 'a class = 'a FixedClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure FlowBoxAccessibleClass :
      GTK_FLOW_BOX_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure FlowBoxChildClass :
      GTK_FLOW_BOX_CHILD_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure FlowBoxChildAccessibleClass :
      GTK_FLOW_BOX_CHILD_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure FontChooserWidgetClass :
      GTK_FONT_CHOOSER_WIDGET_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure FontSelectionClass :
      GTK_FONT_SELECTION_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure FrameClass :
      GTK_FRAME_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure FrameAccessibleClass :
      GTK_FRAME_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure GestureDragClass :
      GTK_GESTURE_DRAG_CLASS
        where type 'a gesture_single_class = 'a GestureSingleClass.class
    structure GestureLongPressClass :
      GTK_GESTURE_LONG_PRESS_CLASS
        where type 'a gesture_single_class = 'a GestureSingleClass.class
    structure GestureMultiPressClass :
      GTK_GESTURE_MULTI_PRESS_CLASS
        where type 'a gesture_single_class = 'a GestureSingleClass.class
    structure GestureRotate :
      GTK_GESTURE_ROTATE
        where type 'a class = 'a GestureRotateClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure GestureSingle :
      GTK_GESTURE_SINGLE
        where type 'a class = 'a GestureSingleClass.class
    structure GestureSwipeClass :
      GTK_GESTURE_SWIPE_CLASS
        where type 'a gesture_single_class = 'a GestureSingleClass.class
    structure GestureZoom :
      GTK_GESTURE_ZOOM
        where type 'a class = 'a GestureZoomClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure Grid :
      GTK_GRID
        where type 'a class = 'a GridClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type position_type_t = PositionType.t
        where type 'a widget_class = 'a WidgetClass.class
        where type baseline_position_t = BaselinePosition.t
    structure HBoxClass :
      GTK_H_BOX_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure HPanedClass :
      GTK_H_PANED_CLASS
        where type 'a paned_class = 'a PanedClass.class
    structure HScaleClass :
      GTK_H_SCALE_CLASS
        where type 'a scale_class = 'a ScaleClass.class
    structure HScrollbarClass :
      GTK_H_SCROLLBAR_CLASS
        where type 'a scrollbar_class = 'a ScrollbarClass.class
    structure HSeparator :
      GTK_H_SEPARATOR
        where type 'a class = 'a HSeparatorClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure HandleBoxClass :
      GTK_HANDLE_BOX_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure HeaderBar :
      GTK_HEADER_BAR
        where type 'a class = 'a HeaderBarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure IMMulticontext :
      GTK_I_M_MULTICONTEXT
        where type 'a class = 'a IMMulticontextClass.class
        where type 'a menu_shell_class = 'a MenuShellClass.class
    structure IconView :
      GTK_ICON_VIEW
        where type 'a class = 'a IconViewClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
        where type 'a scrollable_class = 'a ScrollableClass.class
        where type target_entry_record_c_array_n_t = TargetEntryRecordCArrayN.t
        where type tree_iter_t = TreeIterRecord.t
        where type icon_view_drop_position_t = IconViewDropPosition.t
        where type 'a cell_renderer_class = 'a CellRendererClass.class
        where type 'a tooltip_class = 'a TooltipClass.class
        where type tree_path_t = TreePathRecord.t
        where type movement_step_t = MovementStep.t
        where type 'a cell_area_class = 'a CellAreaClass.class
        where type orientation_t = Orientation.t
        where type 'a tree_model_class = 'a TreeModelClass.class
        where type selection_mode_t = SelectionMode.t
    structure IconViewAccessibleClass :
      GTK_ICON_VIEW_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure Image :
      GTK_IMAGE
        where type 'a class = 'a ImageClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type icon_set_t = IconSetRecord.t
        where type image_type_t = ImageType.t
    structure ImageAccessible :
      GTK_IMAGE_ACCESSIBLE
        where type 'a class = 'a ImageAccessibleClass.class
    structure ImageCellAccessibleClass :
      GTK_IMAGE_CELL_ACCESSIBLE_CLASS
        where type 'a renderer_cell_accessible_class = 'a RendererCellAccessibleClass.class
    structure InfoBarClass :
      GTK_INFO_BAR_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure LabelAccessible :
      GTK_LABEL_ACCESSIBLE
        where type 'a class = 'a LabelAccessibleClass.class
    structure Layout :
      GTK_LAYOUT
        where type 'a class = 'a LayoutClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a scrollable_class = 'a ScrollableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
    structure LevelBarAccessible :
      GTK_LEVEL_BAR_ACCESSIBLE
        where type 'a class = 'a LevelBarAccessibleClass.class
    structure ListBoxAccessibleClass :
      GTK_LIST_BOX_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure ListBoxRowClass :
      GTK_LIST_BOX_ROW_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure ListBoxRowAccessibleClass :
      GTK_LIST_BOX_ROW_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure MenuClass :
      GTK_MENU_CLASS
        where type 'a menu_shell_class = 'a MenuShellClass.class
    structure MenuBarClass :
      GTK_MENU_BAR_CLASS
        where type 'a menu_shell_class = 'a MenuShellClass.class
    structure MenuItemClass :
      GTK_MENU_ITEM_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure MenuItemAccessibleClass :
      GTK_MENU_ITEM_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure MenuShellAccessibleClass :
      GTK_MENU_SHELL_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure Notebook :
      GTK_NOTEBOOK
        where type 'a class = 'a NotebookClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type pack_type_t = PackType.t
        where type notebook_tab_t = NotebookTab.t
        where type direction_type_t = DirectionType.t
        where type 'a widget_class = 'a WidgetClass.class
        where type position_type_t = PositionType.t
    structure NotebookAccessibleClass :
      GTK_NOTEBOOK_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure OverlayClass :
      GTK_OVERLAY_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure Paned :
      GTK_PANED
        where type 'a class = 'a PanedClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type orientation_t = Orientation.t
        where type 'a widget_class = 'a WidgetClass.class
        where type scroll_type_t = ScrollType.t
    structure PanedAccessibleClass :
      GTK_PANED_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure PopoverClass :
      GTK_POPOVER_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure PopoverAccessibleClass :
      GTK_POPOVER_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure ProgressBarAccessible :
      GTK_PROGRESS_BAR_ACCESSIBLE
        where type 'a class = 'a ProgressBarAccessibleClass.class
    structure RadioAction :
      GTK_RADIO_ACTION
        where type 'a class = 'a RadioActionClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure RangeAccessible :
      GTK_RANGE_ACCESSIBLE
        where type 'a class = 'a RangeAccessibleClass.class
    structure RecentChooserWidgetClass :
      GTK_RECENT_CHOOSER_WIDGET_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure RendererCellAccessible :
      GTK_RENDERER_CELL_ACCESSIBLE
        where type 'a class = 'a RendererCellAccessibleClass.class
        where type 'a cell_renderer_class = 'a CellRendererClass.class
    structure RevealerClass :
      GTK_REVEALER_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure Scale :
      GTK_SCALE
        where type 'a class = 'a ScaleClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type orientation_t = Orientation.t
        where type position_type_t = PositionType.t
    structure ScaleAccessibleClass :
      GTK_SCALE_ACCESSIBLE_CLASS
        where type 'a range_accessible_class = 'a RangeAccessibleClass.class
    structure Scrollbar :
      GTK_SCROLLBAR
        where type 'a class = 'a ScrollbarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type orientation_t = Orientation.t
    structure ScrolledWindowClass :
      GTK_SCROLLED_WINDOW_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure ScrolledWindowAccessibleClass :
      GTK_SCROLLED_WINDOW_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure SearchBarClass :
      GTK_SEARCH_BAR_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure SearchEntry :
      GTK_SEARCH_ENTRY
        where type 'a class = 'a SearchEntryClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_editable_class = 'a CellEditableClass.class
        where type 'a editable_class = 'a EditableClass.class
    structure ShortcutLabelClass :
      GTK_SHORTCUT_LABEL_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure ShortcutsGroupClass :
      GTK_SHORTCUTS_GROUP_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure ShortcutsSectionClass :
      GTK_SHORTCUTS_SECTION_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure ShortcutsShortcutClass :
      GTK_SHORTCUTS_SHORTCUT_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure Socket :
      GTK_SOCKET
        where type 'a class = 'a SocketClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure SpinButton :
      GTK_SPIN_BUTTON
        where type 'a class = 'a SpinButtonClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_editable_class = 'a CellEditableClass.class
        where type 'a editable_class = 'a EditableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type spin_type_t = SpinType.t
        where type scroll_type_t = ScrollType.t
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type spin_button_update_policy_t = SpinButtonUpdatePolicy.t
    structure SpinButtonAccessibleClass :
      GTK_SPIN_BUTTON_ACCESSIBLE_CLASS
        where type 'a entry_accessible_class = 'a EntryAccessibleClass.class
    structure SpinnerAccessible :
      GTK_SPINNER_ACCESSIBLE
        where type 'a class = 'a SpinnerAccessibleClass.class
    structure Stack :
      GTK_STACK
        where type 'a class = 'a StackClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type stack_transition_type_t = StackTransitionType.t
        where type 'a widget_class = 'a WidgetClass.class
    structure StackAccessibleClass :
      GTK_STACK_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure StackSidebarClass :
      GTK_STACK_SIDEBAR_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure StackSwitcherClass :
      GTK_STACK_SWITCHER_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure StatusbarClass :
      GTK_STATUSBAR_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure StatusbarAccessibleClass :
      GTK_STATUSBAR_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure SwitchAccessible :
      GTK_SWITCH_ACCESSIBLE
        where type 'a class = 'a SwitchAccessibleClass.class
    structure Table :
      GTK_TABLE
        where type 'a class = 'a TableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type attach_options_t = AttachOptions.t
        where type 'a widget_class = 'a WidgetClass.class
    structure TextCellAccessibleClass :
      GTK_TEXT_CELL_ACCESSIBLE_CLASS
        where type 'a renderer_cell_accessible_class = 'a RendererCellAccessibleClass.class
    structure TextView :
      GTK_TEXT_VIEW
        where type 'a class = 'a TextViewClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a scrollable_class = 'a ScrollableClass.class
        where type 'a text_child_anchor_class = 'a TextChildAnchorClass.class
        where type text_attributes_t = TextAttributesRecord.t
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type 'a text_mark_class = 'a TextMarkClass.class
        where type text_window_type_t = TextWindowType.t
        where type delete_type_t = DeleteType.t
        where type text_iter_t = TextIterRecord.t
        where type text_extend_selection_t = TextExtendSelection.t
        where type movement_step_t = MovementStep.t
        where type scroll_step_t = ScrollStep.t
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a text_buffer_class = 'a TextBufferClass.class
        where type input_hints_t = InputHints.t
        where type input_purpose_t = InputPurpose.t
        where type justification_t = Justification.t
        where type wrap_mode_t = WrapMode.t
    structure TextViewAccessibleClass :
      GTK_TEXT_VIEW_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure ToolItemClass :
      GTK_TOOL_ITEM_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure TreeSelection :
      GTK_TREE_SELECTION
        where type 'a class = 'a TreeSelectionClass.class
        where type 'a tree_model_class = 'a TreeModelClass.class
        where type 'a tree_view_class = 'a TreeViewClass.class
        where type tree_iter_t = TreeIterRecord.t
        where type tree_path_t = TreePathRecord.t
        where type selection_mode_t = SelectionMode.t
    structure TreeView :
      GTK_TREE_VIEW
        where type 'a class = 'a TreeViewClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a scrollable_class = 'a ScrollableClass.class
        where type target_entry_record_c_array_n_t = TargetEntryRecordCArrayN.t
        where type 'a tree_selection_class = 'a TreeSelectionClass.class
        where type tree_view_drop_position_t = TreeViewDropPosition.t
        where type 'a entry_class = 'a EntryClass.class
        where type 'a cell_renderer_class = 'a CellRendererClass.class
        where type 'a tooltip_class = 'a TooltipClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type movement_step_t = MovementStep.t
        where type tree_path_t = TreePathRecord.t
        where type tree_iter_t = TreeIterRecord.t
        where type tree_view_grid_lines_t = TreeViewGridLines.t
        where type 'a tree_view_column_class = 'a TreeViewColumnClass.class
        where type 'a tree_model_class = 'a TreeModelClass.class
    structure TreeViewAccessibleClass :
      GTK_TREE_VIEW_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure VBoxClass :
      GTK_V_BOX_CLASS
        where type 'a box_class = 'a BoxClass.class
    structure VPanedClass :
      GTK_V_PANED_CLASS
        where type 'a paned_class = 'a PanedClass.class
    structure VScaleClass :
      GTK_V_SCALE_CLASS
        where type 'a scale_class = 'a ScaleClass.class
    structure VScrollbarClass :
      GTK_V_SCROLLBAR_CLASS
        where type 'a scrollbar_class = 'a ScrollbarClass.class
    structure VSeparator :
      GTK_V_SEPARATOR
        where type 'a class = 'a VSeparatorClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure ViewportClass :
      GTK_VIEWPORT_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure WindowClass :
      GTK_WINDOW_CLASS
        where type 'a bin_class = 'a BinClass.class
    structure WindowAccessibleClass :
      GTK_WINDOW_ACCESSIBLE_CLASS
        where type 'a container_accessible_class = 'a ContainerAccessibleClass.class
    structure AccelLabel :
      GTK_ACCEL_LABEL
        where type 'a class = 'a AccelLabelClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure ActionBar :
      GTK_ACTION_BAR
        where type 'a class = 'a ActionBarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure Alignment :
      GTK_ALIGNMENT
        where type 'a class = 'a AlignmentClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure AppChooserButtonClass :
      GTK_APP_CHOOSER_BUTTON_CLASS
        where type 'a combo_box_class = 'a ComboBoxClass.class
    structure AppChooserWidget :
      GTK_APP_CHOOSER_WIDGET
        where type 'a class = 'a AppChooserWidgetClass.class
        where type 'a app_chooser_class = 'a AppChooserClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a menu_class = 'a MenuClass.class
    structure Application :
      GTK_APPLICATION
        where type 'a class = 'a ApplicationClass.class
        where type application_inhibit_flags_t = ApplicationInhibitFlags.t
        where type 'a window_class = 'a WindowClass.class
    structure ApplicationWindowClass :
      GTK_APPLICATION_WINDOW_CLASS
        where type 'a window_class = 'a WindowClass.class
    structure AspectFrameClass :
      GTK_ASPECT_FRAME_CLASS
        where type 'a frame_class = 'a FrameClass.class
    structure AssistantClass :
      GTK_ASSISTANT_CLASS
        where type 'a window_class = 'a WindowClass.class
    structure BooleanCellAccessible :
      GTK_BOOLEAN_CELL_ACCESSIBLE
        where type 'a class = 'a BooleanCellAccessibleClass.class
    structure Button :
      GTK_BUTTON
        where type 'a class = 'a ButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type position_type_t = PositionType.t
        where type relief_style_t = ReliefStyle.t
    structure ButtonAccessible :
      GTK_BUTTON_ACCESSIBLE
        where type 'a class = 'a ButtonAccessibleClass.class
    structure ButtonBox :
      GTK_BUTTON_BOX
        where type 'a class = 'a ButtonBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type orientation_t = Orientation.t
        where type 'a widget_class = 'a WidgetClass.class
        where type button_box_style_t = ButtonBoxStyle.t
    structure CheckMenuItemClass :
      GTK_CHECK_MENU_ITEM_CLASS
        where type 'a menu_item_class = 'a MenuItemClass.class
    structure CheckMenuItemAccessibleClass :
      GTK_CHECK_MENU_ITEM_ACCESSIBLE_CLASS
        where type 'a menu_item_accessible_class = 'a MenuItemAccessibleClass.class
    structure ColorButtonClass :
      GTK_COLOR_BUTTON_CLASS
        where type 'a button_class = 'a ButtonClass.class
    structure ColorChooserWidget :
      GTK_COLOR_CHOOSER_WIDGET
        where type 'a class = 'a ColorChooserWidgetClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a color_chooser_class = 'a ColorChooserClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure ColorSelection :
      GTK_COLOR_SELECTION
        where type 'a class = 'a ColorSelectionClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure ComboBox :
      GTK_COMBO_BOX
        where type 'a class = 'a ComboBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_editable_class = 'a CellEditableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
        where type tree_iter_t = TreeIterRecord.t
        where type scroll_type_t = ScrollType.t
        where type sensitivity_type_t = SensitivityType.t
        where type 'a cell_area_class = 'a CellAreaClass.class
        where type 'a tree_model_class = 'a TreeModelClass.class
    structure ComboBoxAccessible :
      GTK_COMBO_BOX_ACCESSIBLE
        where type 'a class = 'a ComboBoxAccessibleClass.class
    structure ComboBoxTextClass :
      GTK_COMBO_BOX_TEXT_CLASS
        where type 'a combo_box_class = 'a ComboBoxClass.class
    structure DialogClass :
      GTK_DIALOG_CLASS
        where type 'a window_class = 'a WindowClass.class
    structure EventBox :
      GTK_EVENT_BOX
        where type 'a class = 'a EventBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure Expander :
      GTK_EXPANDER
        where type 'a class = 'a ExpanderClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure ExpanderAccessible :
      GTK_EXPANDER_ACCESSIBLE
        where type 'a class = 'a ExpanderAccessibleClass.class
    structure FileChooserNative :
      GTK_FILE_CHOOSER_NATIVE
        where type 'a class = 'a FileChooserNativeClass.class
        where type 'a file_chooser_class = 'a FileChooserClass.class
        where type file_chooser_action_t = FileChooserAction.t
        where type 'a window_class = 'a WindowClass.class
    structure FileChooserWidget :
      GTK_FILE_CHOOSER_WIDGET
        where type 'a class = 'a FileChooserWidgetClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a file_chooser_class = 'a FileChooserClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type file_chooser_action_t = FileChooserAction.t
    structure FlowBox :
      GTK_FLOW_BOX
        where type 'a class = 'a FlowBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type 'a flow_box_child_class = 'a FlowBoxChildClass.class
        where type movement_step_t = MovementStep.t
        where type selection_mode_t = SelectionMode.t
    structure FlowBoxAccessible :
      GTK_FLOW_BOX_ACCESSIBLE
        where type 'a class = 'a FlowBoxAccessibleClass.class
    structure FlowBoxChild :
      GTK_FLOW_BOX_CHILD
        where type 'a class = 'a FlowBoxChildClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure FlowBoxChildAccessible :
      GTK_FLOW_BOX_CHILD_ACCESSIBLE
        where type 'a class = 'a FlowBoxChildAccessibleClass.class
    structure FontButtonClass :
      GTK_FONT_BUTTON_CLASS
        where type 'a button_class = 'a ButtonClass.class
    structure FontChooserWidget :
      GTK_FONT_CHOOSER_WIDGET
        where type 'a class = 'a FontChooserWidgetClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a font_chooser_class = 'a FontChooserClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure FontSelection :
      GTK_FONT_SELECTION
        where type 'a class = 'a FontSelectionClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure Frame :
      GTK_FRAME
        where type 'a class = 'a FrameClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type shadow_type_t = ShadowType.t
    structure FrameAccessible :
      GTK_FRAME_ACCESSIBLE
        where type 'a class = 'a FrameAccessibleClass.class
    structure GestureDrag :
      GTK_GESTURE_DRAG
        where type 'a class = 'a GestureDragClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure GestureLongPress :
      GTK_GESTURE_LONG_PRESS
        where type 'a class = 'a GestureLongPressClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure GestureMultiPress :
      GTK_GESTURE_MULTI_PRESS
        where type 'a class = 'a GestureMultiPressClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure GesturePanClass :
      GTK_GESTURE_PAN_CLASS
        where type 'a gesture_drag_class = 'a GestureDragClass.class
    structure GestureSwipe :
      GTK_GESTURE_SWIPE
        where type 'a class = 'a GestureSwipeClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure HBox :
      GTK_H_BOX
        where type 'a class = 'a HBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure HButtonBoxClass :
      GTK_H_BUTTON_BOX_CLASS
        where type 'a button_box_class = 'a ButtonBoxClass.class
    structure HPaned :
      GTK_H_PANED
        where type 'a class = 'a HPanedClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure HScale :
      GTK_H_SCALE
        where type 'a class = 'a HScaleClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
    structure HScrollbar :
      GTK_H_SCROLLBAR
        where type 'a class = 'a HScrollbarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
    structure HandleBox :
      GTK_HANDLE_BOX
        where type 'a class = 'a HandleBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type shadow_type_t = ShadowType.t
        where type position_type_t = PositionType.t
    structure IconViewAccessible :
      GTK_ICON_VIEW_ACCESSIBLE
        where type 'a class = 'a IconViewAccessibleClass.class
    structure ImageCellAccessible :
      GTK_IMAGE_CELL_ACCESSIBLE
        where type 'a class = 'a ImageCellAccessibleClass.class
    structure ImageMenuItemClass :
      GTK_IMAGE_MENU_ITEM_CLASS
        where type 'a menu_item_class = 'a MenuItemClass.class
    structure InfoBar :
      GTK_INFO_BAR
        where type 'a class = 'a InfoBarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a button_class = 'a ButtonClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type message_type_t = MessageType.t
    structure Label :
      GTK_LABEL
        where type 'a class = 'a LabelClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type movement_step_t = MovementStep.t
        where type 'a menu_class = 'a MenuClass.class
        where type justification_t = Justification.t
        where type 'a widget_class = 'a WidgetClass.class
    structure LinkButtonClass :
      GTK_LINK_BUTTON_CLASS
        where type 'a button_class = 'a ButtonClass.class
    structure LinkButtonAccessibleClass :
      GTK_LINK_BUTTON_ACCESSIBLE_CLASS
        where type 'a button_accessible_class = 'a ButtonAccessibleClass.class
    structure ListBox :
      GTK_LIST_BOX
        where type 'a class = 'a ListBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type movement_step_t = MovementStep.t
        where type 'a list_box_row_class = 'a ListBoxRowClass.class
        where type selection_mode_t = SelectionMode.t
    structure ListBoxAccessible :
      GTK_LIST_BOX_ACCESSIBLE
        where type 'a class = 'a ListBoxAccessibleClass.class
    structure ListBoxRow :
      GTK_LIST_BOX_ROW
        where type 'a class = 'a ListBoxRowClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure ListBoxRowAccessible :
      GTK_LIST_BOX_ROW_ACCESSIBLE
        where type 'a class = 'a ListBoxRowAccessibleClass.class
    structure LockButtonClass :
      GTK_LOCK_BUTTON_CLASS
        where type 'a button_class = 'a ButtonClass.class
    structure LockButtonAccessibleClass :
      GTK_LOCK_BUTTON_ACCESSIBLE_CLASS
        where type 'a button_accessible_class = 'a ButtonAccessibleClass.class
    structure Menu :
      GTK_MENU
        where type 'a class = 'a MenuClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type scroll_type_t = ScrollType.t
        where type 'a accel_group_class = 'a AccelGroupClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure MenuAccessibleClass :
      GTK_MENU_ACCESSIBLE_CLASS
        where type 'a menu_shell_accessible_class = 'a MenuShellAccessibleClass.class
    structure MenuBar :
      GTK_MENU_BAR
        where type 'a class = 'a MenuBarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type pack_direction_t = PackDirection.t
    structure MenuItem :
      GTK_MENU_ITEM
        where type 'a class = 'a MenuItemClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a menu_class = 'a MenuClass.class
    structure MenuItemAccessible :
      GTK_MENU_ITEM_ACCESSIBLE
        where type 'a class = 'a MenuItemAccessibleClass.class
    structure MenuShell :
      GTK_MENU_SHELL
        where type 'a class = 'a MenuShellClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a menu_item_class = 'a MenuItemClass.class
        where type direction_type_t = DirectionType.t
        where type 'a widget_class = 'a WidgetClass.class
        where type menu_direction_type_t = MenuDirectionType.t
    structure MenuShellAccessible :
      GTK_MENU_SHELL_ACCESSIBLE
        where type 'a class = 'a MenuShellAccessibleClass.class
    structure ModelButtonClass :
      GTK_MODEL_BUTTON_CLASS
        where type 'a button_class = 'a ButtonClass.class
    structure MountOperation :
      GTK_MOUNT_OPERATION
        where type 'a class = 'a MountOperationClass.class
        where type 'a window_class = 'a WindowClass.class
    structure NativeDialog :
      GTK_NATIVE_DIALOG
        where type 'a class = 'a NativeDialogClass.class
        where type 'a window_class = 'a WindowClass.class
    structure NotebookAccessible :
      GTK_NOTEBOOK_ACCESSIBLE
        where type 'a class = 'a NotebookAccessibleClass.class
    structure NotebookPageAccessible :
      GTK_NOTEBOOK_PAGE_ACCESSIBLE
        where type 'a class = 'a NotebookPageAccessibleClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a notebook_accessible_class = 'a NotebookAccessibleClass.class
    structure OffscreenWindowClass :
      GTK_OFFSCREEN_WINDOW_CLASS
        where type 'a window_class = 'a WindowClass.class
    structure Overlay :
      GTK_OVERLAY
        where type 'a class = 'a OverlayClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure PadController :
      GTK_PAD_CONTROLLER
        where type 'a class = 'a PadControllerClass.class
        where type 'a window_class = 'a WindowClass.class
        where type pad_action_type_t = PadActionType.t
    structure PanedAccessible :
      GTK_PANED_ACCESSIBLE
        where type 'a class = 'a PanedAccessibleClass.class
    structure PlacesSidebarClass :
      GTK_PLACES_SIDEBAR_CLASS
        where type 'a scrolled_window_class = 'a ScrolledWindowClass.class
    structure PlugClass :
      GTK_PLUG_CLASS
        where type 'a window_class = 'a WindowClass.class
    structure Popover :
      GTK_POPOVER
        where type 'a class = 'a PopoverClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type popover_constraint_t = PopoverConstraint.t
        where type position_type_t = PositionType.t
        where type 'a widget_class = 'a WidgetClass.class
    structure PopoverAccessible :
      GTK_POPOVER_ACCESSIBLE
        where type 'a class = 'a PopoverAccessibleClass.class
    structure PopoverMenuClass :
      GTK_POPOVER_MENU_CLASS
        where type 'a popover_class = 'a PopoverClass.class
    structure PrintOperation :
      GTK_PRINT_OPERATION
        where type 'a class = 'a PrintOperationClass.class
        where type print_operation_action_t = PrintOperationAction.t
        where type print_operation_result_t = PrintOperationResult.t
        where type 'a window_class = 'a WindowClass.class
        where type 'a print_operation_preview_class = 'a PrintOperationPreviewClass.class
        where type 'a print_context_class = 'a PrintContextClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a page_setup_class = 'a PageSetupClass.class
        where type 'a print_settings_class = 'a PrintSettingsClass.class
        where type print_status_t = PrintStatus.t
        where type unit_t = Unit.t
    structure RecentChooserMenuClass :
      GTK_RECENT_CHOOSER_MENU_CLASS
        where type 'a menu_class = 'a MenuClass.class
    structure RecentChooserWidget :
      GTK_RECENT_CHOOSER_WIDGET
        where type 'a class = 'a RecentChooserWidgetClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a recent_chooser_class = 'a RecentChooserClass.class
        where type 'a recent_manager_class = 'a RecentManagerClass.class
    structure Revealer :
      GTK_REVEALER
        where type 'a class = 'a RevealerClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type revealer_transition_type_t = RevealerTransitionType.t
    structure ScaleAccessible :
      GTK_SCALE_ACCESSIBLE
        where type 'a class = 'a ScaleAccessibleClass.class
    structure ScaleButtonClass :
      GTK_SCALE_BUTTON_CLASS
        where type 'a button_class = 'a ButtonClass.class
    structure ScaleButtonAccessibleClass :
      GTK_SCALE_BUTTON_ACCESSIBLE_CLASS
        where type 'a button_accessible_class = 'a ButtonAccessibleClass.class
    structure ScrolledWindow :
      GTK_SCROLLED_WINDOW
        where type 'a class = 'a ScrolledWindowClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type position_type_t = PositionType.t
        where type direction_type_t = DirectionType.t
        where type scroll_type_t = ScrollType.t
        where type shadow_type_t = ShadowType.t
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type policy_type_t = PolicyType.t
        where type corner_type_t = CornerType.t
    structure ScrolledWindowAccessible :
      GTK_SCROLLED_WINDOW_ACCESSIBLE
        where type 'a class = 'a ScrolledWindowAccessibleClass.class
    structure SearchBar :
      GTK_SEARCH_BAR
        where type 'a class = 'a SearchBarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a entry_class = 'a EntryClass.class
    structure SeparatorMenuItemClass :
      GTK_SEPARATOR_MENU_ITEM_CLASS
        where type 'a menu_item_class = 'a MenuItemClass.class
    structure SeparatorToolItemClass :
      GTK_SEPARATOR_TOOL_ITEM_CLASS
        where type 'a tool_item_class = 'a ToolItemClass.class
    structure ShortcutLabel :
      GTK_SHORTCUT_LABEL
        where type 'a class = 'a ShortcutLabelClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure ShortcutsGroup :
      GTK_SHORTCUTS_GROUP
        where type 'a class = 'a ShortcutsGroupClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a size_group_class = 'a SizeGroupClass.class
    structure ShortcutsSection :
      GTK_SHORTCUTS_SECTION
        where type 'a class = 'a ShortcutsSectionClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure ShortcutsShortcut :
      GTK_SHORTCUTS_SHORTCUT
        where type 'a class = 'a ShortcutsShortcutClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type text_direction_t = TextDirection.t
        where type shortcut_type_t = ShortcutType.t
        where type 'a size_group_class = 'a SizeGroupClass.class
    structure ShortcutsWindowClass :
      GTK_SHORTCUTS_WINDOW_CLASS
        where type 'a window_class = 'a WindowClass.class
    structure SpinButtonAccessible :
      GTK_SPIN_BUTTON_ACCESSIBLE
        where type 'a class = 'a SpinButtonAccessibleClass.class
    structure StackAccessible :
      GTK_STACK_ACCESSIBLE
        where type 'a class = 'a StackAccessibleClass.class
    structure StackSidebar :
      GTK_STACK_SIDEBAR
        where type 'a class = 'a StackSidebarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a stack_class = 'a StackClass.class
    structure StackSwitcher :
      GTK_STACK_SWITCHER
        where type 'a class = 'a StackSwitcherClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a stack_class = 'a StackClass.class
    structure StatusIcon :
      GTK_STATUS_ICON
        where type 'a class = 'a StatusIconClass.class
        where type 'a menu_class = 'a MenuClass.class
        where type 'a tooltip_class = 'a TooltipClass.class
        where type orientation_t = Orientation.t
        where type image_type_t = ImageType.t
    structure Statusbar :
      GTK_STATUSBAR
        where type 'a class = 'a StatusbarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a box_class = 'a BoxClass.class
    structure StatusbarAccessible :
      GTK_STATUSBAR_ACCESSIBLE
        where type 'a class = 'a StatusbarAccessibleClass.class
    structure TearoffMenuItemClass :
      GTK_TEAROFF_MENU_ITEM_CLASS
        where type 'a menu_item_class = 'a MenuItemClass.class
    structure TextCellAccessible :
      GTK_TEXT_CELL_ACCESSIBLE
        where type 'a class = 'a TextCellAccessibleClass.class
    structure TextViewAccessible :
      GTK_TEXT_VIEW_ACCESSIBLE
        where type 'a class = 'a TextViewAccessibleClass.class
    structure ToggleButtonClass :
      GTK_TOGGLE_BUTTON_CLASS
        where type 'a button_class = 'a ButtonClass.class
    structure ToggleButtonAccessibleClass :
      GTK_TOGGLE_BUTTON_ACCESSIBLE_CLASS
        where type 'a button_accessible_class = 'a ButtonAccessibleClass.class
    structure ToolButtonClass :
      GTK_TOOL_BUTTON_CLASS
        where type 'a tool_item_class = 'a ToolItemClass.class
    structure ToolItem :
      GTK_TOOL_ITEM
        where type 'a class = 'a ToolItemClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type relief_style_t = ReliefStyle.t
        where type orientation_t = Orientation.t
        where type 'a size_group_class = 'a SizeGroupClass.class
        where type toolbar_style_t = ToolbarStyle.t
        where type 'a widget_class = 'a WidgetClass.class
    structure ToolItemGroup :
      GTK_TOOL_ITEM_GROUP
        where type 'a class = 'a ToolItemGroupClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a tool_shell_class = 'a ToolShellClass.class
        where type 'a tool_item_class = 'a ToolItemClass.class
        where type relief_style_t = ReliefStyle.t
        where type 'a widget_class = 'a WidgetClass.class
    structure ToolPalette :
      GTK_TOOL_PALETTE
        where type 'a class = 'a ToolPaletteClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a scrollable_class = 'a ScrollableClass.class
        where type target_entry_t = TargetEntryRecord.t
        where type dest_defaults_t = DestDefaults.t
        where type 'a widget_class = 'a WidgetClass.class
        where type selection_data_t = SelectionDataRecord.t
        where type 'a tool_item_class = 'a ToolItemClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type tool_palette_drag_targets_t = ToolPaletteDragTargets.t
        where type 'a tool_item_group_class = 'a ToolItemGroupClass.class
        where type icon_size_t = IconSize.t
        where type toolbar_style_t = ToolbarStyle.t
    structure Toolbar :
      GTK_TOOLBAR
        where type 'a class = 'a ToolbarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a tool_shell_class = 'a ToolShellClass.class
        where type relief_style_t = ReliefStyle.t
        where type 'a tool_item_class = 'a ToolItemClass.class
        where type orientation_t = Orientation.t
        where type icon_size_t = IconSize.t
        where type toolbar_style_t = ToolbarStyle.t
    structure TreeViewAccessible :
      GTK_TREE_VIEW_ACCESSIBLE
        where type 'a class = 'a TreeViewAccessibleClass.class
        where type 'a cell_accessible_parent_class = 'a CellAccessibleParentClass.class
    structure VBox :
      GTK_V_BOX
        where type 'a class = 'a VBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure VButtonBoxClass :
      GTK_V_BUTTON_BOX_CLASS
        where type 'a button_box_class = 'a ButtonBoxClass.class
    structure VPaned :
      GTK_V_PANED
        where type 'a class = 'a VPanedClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure VScale :
      GTK_V_SCALE
        where type 'a class = 'a VScaleClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
    structure VScrollbar :
      GTK_V_SCROLLBAR
        where type 'a class = 'a VScrollbarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
    structure Viewport :
      GTK_VIEWPORT
        where type 'a class = 'a ViewportClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a scrollable_class = 'a ScrollableClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type shadow_type_t = ShadowType.t
    structure Widget :
      GTK_WIDGET
        where type 'a class = 'a WidgetClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type accel_flags_t = AccelFlags.t
        where type orientation_t = Orientation.t
        where type dest_defaults_t = DestDefaults.t
        where type target_entry_record_c_array_n_t = TargetEntryRecordCArrayN.t
        where type target_list_t = TargetListRecord.t
        where type 'a clipboard_class = 'a ClipboardClass.class
        where type widget_path_t = WidgetPathRecord.t
        where type size_request_mode_t = SizeRequestMode.t
        where type 'a settings_class = 'a SettingsClass.class
        where type 'a style_context_class = 'a StyleContextClass.class
        where type 'a rc_style_class = 'a RcStyleClass.class
        where type 'a accel_group_class = 'a AccelGroupClass.class
        where type 'a window_class = 'a WindowClass.class
        where type requisition_t = RequisitionRecord.t
        where type text_direction_t = TextDirection.t
        where type drag_result_t = DragResult.t
        where type direction_type_t = DirectionType.t
        where type 'a tooltip_class = 'a TooltipClass.class
        where type selection_data_t = SelectionDataRecord.t
        where type widget_help_type_t = WidgetHelpType.t
        where type allocation_t = AllocationRecord.t
        where type state_type_t = StateType.t
        where type state_flags_t = StateFlags.t
        where type 'a container_class = 'a ContainerClass.class
        where type 'a style_class = 'a StyleClass.class
        where type align_t = Align.t
    structure Window :
      GTK_WINDOW
        where type 'a class = 'a WindowClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a window_group_class = 'a WindowGroupClass.class
        where type 'a accel_group_class = 'a AccelGroupClass.class
        where type 'a application_class = 'a ApplicationClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type window_type_t = WindowType.t
        where type window_position_t = WindowPosition.t
    structure WindowAccessible :
      GTK_WINDOW_ACCESSIBLE
        where type 'a class = 'a WindowAccessibleClass.class
    structure WindowGroup :
      GTK_WINDOW_GROUP
        where type 'a class = 'a WindowGroupClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a window_class = 'a WindowClass.class
    structure AboutDialogClass :
      GTK_ABOUT_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure AppChooserButton :
      GTK_APP_CHOOSER_BUTTON
        where type 'a class = 'a AppChooserButtonClass.class
        where type 'a app_chooser_class = 'a AppChooserClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_editable_class = 'a CellEditableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
    structure AppChooserDialogClass :
      GTK_APP_CHOOSER_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure ApplicationWindow :
      GTK_APPLICATION_WINDOW
        where type 'a class = 'a ApplicationWindowClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a application_class = 'a ApplicationClass.class
        where type 'a shortcuts_window_class = 'a ShortcutsWindowClass.class
    structure AspectFrame :
      GTK_ASPECT_FRAME
        where type 'a class = 'a AspectFrameClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure Assistant :
      GTK_ASSISTANT
        where type 'a class = 'a AssistantClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type assistant_page_type_t = AssistantPageType.t
        where type 'a widget_class = 'a WidgetClass.class
    structure CheckButtonClass :
      GTK_CHECK_BUTTON_CLASS
        where type 'a toggle_button_class = 'a ToggleButtonClass.class
    structure CheckMenuItem :
      GTK_CHECK_MENU_ITEM
        where type 'a class = 'a CheckMenuItemClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure CheckMenuItemAccessible :
      GTK_CHECK_MENU_ITEM_ACCESSIBLE
        where type 'a class = 'a CheckMenuItemAccessibleClass.class
    structure ColorButton :
      GTK_COLOR_BUTTON
        where type 'a class = 'a ColorButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a color_chooser_class = 'a ColorChooserClass.class
    structure ColorChooserDialogClass :
      GTK_COLOR_CHOOSER_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure ColorSelectionDialogClass :
      GTK_COLOR_SELECTION_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure ComboBoxText :
      GTK_COMBO_BOX_TEXT
        where type 'a class = 'a ComboBoxTextClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a cell_editable_class = 'a CellEditableClass.class
        where type 'a cell_layout_class = 'a CellLayoutClass.class
    structure Dialog :
      GTK_DIALOG
        where type 'a class = 'a DialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a box_class = 'a BoxClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure FileChooserButton :
      GTK_FILE_CHOOSER_BUTTON
        where type 'a class = 'a FileChooserButtonClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type file_chooser_action_t = FileChooserAction.t
        where type 'a dialog_class = 'a DialogClass.class
        where type 'a file_chooser_class = 'a FileChooserClass.class
    structure FileChooserDialogClass :
      GTK_FILE_CHOOSER_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure FontButton :
      GTK_FONT_BUTTON
        where type 'a class = 'a FontButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a font_chooser_class = 'a FontChooserClass.class
    structure FontChooserDialogClass :
      GTK_FONT_CHOOSER_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure FontSelectionDialogClass :
      GTK_FONT_SELECTION_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure GesturePan :
      GTK_GESTURE_PAN
        where type 'a class = 'a GesturePanClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type pan_direction_t = PanDirection.t
        where type orientation_t = Orientation.t
    structure HButtonBox :
      GTK_H_BUTTON_BOX
        where type 'a class = 'a HButtonBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure ImageMenuItem :
      GTK_IMAGE_MENU_ITEM
        where type 'a class = 'a ImageMenuItemClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a accel_group_class = 'a AccelGroupClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure LinkButton :
      GTK_LINK_BUTTON
        where type 'a class = 'a LinkButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure LinkButtonAccessible :
      GTK_LINK_BUTTON_ACCESSIBLE
        where type 'a class = 'a LinkButtonAccessibleClass.class
    structure LockButton :
      GTK_LOCK_BUTTON
        where type 'a class = 'a LockButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure LockButtonAccessible :
      GTK_LOCK_BUTTON_ACCESSIBLE
        where type 'a class = 'a LockButtonAccessibleClass.class
    structure MenuAccessible :
      GTK_MENU_ACCESSIBLE
        where type 'a class = 'a MenuAccessibleClass.class
    structure MenuButtonClass :
      GTK_MENU_BUTTON_CLASS
        where type 'a toggle_button_class = 'a ToggleButtonClass.class
    structure MenuButtonAccessibleClass :
      GTK_MENU_BUTTON_ACCESSIBLE_CLASS
        where type 'a toggle_button_accessible_class = 'a ToggleButtonAccessibleClass.class
    structure MenuToolButtonClass :
      GTK_MENU_TOOL_BUTTON_CLASS
        where type 'a tool_button_class = 'a ToolButtonClass.class
    structure MessageDialogClass :
      GTK_MESSAGE_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure ModelButton :
      GTK_MODEL_BUTTON
        where type 'a class = 'a ModelButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type button_role_t = ButtonRole.t
    structure OffscreenWindow :
      GTK_OFFSCREEN_WINDOW
        where type 'a class = 'a OffscreenWindowClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure PlacesSidebar :
      GTK_PLACES_SIDEBAR
        where type 'a class = 'a PlacesSidebarClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type places_open_flags_t = PlacesOpenFlags.t
    structure Plug :
      GTK_PLUG
        where type 'a class = 'a PlugClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure PopoverMenu :
      GTK_POPOVER_MENU
        where type 'a class = 'a PopoverMenuClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure RadioButtonAccessibleClass :
      GTK_RADIO_BUTTON_ACCESSIBLE_CLASS
        where type 'a toggle_button_accessible_class = 'a ToggleButtonAccessibleClass.class
    structure RadioMenuItemClass :
      GTK_RADIO_MENU_ITEM_CLASS
        where type 'a check_menu_item_class = 'a CheckMenuItemClass.class
    structure RadioMenuItemAccessibleClass :
      GTK_RADIO_MENU_ITEM_ACCESSIBLE_CLASS
        where type 'a check_menu_item_accessible_class = 'a CheckMenuItemAccessibleClass.class
    structure RecentChooserDialogClass :
      GTK_RECENT_CHOOSER_DIALOG_CLASS
        where type 'a dialog_class = 'a DialogClass.class
    structure RecentChooserMenu :
      GTK_RECENT_CHOOSER_MENU
        where type 'a class = 'a RecentChooserMenuClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a recent_chooser_class = 'a RecentChooserClass.class
        where type 'a recent_manager_class = 'a RecentManagerClass.class
    structure ScaleButton :
      GTK_SCALE_BUTTON
        where type 'a class = 'a ScaleButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
        where type 'a button_class = 'a ButtonClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a adjustment_class = 'a AdjustmentClass.class
        where type icon_size_t = IconSize.t
    structure ScaleButtonAccessible :
      GTK_SCALE_BUTTON_ACCESSIBLE
        where type 'a class = 'a ScaleButtonAccessibleClass.class
    structure SeparatorMenuItem :
      GTK_SEPARATOR_MENU_ITEM
        where type 'a class = 'a SeparatorMenuItemClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure SeparatorToolItem :
      GTK_SEPARATOR_TOOL_ITEM
        where type 'a class = 'a SeparatorToolItemClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure ShortcutsWindow :
      GTK_SHORTCUTS_WINDOW
        where type 'a class = 'a ShortcutsWindowClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure TearoffMenuItem :
      GTK_TEAROFF_MENU_ITEM
        where type 'a class = 'a TearoffMenuItemClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure ToggleButton :
      GTK_TOGGLE_BUTTON
        where type 'a class = 'a ToggleButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure ToggleButtonAccessible :
      GTK_TOGGLE_BUTTON_ACCESSIBLE
        where type 'a class = 'a ToggleButtonAccessibleClass.class
    structure ToggleToolButtonClass :
      GTK_TOGGLE_TOOL_BUTTON_CLASS
        where type 'a tool_button_class = 'a ToolButtonClass.class
    structure ToolButton :
      GTK_TOOL_BUTTON
        where type 'a class = 'a ToolButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure VButtonBox :
      GTK_V_BUTTON_BOX
        where type 'a class = 'a VButtonBoxClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure VolumeButtonClass :
      GTK_VOLUME_BUTTON_CLASS
        where type 'a scale_button_class = 'a ScaleButtonClass.class
    structure AboutDialog :
      GTK_ABOUT_DIALOG
        where type 'a class = 'a AboutDialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type license_t = License.t
    structure AppChooserDialog :
      GTK_APP_CHOOSER_DIALOG
        where type 'a class = 'a AppChooserDialogClass.class
        where type 'a app_chooser_class = 'a AppChooserClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type dialog_flags_t = DialogFlags.t
        where type 'a window_class = 'a WindowClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure CheckButton :
      GTK_CHECK_BUTTON
        where type 'a class = 'a CheckButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure ColorChooserDialog :
      GTK_COLOR_CHOOSER_DIALOG
        where type 'a class = 'a ColorChooserDialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a color_chooser_class = 'a ColorChooserClass.class
        where type 'a window_class = 'a WindowClass.class
    structure ColorSelectionDialog :
      GTK_COLOR_SELECTION_DIALOG
        where type 'a class = 'a ColorSelectionDialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure FileChooserDialog :
      GTK_FILE_CHOOSER_DIALOG
        where type 'a class = 'a FileChooserDialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a file_chooser_class = 'a FileChooserClass.class
    structure FontChooserDialog :
      GTK_FONT_CHOOSER_DIALOG
        where type 'a class = 'a FontChooserDialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a font_chooser_class = 'a FontChooserClass.class
        where type 'a window_class = 'a WindowClass.class
    structure FontSelectionDialog :
      GTK_FONT_SELECTION_DIALOG
        where type 'a class = 'a FontSelectionDialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
    structure MenuButton :
      GTK_MENU_BUTTON
        where type 'a class = 'a MenuButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a container_class = 'a ContainerClass.class
        where type arrow_type_t = ArrowType.t
        where type 'a popover_class = 'a PopoverClass.class
        where type 'a menu_class = 'a MenuClass.class
    structure MenuButtonAccessible :
      GTK_MENU_BUTTON_ACCESSIBLE
        where type 'a class = 'a MenuButtonAccessibleClass.class
    structure MenuToolButton :
      GTK_MENU_TOOL_BUTTON
        where type 'a class = 'a MenuToolButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a widget_class = 'a WidgetClass.class
        where type 'a menu_class = 'a MenuClass.class
    structure MessageDialog :
      GTK_MESSAGE_DIALOG
        where type 'a class = 'a MessageDialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type buttons_type_t = ButtonsType.t
        where type 'a widget_class = 'a WidgetClass.class
        where type message_type_t = MessageType.t
    structure RadioButtonClass :
      GTK_RADIO_BUTTON_CLASS
        where type 'a check_button_class = 'a CheckButtonClass.class
    structure RadioButtonAccessible :
      GTK_RADIO_BUTTON_ACCESSIBLE
        where type 'a class = 'a RadioButtonAccessibleClass.class
    structure RadioMenuItem :
      GTK_RADIO_MENU_ITEM
        where type 'a class = 'a RadioMenuItemClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure RadioMenuItemAccessible :
      GTK_RADIO_MENU_ITEM_ACCESSIBLE
        where type 'a class = 'a RadioMenuItemAccessibleClass.class
    structure RadioToolButtonClass :
      GTK_RADIO_TOOL_BUTTON_CLASS
        where type 'a toggle_tool_button_class = 'a ToggleToolButtonClass.class
    structure RecentChooserDialog :
      GTK_RECENT_CHOOSER_DIALOG
        where type 'a class = 'a RecentChooserDialogClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a recent_chooser_class = 'a RecentChooserClass.class
    structure ToggleToolButton :
      GTK_TOGGLE_TOOL_BUTTON
        where type 'a class = 'a ToggleToolButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure VolumeButton :
      GTK_VOLUME_BUTTON
        where type 'a class = 'a VolumeButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
        where type 'a orientable_class = 'a OrientableClass.class
    structure RadioButton :
      GTK_RADIO_BUTTON
        where type 'a class = 'a RadioButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    structure RadioToolButton :
      GTK_RADIO_TOOL_BUTTON
        where type 'a class = 'a RadioToolButtonClass.class
        where type 'a actionable_class = 'a ActionableClass.class
        where type 'a activatable_class = 'a ActivatableClass.class
        where type 'a buildable_class = 'a BuildableClass.class
    val BINARY_AGE : LargeInt.int
    val INPUT_ERROR : LargeInt.int
    val INTERFACE_AGE : LargeInt.int
    val LEVEL_BAR_OFFSET_FULL : string
    val LEVEL_BAR_OFFSET_HIGH : string
    val LEVEL_BAR_OFFSET_LOW : string
    val MAJOR_VERSION : LargeInt.int
    val MAX_COMPOSE_LEN : LargeInt.int
    val MICRO_VERSION : LargeInt.int
    val MINOR_VERSION : LargeInt.int
    val PAPER_NAME_A3 : string
    val PAPER_NAME_A4 : string
    val PAPER_NAME_A5 : string
    val PAPER_NAME_B5 : string
    val PAPER_NAME_EXECUTIVE : string
    val PAPER_NAME_LEGAL : string
    val PAPER_NAME_LETTER : string
    val PATH_PRIO_MASK : LargeInt.int
    val PRINT_SETTINGS_COLLATE : string
    val PRINT_SETTINGS_DEFAULT_SOURCE : string
    val PRINT_SETTINGS_DITHER : string
    val PRINT_SETTINGS_DUPLEX : string
    val PRINT_SETTINGS_FINISHINGS : string
    val PRINT_SETTINGS_MEDIA_TYPE : string
    val PRINT_SETTINGS_NUMBER_UP : string
    val PRINT_SETTINGS_NUMBER_UP_LAYOUT : string
    val PRINT_SETTINGS_N_COPIES : string
    val PRINT_SETTINGS_ORIENTATION : string
    val PRINT_SETTINGS_OUTPUT_BASENAME : string
    val PRINT_SETTINGS_OUTPUT_BIN : string
    val PRINT_SETTINGS_OUTPUT_DIR : string
    val PRINT_SETTINGS_OUTPUT_FILE_FORMAT : string
    val PRINT_SETTINGS_OUTPUT_URI : string
    val PRINT_SETTINGS_PAGE_RANGES : string
    val PRINT_SETTINGS_PAGE_SET : string
    val PRINT_SETTINGS_PAPER_FORMAT : string
    val PRINT_SETTINGS_PAPER_HEIGHT : string
    val PRINT_SETTINGS_PAPER_WIDTH : string
    val PRINT_SETTINGS_PRINTER : string
    val PRINT_SETTINGS_PRINTER_LPI : string
    val PRINT_SETTINGS_PRINT_PAGES : string
    val PRINT_SETTINGS_QUALITY : string
    val PRINT_SETTINGS_RESOLUTION : string
    val PRINT_SETTINGS_RESOLUTION_X : string
    val PRINT_SETTINGS_RESOLUTION_Y : string
    val PRINT_SETTINGS_REVERSE : string
    val PRINT_SETTINGS_SCALE : string
    val PRINT_SETTINGS_USE_COLOR : string
    val PRINT_SETTINGS_WIN32_DRIVER_EXTRA : string
    val PRINT_SETTINGS_WIN32_DRIVER_VERSION : string
    val PRIORITY_RESIZE : LargeInt.int
    val STOCK_ABOUT : string
    val STOCK_ADD : string
    val STOCK_APPLY : string
    val STOCK_BOLD : string
    val STOCK_CANCEL : string
    val STOCK_CAPS_LOCK_WARNING : string
    val STOCK_CDROM : string
    val STOCK_CLEAR : string
    val STOCK_CLOSE : string
    val STOCK_COLOR_PICKER : string
    val STOCK_CONNECT : string
    val STOCK_CONVERT : string
    val STOCK_COPY : string
    val STOCK_CUT : string
    val STOCK_DELETE : string
    val STOCK_DIALOG_AUTHENTICATION : string
    val STOCK_DIALOG_ERROR : string
    val STOCK_DIALOG_INFO : string
    val STOCK_DIALOG_QUESTION : string
    val STOCK_DIALOG_WARNING : string
    val STOCK_DIRECTORY : string
    val STOCK_DISCARD : string
    val STOCK_DISCONNECT : string
    val STOCK_DND : string
    val STOCK_DND_MULTIPLE : string
    val STOCK_EDIT : string
    val STOCK_EXECUTE : string
    val STOCK_FILE : string
    val STOCK_FIND : string
    val STOCK_FIND_AND_REPLACE : string
    val STOCK_FLOPPY : string
    val STOCK_FULLSCREEN : string
    val STOCK_GOTO_BOTTOM : string
    val STOCK_GOTO_FIRST : string
    val STOCK_GOTO_LAST : string
    val STOCK_GOTO_TOP : string
    val STOCK_GO_BACK : string
    val STOCK_GO_DOWN : string
    val STOCK_GO_FORWARD : string
    val STOCK_GO_UP : string
    val STOCK_HARDDISK : string
    val STOCK_HELP : string
    val STOCK_HOME : string
    val STOCK_INDENT : string
    val STOCK_INDEX : string
    val STOCK_INFO : string
    val STOCK_ITALIC : string
    val STOCK_JUMP_TO : string
    val STOCK_JUSTIFY_CENTER : string
    val STOCK_JUSTIFY_FILL : string
    val STOCK_JUSTIFY_LEFT : string
    val STOCK_JUSTIFY_RIGHT : string
    val STOCK_LEAVE_FULLSCREEN : string
    val STOCK_MEDIA_FORWARD : string
    val STOCK_MEDIA_NEXT : string
    val STOCK_MEDIA_PAUSE : string
    val STOCK_MEDIA_PLAY : string
    val STOCK_MEDIA_PREVIOUS : string
    val STOCK_MEDIA_RECORD : string
    val STOCK_MEDIA_REWIND : string
    val STOCK_MEDIA_STOP : string
    val STOCK_MISSING_IMAGE : string
    val STOCK_NETWORK : string
    val STOCK_NEW : string
    val STOCK_NO : string
    val STOCK_OK : string
    val STOCK_OPEN : string
    val STOCK_ORIENTATION_LANDSCAPE : string
    val STOCK_ORIENTATION_PORTRAIT : string
    val STOCK_ORIENTATION_REVERSE_LANDSCAPE : string
    val STOCK_ORIENTATION_REVERSE_PORTRAIT : string
    val STOCK_PAGE_SETUP : string
    val STOCK_PASTE : string
    val STOCK_PREFERENCES : string
    val STOCK_PRINT : string
    val STOCK_PRINT_ERROR : string
    val STOCK_PRINT_PAUSED : string
    val STOCK_PRINT_PREVIEW : string
    val STOCK_PRINT_REPORT : string
    val STOCK_PRINT_WARNING : string
    val STOCK_PROPERTIES : string
    val STOCK_QUIT : string
    val STOCK_REDO : string
    val STOCK_REFRESH : string
    val STOCK_REMOVE : string
    val STOCK_REVERT_TO_SAVED : string
    val STOCK_SAVE : string
    val STOCK_SAVE_AS : string
    val STOCK_SELECT_ALL : string
    val STOCK_SELECT_COLOR : string
    val STOCK_SELECT_FONT : string
    val STOCK_SORT_ASCENDING : string
    val STOCK_SORT_DESCENDING : string
    val STOCK_SPELL_CHECK : string
    val STOCK_STOP : string
    val STOCK_STRIKETHROUGH : string
    val STOCK_UNDELETE : string
    val STOCK_UNDERLINE : string
    val STOCK_UNDO : string
    val STOCK_UNINDENT : string
    val STOCK_YES : string
    val STOCK_ZOOM_100 : string
    val STOCK_ZOOM_FIT : string
    val STOCK_ZOOM_IN : string
    val STOCK_ZOOM_OUT : string
    val STYLE_CLASS_ACCELERATOR : string
    val STYLE_CLASS_ARROW : string
    val STYLE_CLASS_BACKGROUND : string
    val STYLE_CLASS_BOTTOM : string
    val STYLE_CLASS_BUTTON : string
    val STYLE_CLASS_CALENDAR : string
    val STYLE_CLASS_CELL : string
    val STYLE_CLASS_CHECK : string
    val STYLE_CLASS_COMBOBOX_ENTRY : string
    val STYLE_CLASS_CONTEXT_MENU : string
    val STYLE_CLASS_CSD : string
    val STYLE_CLASS_CURSOR_HANDLE : string
    val STYLE_CLASS_DEFAULT : string
    val STYLE_CLASS_DESTRUCTIVE_ACTION : string
    val STYLE_CLASS_DIM_LABEL : string
    val STYLE_CLASS_DND : string
    val STYLE_CLASS_DOCK : string
    val STYLE_CLASS_ENTRY : string
    val STYLE_CLASS_ERROR : string
    val STYLE_CLASS_EXPANDER : string
    val STYLE_CLASS_FLAT : string
    val STYLE_CLASS_FRAME : string
    val STYLE_CLASS_GRIP : string
    val STYLE_CLASS_HEADER : string
    val STYLE_CLASS_HIGHLIGHT : string
    val STYLE_CLASS_HORIZONTAL : string
    val STYLE_CLASS_IMAGE : string
    val STYLE_CLASS_INFO : string
    val STYLE_CLASS_INLINE_TOOLBAR : string
    val STYLE_CLASS_INSERTION_CURSOR : string
    val STYLE_CLASS_LABEL : string
    val STYLE_CLASS_LEFT : string
    val STYLE_CLASS_LEVEL_BAR : string
    val STYLE_CLASS_LINKED : string
    val STYLE_CLASS_LIST : string
    val STYLE_CLASS_LIST_ROW : string
    val STYLE_CLASS_MARK : string
    val STYLE_CLASS_MENU : string
    val STYLE_CLASS_MENUBAR : string
    val STYLE_CLASS_MENUITEM : string
    val STYLE_CLASS_MESSAGE_DIALOG : string
    val STYLE_CLASS_MONOSPACE : string
    val STYLE_CLASS_NEEDS_ATTENTION : string
    val STYLE_CLASS_NOTEBOOK : string
    val STYLE_CLASS_OSD : string
    val STYLE_CLASS_OVERSHOOT : string
    val STYLE_CLASS_PANE_SEPARATOR : string
    val STYLE_CLASS_PAPER : string
    val STYLE_CLASS_POPOVER : string
    val STYLE_CLASS_POPUP : string
    val STYLE_CLASS_PRIMARY_TOOLBAR : string
    val STYLE_CLASS_PROGRESSBAR : string
    val STYLE_CLASS_PULSE : string
    val STYLE_CLASS_QUESTION : string
    val STYLE_CLASS_RADIO : string
    val STYLE_CLASS_RAISED : string
    val STYLE_CLASS_READ_ONLY : string
    val STYLE_CLASS_RIGHT : string
    val STYLE_CLASS_RUBBERBAND : string
    val STYLE_CLASS_SCALE : string
    val STYLE_CLASS_SCALE_HAS_MARKS_ABOVE : string
    val STYLE_CLASS_SCALE_HAS_MARKS_BELOW : string
    val STYLE_CLASS_SCROLLBAR : string
    val STYLE_CLASS_SCROLLBARS_JUNCTION : string
    val STYLE_CLASS_SEPARATOR : string
    val STYLE_CLASS_SIDEBAR : string
    val STYLE_CLASS_SLIDER : string
    val STYLE_CLASS_SPINBUTTON : string
    val STYLE_CLASS_SPINNER : string
    val STYLE_CLASS_STATUSBAR : string
    val STYLE_CLASS_SUBTITLE : string
    val STYLE_CLASS_SUGGESTED_ACTION : string
    val STYLE_CLASS_TITLE : string
    val STYLE_CLASS_TITLEBAR : string
    val STYLE_CLASS_TOOLBAR : string
    val STYLE_CLASS_TOOLTIP : string
    val STYLE_CLASS_TOP : string
    val STYLE_CLASS_TOUCH_SELECTION : string
    val STYLE_CLASS_TROUGH : string
    val STYLE_CLASS_UNDERSHOOT : string
    val STYLE_CLASS_VERTICAL : string
    val STYLE_CLASS_VIEW : string
    val STYLE_CLASS_WARNING : string
    val STYLE_CLASS_WIDE : string
    val STYLE_PROPERTY_BACKGROUND_COLOR : string
    val STYLE_PROPERTY_BACKGROUND_IMAGE : string
    val STYLE_PROPERTY_BORDER_COLOR : string
    val STYLE_PROPERTY_BORDER_RADIUS : string
    val STYLE_PROPERTY_BORDER_STYLE : string
    val STYLE_PROPERTY_BORDER_WIDTH : string
    val STYLE_PROPERTY_COLOR : string
    val STYLE_PROPERTY_FONT : string
    val STYLE_PROPERTY_MARGIN : string
    val STYLE_PROPERTY_PADDING : string
    val STYLE_PROVIDER_PRIORITY_APPLICATION : LargeInt.int
    val STYLE_PROVIDER_PRIORITY_FALLBACK : LargeInt.int
    val STYLE_PROVIDER_PRIORITY_SETTINGS : LargeInt.int
    val STYLE_PROVIDER_PRIORITY_THEME : LargeInt.int
    val STYLE_PROVIDER_PRIORITY_USER : LargeInt.int
    val STYLE_REGION_COLUMN : string
    val STYLE_REGION_COLUMN_HEADER : string
    val STYLE_REGION_ROW : string
    val STYLE_REGION_TAB : string
    val TEXT_VIEW_PRIORITY_VALIDATE : LargeInt.int
    val TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID : LargeInt.int
    val TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID : LargeInt.int
    val accelGroupsActivate :
      'a GObject.ObjectClass.class
       * LargeInt.int
       * Gdk.ModifierType.t
       -> bool
    val acceleratorGetDefaultModMask : unit -> Gdk.ModifierType.t
    val acceleratorGetLabel : LargeInt.int * Gdk.ModifierType.t -> string
    val acceleratorGetLabelWithKeycode :
      'a Gdk.DisplayClass.class option
       * LargeInt.int
       * LargeInt.int
       * Gdk.ModifierType.t
       -> string
    val acceleratorName : LargeInt.int * Gdk.ModifierType.t -> string
    val acceleratorNameWithKeycode :
      'a Gdk.DisplayClass.class option
       * LargeInt.int
       * LargeInt.int
       * Gdk.ModifierType.t
       -> string
    val acceleratorParse : string -> LargeInt.int * Gdk.ModifierType.t
    val acceleratorParseWithKeycode :
      string
       -> LargeInt.int
           * GUIntCArray.t
           * Gdk.ModifierType.t
    val acceleratorSetDefaultModMask : Gdk.ModifierType.t -> unit
    val acceleratorValid : LargeInt.int * Gdk.ModifierType.t -> bool
    val alternativeDialogButtonOrder : 'a Gdk.ScreenClass.class option -> bool
    val cairoShouldDrawWindow : Cairo.ContextRecord.t * 'a Gdk.WindowClass.class -> bool
    val cairoTransformToWindow :
      Cairo.ContextRecord.t
       * 'a WidgetClass.class
       * 'b Gdk.WindowClass.class
       -> unit
    val checkVersion :
      LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> string option
    val deviceGrabAdd :
      'a WidgetClass.class
       * 'b Gdk.DeviceClass.class
       * bool
       -> unit
    val deviceGrabRemove : 'a WidgetClass.class * 'b Gdk.DeviceClass.class -> unit
    val disableSetlocale : unit -> unit
    val dragCancel : 'a Gdk.DragContextClass.class -> unit
    val dragFinish :
      'a Gdk.DragContextClass.class
       * bool
       * bool
       * LargeInt.int
       -> unit
    val dragGetSourceWidget : 'a Gdk.DragContextClass.class -> base WidgetClass.class option
    val dragSetIconDefault : 'a Gdk.DragContextClass.class -> unit
    val dragSetIconGicon :
      'a Gdk.DragContextClass.class
       * 'b Gio.IconClass.class
       * LargeInt.int
       * LargeInt.int
       -> unit
    val dragSetIconName :
      'a Gdk.DragContextClass.class
       * string
       * LargeInt.int
       * LargeInt.int
       -> unit
    val dragSetIconPixbuf :
      'a Gdk.DragContextClass.class
       * 'b GdkPixbuf.PixbufClass.class
       * LargeInt.int
       * LargeInt.int
       -> unit
    val dragSetIconStock :
      'a Gdk.DragContextClass.class
       * string
       * LargeInt.int
       * LargeInt.int
       -> unit
    val dragSetIconSurface : 'a Gdk.DragContextClass.class * Cairo.SurfaceRecord.t -> unit
    val dragSetIconWidget :
      'a Gdk.DragContextClass.class
       * 'b WidgetClass.class
       * LargeInt.int
       * LargeInt.int
       -> unit
    val drawInsertionCursor :
      'a WidgetClass.class
       * Cairo.ContextRecord.t
       * Gdk.RectangleRecord.t
       * bool
       * TextDirection.t
       * bool
       -> unit
    val eventsPending : unit -> bool
    val getBinaryAge : unit -> LargeInt.int
    val getCurrentEvent : unit -> base Gdk.Event.union option
    val getCurrentEventDevice : unit -> base Gdk.DeviceClass.class option
    val getCurrentEventState : unit -> Gdk.ModifierType.t option
    val getCurrentEventTime : unit -> LargeInt.int
    val getDebugFlags : unit -> LargeInt.int
    val getDefaultLanguage : unit -> Pango.LanguageRecord.t
    val getEventWidget : 'a Gdk.Event.union -> base WidgetClass.class option
    val getInterfaceAge : unit -> LargeInt.int
    val getLocaleDirection : unit -> TextDirection.t
    val getMajorVersion : unit -> LargeInt.int
    val getMicroVersion : unit -> LargeInt.int
    val getMinorVersion : unit -> LargeInt.int
    val getOptionGroup : bool -> GLib.OptionGroupRecord.t
    val grabGetCurrent : unit -> base WidgetClass.class option
    val init : Utf8CPtrArrayN.t -> Utf8CPtrArrayN.t
    val initCheck : Utf8CPtrArrayN.t -> bool * Utf8CPtrArrayN.t
    val keySnooperRemove : LargeInt.int -> unit
    val main : unit -> unit
    val mainDoEvent : 'a Gdk.Event.union -> unit
    val mainIteration : unit -> bool
    val mainIterationDo : bool -> bool
    val mainLevel : unit -> LargeInt.int
    val mainQuit : unit -> unit
    val paintArrow :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * ArrowType.t
       * bool
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintBox :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintBoxGap :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * PositionType.t
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintCheck :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintDiamond :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintExpander :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * ExpanderStyle.t
       -> unit
    val paintExtension :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * PositionType.t
       -> unit
    val paintFlatBox :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintFocus :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintHandle :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * Orientation.t
       -> unit
    val paintHline :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintLayout :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * bool
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * 'c Pango.LayoutClass.class
       -> unit
    val paintOption :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintResizeGrip :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * 'b WidgetClass.class option
       * string option
       * Gdk.WindowEdge.t
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintShadow :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintShadowGap :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * PositionType.t
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintSlider :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * Orientation.t
       -> unit
    val paintSpinner :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintTab :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * ShadowType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val paintVline :
      'a StyleClass.class
       * Cairo.ContextRecord.t
       * StateType.t
       * 'b WidgetClass.class option
       * string option
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val parseArgs : Utf8CPtrArrayN.t -> bool * Utf8CPtrArrayN.t
    val printRunPageSetupDialog :
      'a WindowClass.class option
       * 'b PageSetupClass.class option
       * 'c PrintSettingsClass.class
       -> base PageSetupClass.class
    val propagateEvent : 'a WidgetClass.class * 'b Gdk.Event.union -> unit
    val rcAddDefaultFile : string -> unit
    val rcFindModuleInPath : string -> string
    val rcGetDefaultFiles : unit -> Utf8CPtrArray.t
    val rcGetImModuleFile : unit -> string
    val rcGetImModulePath : unit -> string
    val rcGetModuleDir : unit -> string
    val rcGetStyle : 'a WidgetClass.class -> base StyleClass.class
    val rcGetStyleByPaths :
      'a SettingsClass.class
       * string option
       * string option
       * GObject.Type.t
       -> base StyleClass.class option
    val rcGetThemeDir : unit -> string
    val rcParse : string -> unit
    val rcParseString : string -> unit
    val rcReparseAll : unit -> bool
    val rcReparseAllForSettings : 'a SettingsClass.class * bool -> bool
    val rcResetStyles : 'a SettingsClass.class -> unit
    val rcSetDefaultFiles : Utf8CPtrArray.t -> unit
    val renderActivity :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderArrow :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderBackground :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderBackgroundGetClip :
      'a StyleContextClass.class
       * real
       * real
       * real
       * real
       -> Gdk.RectangleRecord.t
    val renderCheck :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderExpander :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderExtension :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       * PositionType.t
       -> unit
    val renderFocus :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderFrame :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderFrameGap :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       * PositionType.t
       * real
       * real
       -> unit
    val renderHandle :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderIcon :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * 'b GdkPixbuf.PixbufClass.class
       * real
       * real
       -> unit
    val renderIconPixbuf :
      'a StyleContextClass.class
       * IconSourceRecord.t
       * LargeInt.int
       -> base GdkPixbuf.PixbufClass.class
    val renderIconSurface :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * Cairo.SurfaceRecord.t
       * real
       * real
       -> unit
    val renderInsertionCursor :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * 'b Pango.LayoutClass.class
       * LargeInt.int
       * Pango.Direction.t
       -> unit
    val renderLayout :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * 'b Pango.LayoutClass.class
       -> unit
    val renderLine :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderOption :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       -> unit
    val renderSlider :
      'a StyleContextClass.class
       * Cairo.ContextRecord.t
       * real
       * real
       * real
       * real
       * Orientation.t
       -> unit
    val rgbToHsv :
      real
       * real
       * real
       -> real
           * real
           * real
    val selectionAddTarget :
      'a WidgetClass.class
       * Gdk.AtomRecord.t
       * Gdk.AtomRecord.t
       * LargeInt.int
       -> unit
    val selectionAddTargets :
      'a WidgetClass.class
       * Gdk.AtomRecord.t
       * TargetEntryRecordCArrayN.t
       -> unit
    val selectionClearTargets : 'a WidgetClass.class * Gdk.AtomRecord.t -> unit
    val selectionConvert :
      'a WidgetClass.class
       * Gdk.AtomRecord.t
       * Gdk.AtomRecord.t
       * LargeInt.int
       -> bool
    val selectionOwnerSet :
      'a WidgetClass.class option
       * Gdk.AtomRecord.t
       * LargeInt.int
       -> bool
    val selectionOwnerSetForDisplay :
      'a Gdk.DisplayClass.class
       * 'b WidgetClass.class option
       * Gdk.AtomRecord.t
       * LargeInt.int
       -> bool
    val selectionRemoveAll : 'a WidgetClass.class -> unit
    val setDebugFlags : LargeInt.int -> unit
    val showUri :
      'a Gdk.ScreenClass.class option
       * string
       * LargeInt.int
       -> unit
    val showUriOnWindow :
      'a WindowClass.class option
       * string
       * LargeInt.int
       -> unit
    val targetTableFree : TargetEntryRecordCArrayN.t -> unit
    val targetTableNewFromList : TargetListRecord.t -> TargetEntryRecordCArrayN.t
    val targetsIncludeImage : GdkAtomRecordCPtrArrayN.t * bool -> bool
    val targetsIncludeRichText : GdkAtomRecordCPtrArrayN.t * 'a TextBufferClass.class -> bool
    val targetsIncludeText : GdkAtomRecordCPtrArrayN.t -> bool
    val targetsIncludeUri : GdkAtomRecordCPtrArrayN.t -> bool
    val testCreateSimpleWindow : string * string -> base WidgetClass.class
    val testFindLabel : 'a WidgetClass.class * string -> base WidgetClass.class
    val testFindSibling : 'a WidgetClass.class * GObject.Type.t -> base WidgetClass.class
    val testFindWidget :
      'a WidgetClass.class
       * string
       * GObject.Type.t
       -> base WidgetClass.class option
    val testListAllTypes : unit -> GObjectTypeCArray.t
    val testRegisterAllTypes : unit -> unit
    val testSliderGetValue : 'a WidgetClass.class -> real
    val testSliderSetPerc : 'a WidgetClass.class * real -> unit
    val testSpinButtonClick :
      'a SpinButtonClass.class
       * LargeInt.int
       * bool
       -> bool
    val testTextGet : 'a WidgetClass.class -> string
    val testTextSet : 'a WidgetClass.class * string -> unit
    val testWidgetClick :
      'a WidgetClass.class
       * LargeInt.int
       * Gdk.ModifierType.t
       -> bool
    val testWidgetSendKey :
      'a WidgetClass.class
       * LargeInt.int
       * Gdk.ModifierType.t
       -> bool
    val testWidgetWaitForDraw : 'a WidgetClass.class -> unit
    val treeGetRowDragData : SelectionDataRecord.t -> (base TreeModelClass.class * TreePathRecord.t) option
    val treeSetRowDragData :
      SelectionDataRecord.t
       * 'a TreeModelClass.class
       * TreePathRecord.t
       -> bool
  end
