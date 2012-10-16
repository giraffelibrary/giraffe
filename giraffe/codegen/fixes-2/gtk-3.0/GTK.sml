signature GTK =
  sig
    type ('widget, 'a) styleproperty_readonly
    structure ActionEntry : GTK_ACTION_ENTRY
    structure AccelFlags : GTK_ACCEL_FLAGS
    structure AccelGroupClass : GTK_ACCEL_GROUP_CLASS
    structure AccelKeyRecord : GTK_ACCEL_KEY_RECORD
    structure AccelMapClass : GTK_ACCEL_MAP_CLASS
    structure AccessibleClass : GTK_ACCESSIBLE_CLASS
    structure ActionClass : GTK_ACTION_CLASS
    structure ActionGroupClass : GTK_ACTION_GROUP_CLASS
    structure ActivatableClass : GTK_ACTIVATABLE_CLASS
    structure AdjustmentClass : GTK_ADJUSTMENT_CLASS
    structure Align : GTK_ALIGN
    structure AppChooserClass : GTK_APP_CHOOSER_CLASS
    structure ApplicationClass : GTK_APPLICATION_CLASS
    structure ArrowPlacement : GTK_ARROW_PLACEMENT
    structure ArrowType : GTK_ARROW_TYPE
    structure AssistantPageType : GTK_ASSISTANT_PAGE_TYPE
    structure AttachOptions : GTK_ATTACH_OPTIONS
    structure BorderRecord : GTK_BORDER_RECORD
    structure BorderStyle : GTK_BORDER_STYLE
    structure BuildableClass : GTK_BUILDABLE_CLASS
    structure BuilderClass : GTK_BUILDER_CLASS
    structure BuilderError : GTK_BUILDER_ERROR
    exception BuilderError of BuilderError.t
    structure ButtonBoxStyle : GTK_BUTTON_BOX_STYLE
    structure ButtonsType : GTK_BUTTONS_TYPE
    structure CalendarDisplayOptions : GTK_CALENDAR_DISPLAY_OPTIONS
    structure CellAreaClass : GTK_CELL_AREA_CLASS
    structure CellAreaContextClass : GTK_CELL_AREA_CONTEXT_CLASS
    structure CellEditableClass : GTK_CELL_EDITABLE_CLASS
    structure CellLayoutClass : GTK_CELL_LAYOUT_CLASS
    structure CellRendererClass : GTK_CELL_RENDERER_CLASS
    structure CellRendererAccelMode : GTK_CELL_RENDERER_ACCEL_MODE
    structure CellRendererMode : GTK_CELL_RENDERER_MODE
    structure CellRendererState : GTK_CELL_RENDERER_STATE
    structure ClipboardClass : GTK_CLIPBOARD_CLASS
    structure CornerType : GTK_CORNER_TYPE
    structure CssProviderClass : GTK_CSS_PROVIDER_CLASS
    structure CssProviderError : GTK_CSS_PROVIDER_ERROR
    exception CssProviderError of CssProviderError.t
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
    structure EntryIconPosition : GTK_ENTRY_ICON_POSITION
    structure ExpanderStyle : GTK_EXPANDER_STYLE
    structure FileChooserClass : GTK_FILE_CHOOSER_CLASS
    structure FileChooserAction : GTK_FILE_CHOOSER_ACTION
    structure FileChooserConfirmation : GTK_FILE_CHOOSER_CONFIRMATION
    structure FileChooserError : GTK_FILE_CHOOSER_ERROR
    exception FileChooserError of FileChooserError.t
    structure FileFilterClass : GTK_FILE_FILTER_CLASS
    structure FileFilterFlags : GTK_FILE_FILTER_FLAGS
    structure FileFilterInfoRecord : GTK_FILE_FILTER_INFO_RECORD
    structure FontChooserClass : GTK_FONT_CHOOSER_CLASS
    structure IMContextClass : GTK_I_M_CONTEXT_CLASS
    structure IMPreeditStyle : GTK_I_M_PREEDIT_STYLE
    structure IMStatusStyle : GTK_I_M_STATUS_STYLE
    structure IconFactoryClass : GTK_ICON_FACTORY_CLASS
    structure IconInfoRecord : GTK_ICON_INFO_RECORD
    structure IconLookupFlags : GTK_ICON_LOOKUP_FLAGS
    structure IconSetRecord : GTK_ICON_SET_RECORD
    structure IconSourceRecord : GTK_ICON_SOURCE_RECORD
    structure IconThemeClass : GTK_ICON_THEME_CLASS
    structure IconThemeError : GTK_ICON_THEME_ERROR
    exception IconThemeError of IconThemeError.t
    structure IconViewDropPosition : GTK_ICON_VIEW_DROP_POSITION
    structure ImageType : GTK_IMAGE_TYPE
    structure JunctionSides : GTK_JUNCTION_SIDES
    structure Justification : GTK_JUSTIFICATION
    structure License : GTK_LICENSE
    structure ListStoreClass : GTK_LIST_STORE_CLASS
    structure MenuDirectionType : GTK_MENU_DIRECTION_TYPE
    structure MessageType : GTK_MESSAGE_TYPE
    structure MountOperationClass : GTK_MOUNT_OPERATION_CLASS
    structure MovementStep : GTK_MOVEMENT_STEP
    structure NotebookTab : GTK_NOTEBOOK_TAB
    structure NumberUpLayout : GTK_NUMBER_UP_LAYOUT
    structure NumerableIconClass : GTK_NUMERABLE_ICON_CLASS
    structure OrientableClass : GTK_ORIENTABLE_CLASS
    structure Orientation : GTK_ORIENTATION
    structure PackDirection : GTK_PACK_DIRECTION
    structure PackType : GTK_PACK_TYPE
    structure PageOrientation : GTK_PAGE_ORIENTATION
    structure PageSet : GTK_PAGE_SET
    structure PageSetupClass : GTK_PAGE_SETUP_CLASS
    structure PaperSizeRecord : GTK_PAPER_SIZE_RECORD
    structure PathPriorityType : GTK_PATH_PRIORITY_TYPE
    structure PathType : GTK_PATH_TYPE
    structure PolicyType : GTK_POLICY_TYPE
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
    structure RcFlags : GTK_RC_FLAGS
    structure RcStyleClass : GTK_RC_STYLE_CLASS
    structure RecentChooserClass : GTK_RECENT_CHOOSER_CLASS
    structure RecentChooserError : GTK_RECENT_CHOOSER_ERROR
    exception RecentChooserError of RecentChooserError.t
    structure RecentDataRecord : GTK_RECENT_DATA_RECORD
    structure RecentFilterClass : GTK_RECENT_FILTER_CLASS
    structure RecentFilterFlags : GTK_RECENT_FILTER_FLAGS
    structure RecentFilterInfoRecord : GTK_RECENT_FILTER_INFO_RECORD
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
    structure ScrollStep : GTK_SCROLL_STEP
    structure ScrollType : GTK_SCROLL_TYPE
    structure ScrollableClass : GTK_SCROLLABLE_CLASS
    structure ScrollablePolicy : GTK_SCROLLABLE_POLICY
    structure SelectionDataRecord : GTK_SELECTION_DATA_RECORD
    structure SelectionMode : GTK_SELECTION_MODE
    structure SensitivityType : GTK_SENSITIVITY_TYPE
    structure SettingsClass : GTK_SETTINGS_CLASS
    structure SettingsValueRecord : GTK_SETTINGS_VALUE_RECORD
    structure ShadowType : GTK_SHADOW_TYPE
    structure SizeGroupClass : GTK_SIZE_GROUP_CLASS
    structure SizeGroupMode : GTK_SIZE_GROUP_MODE
    structure SizeRequestMode : GTK_SIZE_REQUEST_MODE
    structure SortType : GTK_SORT_TYPE
    structure SpinButtonUpdatePolicy : GTK_SPIN_BUTTON_UPDATE_POLICY
    structure SpinType : GTK_SPIN_TYPE
    structure StateFlags : GTK_STATE_FLAGS
    structure StateType : GTK_STATE_TYPE
    structure StatusIconClass : GTK_STATUS_ICON_CLASS
    structure StockItemRecord : GTK_STOCK_ITEM_RECORD
    structure StyleClass : GTK_STYLE_CLASS
    structure StyleContextClass : GTK_STYLE_CONTEXT_CLASS
    structure StylePropertiesClass : GTK_STYLE_PROPERTIES_CLASS
    structure StyleProviderClass : GTK_STYLE_PROVIDER_CLASS
    structure SymbolicColorRecord : GTK_SYMBOLIC_COLOR_RECORD
    structure TargetEntryRecord : GTK_TARGET_ENTRY_RECORD
    structure TargetFlags : GTK_TARGET_FLAGS
    structure TargetListRecord : GTK_TARGET_LIST_RECORD
    structure TextAttributesRecord : GTK_TEXT_ATTRIBUTES_RECORD
    structure TextBufferClass : GTK_TEXT_BUFFER_CLASS
    structure TextBufferTargetInfo : GTK_TEXT_BUFFER_TARGET_INFO
    structure TextChildAnchorClass : GTK_TEXT_CHILD_ANCHOR_CLASS
    structure TextDirection : GTK_TEXT_DIRECTION
    structure TextIterRecord : GTK_TEXT_ITER_RECORD
    structure TextMarkClass : GTK_TEXT_MARK_CLASS
    structure TextSearchFlags : GTK_TEXT_SEARCH_FLAGS
    structure TextTagClass : GTK_TEXT_TAG_CLASS
    structure TextTagTableClass : GTK_TEXT_TAG_TABLE_CLASS
    structure TextWindowType : GTK_TEXT_WINDOW_TYPE
    structure ThemingEngineClass : GTK_THEMING_ENGINE_CLASS
    structure ToolPaletteDragTargets : GTK_TOOL_PALETTE_DRAG_TARGETS
    structure ToolShellClass : GTK_TOOL_SHELL_CLASS
    structure ToolbarSpaceStyle : GTK_TOOLBAR_SPACE_STYLE
    structure ToolbarStyle : GTK_TOOLBAR_STYLE
    structure TooltipClass : GTK_TOOLTIP_CLASS
    structure TreeDragDestClass : GTK_TREE_DRAG_DEST_CLASS
    structure TreeDragSourceClass : GTK_TREE_DRAG_SOURCE_CLASS
    structure TreeIterRecord : GTK_TREE_ITER_RECORD
    structure TreeModelClass : GTK_TREE_MODEL_CLASS
    structure TreeModelFilterClass : GTK_TREE_MODEL_FILTER_CLASS
    structure TreeModelFlags : GTK_TREE_MODEL_FLAGS
    structure TreeModelSortClass : GTK_TREE_MODEL_SORT_CLASS
    structure TreePathRecord : GTK_TREE_PATH_RECORD
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
        where type 'a class_t = 'a AccelGroupClass.t
        where type accelflags_t = AccelFlags.t
    structure AccelKey :
      GTK_ACCEL_KEY
        where type record_t = AccelKeyRecord.t
    structure AccelMap :
      GTK_ACCEL_MAP
        where type 'a class_t = 'a AccelMapClass.t
        where type accelkeyrecord_t = AccelKeyRecord.t
    structure Accessible :
      GTK_ACCESSIBLE
        where type 'a class_t = 'a AccessibleClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure Action :
      GTK_ACTION
        where type 'a class_t = 'a ActionClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a accelgroupclass_t = 'a AccelGroupClass.t
        where type 'a actiongroupclass_t = 'a ActionGroupClass.t
    structure Activatable :
      GTK_ACTIVATABLE
        where type 'a class_t = 'a ActivatableClass.t
        where type 'a actionclass_t = 'a ActionClass.t
    structure Adjustment :
      GTK_ADJUSTMENT
        where type 'a class_t = 'a AdjustmentClass.t
    structure AppChooser :
      GTK_APP_CHOOSER
        where type 'a class_t = 'a AppChooserClass.t
    structure Border :
      GTK_BORDER
        where type record_t = BorderRecord.t
    structure Buildable :
      GTK_BUILDABLE
        where type 'a class_t = 'a BuildableClass.t
        where type 'a builderclass_t = 'a BuilderClass.t
    structure Builder :
      GTK_BUILDER
        where type 'a class_t = 'a BuilderClass.t
    structure CalendarClass :
      GTK_CALENDAR_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure CellArea :
      GTK_CELL_AREA
        where type 'a class_t = 'a CellAreaClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
        where type directiontype_t = DirectionType.t
        where type sizerequestmode_t = SizeRequestMode.t
        where type cellrendererstate_t = CellRendererState.t
        where type 'a cellareacontextclass_t = 'a CellAreaContextClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type orientation_t = Orientation.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
        where type 'a celleditableclass_t = 'a CellEditableClass.t
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
    structure CellAreaBoxClass :
      GTK_CELL_AREA_BOX_CLASS
        where type 'a cellareaclass_t = 'a CellAreaClass.t
    structure CellAreaContext :
      GTK_CELL_AREA_CONTEXT
        where type 'a class_t = 'a CellAreaContextClass.t
        where type 'a cellareaclass_t = 'a CellAreaClass.t
    structure CellEditable :
      GTK_CELL_EDITABLE
        where type 'a class_t = 'a CellEditableClass.t
    structure CellLayout :
      GTK_CELL_LAYOUT
        where type 'a class_t = 'a CellLayoutClass.t
        where type 'a cellareaclass_t = 'a CellAreaClass.t
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
    structure CellRenderer :
      GTK_CELL_RENDERER
        where type 'a class_t = 'a CellRendererClass.t
        where type requisitionrecord_t = RequisitionRecord.t
        where type sizerequestmode_t = SizeRequestMode.t
        where type stateflags_t = StateFlags.t
        where type cellrendererstate_t = CellRendererState.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a celleditableclass_t = 'a CellEditableClass.t
        where type cellrenderermode_t = CellRendererMode.t
    structure CellRendererPixbufClass :
      GTK_CELL_RENDERER_PIXBUF_CLASS
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
    structure CellRendererProgressClass :
      GTK_CELL_RENDERER_PROGRESS_CLASS
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
    structure CellRendererSpinnerClass :
      GTK_CELL_RENDERER_SPINNER_CLASS
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
    structure CellRendererTextClass :
      GTK_CELL_RENDERER_TEXT_CLASS
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
    structure CellRendererToggleClass :
      GTK_CELL_RENDERER_TOGGLE_CLASS
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
    structure CellViewClass :
      GTK_CELL_VIEW_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure Clipboard :
      GTK_CLIPBOARD
        where type 'a class_t = 'a ClipboardClass.t
        where type selectiondatarecord_t = SelectionDataRecord.t
        where type 'a textbufferclass_t = 'a TextBufferClass.t
    structure ContainerClass :
      GTK_CONTAINER_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure CssProvider :
      GTK_CSS_PROVIDER
        where type 'a class_t = 'a CssProviderClass.t
        where type 'a styleproviderclass_t = 'a StyleProviderClass.t
    structure DrawingAreaClass :
      GTK_DRAWING_AREA_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure Editable :
      GTK_EDITABLE
        where type 'a class_t = 'a EditableClass.t
    structure EntryClass :
      GTK_ENTRY_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure EntryBuffer :
      GTK_ENTRY_BUFFER
        where type 'a class_t = 'a EntryBufferClass.t
    structure EntryCompletion :
      GTK_ENTRY_COMPLETION
        where type 'a class_t = 'a EntryCompletionClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type 'a cellareaclass_t = 'a CellAreaClass.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
    structure FileChooser :
      GTK_FILE_CHOOSER
        where type 'a class_t = 'a FileChooserClass.t
        where type filechooserconfirmation_t = FileChooserConfirmation.t
        where type filechooseraction_t = FileChooserAction.t
        where type 'a filefilterclass_t = 'a FileFilterClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure FileFilter :
      GTK_FILE_FILTER
        where type 'a class_t = 'a FileFilterClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type filefilterinforecord_t = FileFilterInfoRecord.t
        where type filefilterflags_t = FileFilterFlags.t
    structure FileFilterInfo :
      GTK_FILE_FILTER_INFO
        where type record_t = FileFilterInfoRecord.t
    structure FontChooser :
      GTK_FONT_CHOOSER
        where type 'a class_t = 'a FontChooserClass.t
    structure HsvClass :
      GTK_HSV_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure IMContext :
      GTK_I_M_CONTEXT
        where type 'a class_t = 'a IMContextClass.t
    structure IMContextSimpleClass :
      GTK_I_M_CONTEXT_SIMPLE_CLASS
        where type 'a imcontextclass_t = 'a IMContextClass.t
    structure IMMulticontextClass :
      GTK_I_M_MULTICONTEXT_CLASS
        where type 'a imcontextclass_t = 'a IMContextClass.t
    structure IconFactory :
      GTK_ICON_FACTORY
        where type 'a class_t = 'a IconFactoryClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type iconsetrecord_t = IconSetRecord.t
    structure IconInfo :
      GTK_ICON_INFO
        where type record_t = IconInfoRecord.t
        where type 'a iconthemeclass_t = 'a IconThemeClass.t
        where type 'a stylecontextclass_t = 'a StyleContextClass.t
    structure IconSet :
      GTK_ICON_SET
        where type record_t = IconSetRecord.t
        where type iconsourcerecord_t = IconSourceRecord.t
        where type 'a stylecontextclass_t = 'a StyleContextClass.t
    structure IconSize :
      GTK_ICON_SIZE
        where type 'a settingsclass_t = 'a SettingsClass.t
    structure IconSource :
      GTK_ICON_SOURCE
        where type record_t = IconSourceRecord.t
        where type textdirection_t = TextDirection.t
        where type statetype_t = StateType.t
    structure IconTheme :
      GTK_ICON_THEME
        where type 'a class_t = 'a IconThemeClass.t
        where type iconinforecord_t = IconInfoRecord.t
        where type iconlookupflags_t = IconLookupFlags.t
    structure InvisibleClass :
      GTK_INVISIBLE_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure ListStore :
      GTK_LIST_STORE
        where type 'a class_t = 'a ListStoreClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a treedragdestclass_t = 'a TreeDragDestClass.t
        where type 'a treedragsourceclass_t = 'a TreeDragSourceClass.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
        where type 'a treesortableclass_t = 'a TreeSortableClass.t
        where type treeiterrecord_t = TreeIterRecord.t
    structure MiscClass :
      GTK_MISC_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure NumerableIcon :
      GTK_NUMERABLE_ICON
        where type 'a class_t = 'a NumerableIconClass.t
        where type 'a stylecontextclass_t = 'a StyleContextClass.t
    structure Orientable :
      GTK_ORIENTABLE
        where type 'a class_t = 'a OrientableClass.t
        where type orientation_t = Orientation.t
    structure PageSetup :
      GTK_PAGE_SETUP
        where type 'a class_t = 'a PageSetupClass.t
        where type pageorientation_t = PageOrientation.t
        where type papersizerecord_t = PaperSizeRecord.t
        where type unit_t = Unit.t
    structure PaperSize :
      GTK_PAPER_SIZE
        where type record_t = PaperSizeRecord.t
        where type unit_t = Unit.t
    structure PrintContext :
      GTK_PRINT_CONTEXT
        where type 'a class_t = 'a PrintContextClass.t
        where type 'a pagesetupclass_t = 'a PageSetupClass.t
    structure PrintOperationPreview :
      GTK_PRINT_OPERATION_PREVIEW
        where type 'a class_t = 'a PrintOperationPreviewClass.t
        where type 'a pagesetupclass_t = 'a PageSetupClass.t
        where type 'a printcontextclass_t = 'a PrintContextClass.t
    structure PrintSettings :
      GTK_PRINT_SETTINGS
        where type 'a class_t = 'a PrintSettingsClass.t
        where type printduplex_t = PrintDuplex.t
        where type numberuplayout_t = NumberUpLayout.t
        where type pageorientation_t = PageOrientation.t
        where type pageset_t = PageSet.t
        where type papersizerecord_t = PaperSizeRecord.t
        where type unit_t = Unit.t
        where type printpages_t = PrintPages.t
        where type printquality_t = PrintQuality.t
    structure ProgressBarClass :
      GTK_PROGRESS_BAR_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure RangeClass :
      GTK_RANGE_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure RcStyle :
      GTK_RC_STYLE
        where type 'a class_t = 'a RcStyleClass.t
    structure RecentActionClass :
      GTK_RECENT_ACTION_CLASS
        where type 'a actionclass_t = 'a ActionClass.t
    structure RecentChooser :
      GTK_RECENT_CHOOSER
        where type 'a class_t = 'a RecentChooserClass.t
        where type recentinforecord_t = RecentInfoRecord.t
        where type 'a recentfilterclass_t = 'a RecentFilterClass.t
        where type 'a recentmanagerclass_t = 'a RecentManagerClass.t
        where type recentsorttype_t = RecentSortType.t
    structure RecentData :
      GTK_RECENT_DATA
        where type record_t = RecentDataRecord.t
    structure RecentFilter :
      GTK_RECENT_FILTER
        where type 'a class_t = 'a RecentFilterClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type recentfilterinforecord_t = RecentFilterInfoRecord.t
        where type recentfilterflags_t = RecentFilterFlags.t
    structure RecentFilterInfo :
      GTK_RECENT_FILTER_INFO
        where type record_t = RecentFilterInfoRecord.t
    structure RecentInfo :
      GTK_RECENT_INFO
        where type record_t = RecentInfoRecord.t
    structure RecentManager :
      GTK_RECENT_MANAGER
        where type 'a class_t = 'a RecentManagerClass.t
        where type recentdatarecord_t = RecentDataRecord.t
        where type recentinforecord_t = RecentInfoRecord.t
    structure Requisition :
      GTK_REQUISITION
        where type record_t = RequisitionRecord.t
    structure Scrollable :
      GTK_SCROLLABLE
        where type 'a class_t = 'a ScrollableClass.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type scrollablepolicy_t = ScrollablePolicy.t
    structure SelectionData :
      GTK_SELECTION_DATA
        where type record_t = SelectionDataRecord.t
        where type 'a textbufferclass_t = 'a TextBufferClass.t
    structure SeparatorClass :
      GTK_SEPARATOR_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure SettingsValue :
      GTK_SETTINGS_VALUE
        where type record_t = SettingsValueRecord.t
    structure SizeGroup :
      GTK_SIZE_GROUP
        where type 'a class_t = 'a SizeGroupClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type sizegroupmode_t = SizeGroupMode.t
    structure SpinnerClass :
      GTK_SPINNER_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure StockItem :
      GTK_STOCK_ITEM
        where type record_t = StockItemRecord.t
    structure Style :
      GTK_STYLE
        where type 'a class_t = 'a StyleClass.t
        where type iconsetrecord_t = IconSetRecord.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type textdirection_t = TextDirection.t
        where type iconsourcerecord_t = IconSourceRecord.t
        where type statetype_t = StateType.t
        where type 'a stylecontextclass_t = 'a StyleContextClass.t
    structure StyleContext :
      GTK_STYLE_CONTEXT
        where type 'a class_t = 'a StyleContextClass.t
        where type borderrecord_t = BorderRecord.t
        where type regionflags_t = RegionFlags.t
        where type iconsetrecord_t = IconSetRecord.t
        where type 'a styleproviderclass_t = 'a StyleProviderClass.t
        where type junctionsides_t = JunctionSides.t
        where type widgetpathrecord_t = WidgetPathRecord.t
        where type stateflags_t = StateFlags.t
        where type statetype_t = StateType.t
        where type textdirection_t = TextDirection.t
    structure StyleProperties :
      GTK_STYLE_PROPERTIES
        where type 'a class_t = 'a StylePropertiesClass.t
        where type 'a styleproviderclass_t = 'a StyleProviderClass.t
        where type symboliccolorrecord_t = SymbolicColorRecord.t
        where type stateflags_t = StateFlags.t
    structure StyleProvider :
      GTK_STYLE_PROVIDER
        where type 'a class_t = 'a StyleProviderClass.t
        where type 'a iconfactoryclass_t = 'a IconFactoryClass.t
        where type 'a stylepropertiesclass_t = 'a StylePropertiesClass.t
        where type stateflags_t = StateFlags.t
        where type widgetpathrecord_t = WidgetPathRecord.t
    structure SwitchClass :
      GTK_SWITCH_CLASS
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure SymbolicColor :
      GTK_SYMBOLIC_COLOR
        where type record_t = SymbolicColorRecord.t
        where type 'a stylepropertiesclass_t = 'a StylePropertiesClass.t
    structure TargetEntry :
      GTK_TARGET_ENTRY
        where type record_t = TargetEntryRecord.t
    structure TargetList :
      GTK_TARGET_LIST
        where type record_t = TargetListRecord.t
        where type 'a textbufferclass_t = 'a TextBufferClass.t
    structure TextAttributes :
      GTK_TEXT_ATTRIBUTES
        where type record_t = TextAttributesRecord.t
    structure TextBuffer :
      GTK_TEXT_BUFFER
        where type 'a class_t = 'a TextBufferClass.t
        where type 'a textchildanchorclass_t = 'a TextChildAnchorClass.t
        where type 'a textmarkclass_t = 'a TextMarkClass.t
        where type 'a clipboardclass_t = 'a ClipboardClass.t
        where type textiterrecord_t = TextIterRecord.t
        where type 'a texttagclass_t = 'a TextTagClass.t
        where type targetlistrecord_t = TargetListRecord.t
        where type 'a texttagtableclass_t = 'a TextTagTableClass.t
    structure TextChildAnchor :
      GTK_TEXT_CHILD_ANCHOR
        where type 'a class_t = 'a TextChildAnchorClass.t
    structure TextIter :
      GTK_TEXT_ITER
        where type record_t = TextIterRecord.t
        where type textsearchflags_t = TextSearchFlags.t
        where type textattributesrecord_t = TextAttributesRecord.t
        where type 'a textbufferclass_t = 'a TextBufferClass.t
        where type 'a textchildanchorclass_t = 'a TextChildAnchorClass.t
        where type 'a texttagclass_t = 'a TextTagClass.t
    structure TextMark :
      GTK_TEXT_MARK
        where type 'a class_t = 'a TextMarkClass.t
        where type 'a textbufferclass_t = 'a TextBufferClass.t
    structure TextTag :
      GTK_TEXT_TAG
        where type 'a class_t = 'a TextTagClass.t
        where type textiterrecord_t = TextIterRecord.t
        where type textdirection_t = TextDirection.t
        where type justification_t = Justification.t
        where type wrapmode_t = WrapMode.t
    structure TextTagTable :
      GTK_TEXT_TAG_TABLE
        where type 'a class_t = 'a TextTagTableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a texttagclass_t = 'a TextTagClass.t
    structure ThemingEngine :
      GTK_THEMING_ENGINE
        where type 'a class_t = 'a ThemingEngineClass.t
        where type textdirection_t = TextDirection.t
        where type junctionsides_t = JunctionSides.t
        where type borderrecord_t = BorderRecord.t
        where type widgetpathrecord_t = WidgetPathRecord.t
        where type stateflags_t = StateFlags.t
        where type regionflags_t = RegionFlags.t
        where type statetype_t = StateType.t
    structure ToggleActionClass :
      GTK_TOGGLE_ACTION_CLASS
        where type 'a actionclass_t = 'a ActionClass.t
    structure ToolShell :
      GTK_TOOL_SHELL
        where type 'a class_t = 'a ToolShellClass.t
        where type reliefstyle_t = ReliefStyle.t
        where type toolbarstyle_t = ToolbarStyle.t
        where type orientation_t = Orientation.t
        where type 'a sizegroupclass_t = 'a SizeGroupClass.t
    structure Tooltip :
      GTK_TOOLTIP
        where type 'a class_t = 'a TooltipClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure TreeDragDest :
      GTK_TREE_DRAG_DEST
        where type 'a class_t = 'a TreeDragDestClass.t
        where type selectiondatarecord_t = SelectionDataRecord.t
        where type treepathrecord_t = TreePathRecord.t
    structure TreeDragSource :
      GTK_TREE_DRAG_SOURCE
        where type 'a class_t = 'a TreeDragSourceClass.t
        where type treepathrecord_t = TreePathRecord.t
    structure TreeIter :
      GTK_TREE_ITER
        where type record_t = TreeIterRecord.t
    structure TreeModel :
      GTK_TREE_MODEL
        where type 'a class_t = 'a TreeModelClass.t
        where type treemodelflags_t = TreeModelFlags.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type treepathrecord_t = TreePathRecord.t
    structure TreeModelFilter :
      GTK_TREE_MODEL_FILTER
        where type 'a class_t = 'a TreeModelFilterClass.t
        where type 'a treedragsourceclass_t = 'a TreeDragSourceClass.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
        where type treepathrecord_t = TreePathRecord.t
    structure TreeModelSort :
      GTK_TREE_MODEL_SORT
        where type 'a class_t = 'a TreeModelSortClass.t
        where type 'a treedragsourceclass_t = 'a TreeDragSourceClass.t
        where type 'a treesortableclass_t = 'a TreeSortableClass.t
        where type treepathrecord_t = TreePathRecord.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
    structure TreePath :
      GTK_TREE_PATH
        where type record_t = TreePathRecord.t
    structure TreeSortable :
      GTK_TREE_SORTABLE
        where type 'a class_t = 'a TreeSortableClass.t
        where type sorttype_t = SortType.t
    structure TreeStore :
      GTK_TREE_STORE
        where type 'a class_t = 'a TreeStoreClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a treedragdestclass_t = 'a TreeDragDestClass.t
        where type 'a treedragsourceclass_t = 'a TreeDragSourceClass.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
        where type 'a treesortableclass_t = 'a TreeSortableClass.t
        where type treeiterrecord_t = TreeIterRecord.t
    structure TreeViewColumn :
      GTK_TREE_VIEW_COLUMN
        where type 'a class_t = 'a TreeViewColumnClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
        where type 'a cellareaclass_t = 'a CellAreaClass.t
        where type treeviewcolumnsizing_t = TreeViewColumnSizing.t
        where type sorttype_t = SortType.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure UIManager :
      GTK_U_I_MANAGER
        where type 'a class_t = 'a UIManagerClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type uimanageritemtype_t = UIManagerItemType.t
        where type 'a accelgroupclass_t = 'a AccelGroupClass.t
        where type 'a actiongroupclass_t = 'a ActionGroupClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a actionclass_t = 'a ActionClass.t
    structure WidgetPath :
      GTK_WIDGET_PATH
        where type record_t = WidgetPathRecord.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type regionflags_t = RegionFlags.t
    structure ActionGroup :
      GTK_ACTION_GROUP
        where type 'a class_t = 'a ActionGroupClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type actionentry_t = ActionEntry.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a actionclass_t = 'a ActionClass.t
    structure ArrowClass :
      GTK_ARROW_CLASS
        where type 'a miscclass_t = 'a MiscClass.t
    structure BinClass :
      GTK_BIN_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure BoxClass :
      GTK_BOX_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure Calendar :
      GTK_CALENDAR
        where type 'a class_t = 'a CalendarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type calendardisplayoptions_t = CalendarDisplayOptions.t
    structure CellAreaBox :
      GTK_CELL_AREA_BOX
        where type 'a class_t = 'a CellAreaBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
    structure CellRendererAccelClass :
      GTK_CELL_RENDERER_ACCEL_CLASS
        where type 'a cellrenderertextclass_t = 'a CellRendererTextClass.t
    structure CellRendererComboClass :
      GTK_CELL_RENDERER_COMBO_CLASS
        where type 'a cellrenderertextclass_t = 'a CellRendererTextClass.t
    structure CellRendererPixbuf :
      GTK_CELL_RENDERER_PIXBUF
        where type 'a class_t = 'a CellRendererPixbufClass.t
    structure CellRendererProgress :
      GTK_CELL_RENDERER_PROGRESS
        where type 'a class_t = 'a CellRendererProgressClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure CellRendererSpinClass :
      GTK_CELL_RENDERER_SPIN_CLASS
        where type 'a cellrenderertextclass_t = 'a CellRendererTextClass.t
    structure CellRendererSpinner :
      GTK_CELL_RENDERER_SPINNER
        where type 'a class_t = 'a CellRendererSpinnerClass.t
        where type iconsize_t = IconSize.t
    structure CellRendererText :
      GTK_CELL_RENDERER_TEXT
        where type 'a class_t = 'a CellRendererTextClass.t
    structure CellRendererToggle :
      GTK_CELL_RENDERER_TOGGLE
        where type 'a class_t = 'a CellRendererToggleClass.t
    structure CellView :
      GTK_CELL_VIEW
        where type 'a class_t = 'a CellViewClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type treepathrecord_t = TreePathRecord.t
        where type 'a cellareaclass_t = 'a CellAreaClass.t
        where type 'a cellareacontextclass_t = 'a CellAreaContextClass.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
    structure Container :
      GTK_CONTAINER
        where type 'a class_t = 'a ContainerClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type widgetpathrecord_t = WidgetPathRecord.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type resizemode_t = ResizeMode.t
    structure DrawingArea :
      GTK_DRAWING_AREA
        where type 'a class_t = 'a DrawingAreaClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure FixedClass :
      GTK_FIXED_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure GridClass :
      GTK_GRID_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure Hsv :
      GTK_HSV
        where type 'a class_t = 'a HsvClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type directiontype_t = DirectionType.t
    structure HSeparatorClass :
      GTK_H_SEPARATOR_CLASS
        where type 'a separatorclass_t = 'a SeparatorClass.t
    structure IMContextSimple :
      GTK_I_M_CONTEXT_SIMPLE
        where type 'a class_t = 'a IMContextSimpleClass.t
    structure IconViewClass :
      GTK_ICON_VIEW_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure ImageClass :
      GTK_IMAGE_CLASS
        where type 'a miscclass_t = 'a MiscClass.t
    structure Invisible :
      GTK_INVISIBLE
        where type 'a class_t = 'a InvisibleClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure LabelClass :
      GTK_LABEL_CLASS
        where type 'a miscclass_t = 'a MiscClass.t
    structure LayoutClass :
      GTK_LAYOUT_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure MenuShellClass :
      GTK_MENU_SHELL_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure Misc :
      GTK_MISC
        where type 'a class_t = 'a MiscClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure NotebookClass :
      GTK_NOTEBOOK_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure PanedClass :
      GTK_PANED_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure ProgressBar :
      GTK_PROGRESS_BAR
        where type 'a class_t = 'a ProgressBarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure RadioActionClass :
      GTK_RADIO_ACTION_CLASS
        where type 'a toggleactionclass_t = 'a ToggleActionClass.t
    structure Range :
      GTK_RANGE
        where type 'a class_t = 'a RangeClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type scrolltype_t = ScrollType.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type sensitivitytype_t = SensitivityType.t
    structure RecentAction :
      GTK_RECENT_ACTION
        where type 'a class_t = 'a RecentActionClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a recentchooserclass_t = 'a RecentChooserClass.t
        where type 'a recentmanagerclass_t = 'a RecentManagerClass.t
    structure ScaleClass :
      GTK_SCALE_CLASS
        where type 'a rangeclass_t = 'a RangeClass.t
    structure ScrollbarClass :
      GTK_SCROLLBAR_CLASS
        where type 'a rangeclass_t = 'a RangeClass.t
    structure Separator :
      GTK_SEPARATOR
        where type 'a class_t = 'a SeparatorClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type orientation_t = Orientation.t
    structure Settings :
      GTK_SETTINGS
        where type 'a class_t = 'a SettingsClass.t
        where type 'a styleproviderclass_t = 'a StyleProviderClass.t
        where type settingsvaluerecord_t = SettingsValueRecord.t
        where type impreeditstyle_t = IMPreeditStyle.t
        where type imstatusstyle_t = IMStatusStyle.t
        where type cornertype_t = CornerType.t
        where type iconsize_t = IconSize.t
        where type toolbarstyle_t = ToolbarStyle.t
        where type policytype_t = PolicyType.t
    structure SocketClass :
      GTK_SOCKET_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure SpinButtonClass :
      GTK_SPIN_BUTTON_CLASS
        where type 'a entryclass_t = 'a EntryClass.t
    structure Spinner :
      GTK_SPINNER
        where type 'a class_t = 'a SpinnerClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure Switch :
      GTK_SWITCH
        where type 'a class_t = 'a SwitchClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure TableClass :
      GTK_TABLE_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure TextViewClass :
      GTK_TEXT_VIEW_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure ToggleAction :
      GTK_TOGGLE_ACTION
        where type 'a class_t = 'a ToggleActionClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure ToolItemGroupClass :
      GTK_TOOL_ITEM_GROUP_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure ToolPaletteClass :
      GTK_TOOL_PALETTE_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure ToolbarClass :
      GTK_TOOLBAR_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure TreeViewClass :
      GTK_TREE_VIEW_CLASS
        where type 'a containerclass_t = 'a ContainerClass.t
    structure VSeparatorClass :
      GTK_V_SEPARATOR_CLASS
        where type 'a separatorclass_t = 'a SeparatorClass.t
    structure AccelLabelClass :
      GTK_ACCEL_LABEL_CLASS
        where type 'a labelclass_t = 'a LabelClass.t
    structure AlignmentClass :
      GTK_ALIGNMENT_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure AppChooserWidgetClass :
      GTK_APP_CHOOSER_WIDGET_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure Arrow :
      GTK_ARROW
        where type 'a class_t = 'a ArrowClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type arrowtype_t = ArrowType.t
        where type shadowtype_t = ShadowType.t
    structure Bin :
      GTK_BIN
        where type 'a class_t = 'a BinClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure Box :
      GTK_BOX
        where type 'a class_t = 'a BoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type orientation_t = Orientation.t
        where type packtype_t = PackType.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure ButtonClass :
      GTK_BUTTON_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure ButtonBoxClass :
      GTK_BUTTON_BOX_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure CellRendererAccel :
      GTK_CELL_RENDERER_ACCEL
        where type 'a class_t = 'a CellRendererAccelClass.t
        where type cellrendereraccelmode_t = CellRendererAccelMode.t
    structure CellRendererCombo :
      GTK_CELL_RENDERER_COMBO
        where type 'a class_t = 'a CellRendererComboClass.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
    structure CellRendererSpin :
      GTK_CELL_RENDERER_SPIN
        where type 'a class_t = 'a CellRendererSpinClass.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
    structure ColorSelectionClass :
      GTK_COLOR_SELECTION_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure ComboBoxClass :
      GTK_COMBO_BOX_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure EventBoxClass :
      GTK_EVENT_BOX_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure ExpanderClass :
      GTK_EXPANDER_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure FileChooserButtonClass :
      GTK_FILE_CHOOSER_BUTTON_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure FileChooserWidgetClass :
      GTK_FILE_CHOOSER_WIDGET_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure Fixed :
      GTK_FIXED
        where type 'a class_t = 'a FixedClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure FontChooserWidgetClass :
      GTK_FONT_CHOOSER_WIDGET_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure FontSelectionClass :
      GTK_FONT_SELECTION_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure FrameClass :
      GTK_FRAME_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure Grid :
      GTK_GRID
        where type 'a class_t = 'a GridClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type positiontype_t = PositionType.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure HBoxClass :
      GTK_H_BOX_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure HPanedClass :
      GTK_H_PANED_CLASS
        where type 'a panedclass_t = 'a PanedClass.t
    structure HScaleClass :
      GTK_H_SCALE_CLASS
        where type 'a scaleclass_t = 'a ScaleClass.t
    structure HScrollbarClass :
      GTK_H_SCROLLBAR_CLASS
        where type 'a scrollbarclass_t = 'a ScrollbarClass.t
    structure HSeparator :
      GTK_H_SEPARATOR
        where type 'a class_t = 'a HSeparatorClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure HandleBoxClass :
      GTK_HANDLE_BOX_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure IMMulticontext :
      GTK_I_M_MULTICONTEXT
        where type 'a class_t = 'a IMMulticontextClass.t
        where type 'a menushellclass_t = 'a MenuShellClass.t
    structure IconView :
      GTK_ICON_VIEW
        where type 'a class_t = 'a IconViewClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
        where type 'a scrollableclass_t = 'a ScrollableClass.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type iconviewdropposition_t = IconViewDropPosition.t
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
        where type 'a tooltipclass_t = 'a TooltipClass.t
        where type treepathrecord_t = TreePathRecord.t
        where type movementstep_t = MovementStep.t
        where type 'a cellareaclass_t = 'a CellAreaClass.t
        where type orientation_t = Orientation.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
        where type selectionmode_t = SelectionMode.t
    structure Image :
      GTK_IMAGE
        where type 'a class_t = 'a ImageClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type iconsetrecord_t = IconSetRecord.t
        where type imagetype_t = ImageType.t
    structure InfoBarClass :
      GTK_INFO_BAR_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure Layout :
      GTK_LAYOUT
        where type 'a class_t = 'a LayoutClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a scrollableclass_t = 'a ScrollableClass.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure MenuClass :
      GTK_MENU_CLASS
        where type 'a menushellclass_t = 'a MenuShellClass.t
    structure MenuBarClass :
      GTK_MENU_BAR_CLASS
        where type 'a menushellclass_t = 'a MenuShellClass.t
    structure MenuItemClass :
      GTK_MENU_ITEM_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure MenuShell :
      GTK_MENU_SHELL
        where type 'a class_t = 'a MenuShellClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type directiontype_t = DirectionType.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type menudirectiontype_t = MenuDirectionType.t
    structure Notebook :
      GTK_NOTEBOOK
        where type 'a class_t = 'a NotebookClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type packtype_t = PackType.t
        where type notebooktab_t = NotebookTab.t
        where type directiontype_t = DirectionType.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type positiontype_t = PositionType.t
    structure OverlayClass :
      GTK_OVERLAY_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure Paned :
      GTK_PANED
        where type 'a class_t = 'a PanedClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type orientation_t = Orientation.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type scrolltype_t = ScrollType.t
    structure RadioAction :
      GTK_RADIO_ACTION
        where type 'a class_t = 'a RadioActionClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure RecentChooserWidgetClass :
      GTK_RECENT_CHOOSER_WIDGET_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure Scale :
      GTK_SCALE
        where type 'a class_t = 'a ScaleClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type orientation_t = Orientation.t
        where type positiontype_t = PositionType.t
    structure Scrollbar :
      GTK_SCROLLBAR
        where type 'a class_t = 'a ScrollbarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type orientation_t = Orientation.t
    structure ScrolledWindowClass :
      GTK_SCROLLED_WINDOW_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure Socket :
      GTK_SOCKET
        where type 'a class_t = 'a SocketClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure SpinButton :
      GTK_SPIN_BUTTON
        where type 'a class_t = 'a SpinButtonClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celleditableclass_t = 'a CellEditableClass.t
        where type 'a editableclass_t = 'a EditableClass.t
        where type spintype_t = SpinType.t
        where type scrolltype_t = ScrollType.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type spinbuttonupdatepolicy_t = SpinButtonUpdatePolicy.t
    structure StatusbarClass :
      GTK_STATUSBAR_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure Table :
      GTK_TABLE
        where type 'a class_t = 'a TableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type attachoptions_t = AttachOptions.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure ToolItemClass :
      GTK_TOOL_ITEM_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure TreeSelection :
      GTK_TREE_SELECTION
        where type 'a class_t = 'a TreeSelectionClass.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
        where type 'a treeviewclass_t = 'a TreeViewClass.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type treepathrecord_t = TreePathRecord.t
        where type selectionmode_t = SelectionMode.t
    structure TreeView :
      GTK_TREE_VIEW
        where type 'a class_t = 'a TreeViewClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a scrollableclass_t = 'a ScrollableClass.t
        where type 'a treeselectionclass_t = 'a TreeSelectionClass.t
        where type treeviewdropposition_t = TreeViewDropPosition.t
        where type 'a entryclass_t = 'a EntryClass.t
        where type 'a cellrendererclass_t = 'a CellRendererClass.t
        where type 'a tooltipclass_t = 'a TooltipClass.t
        where type movementstep_t = MovementStep.t
        where type treepathrecord_t = TreePathRecord.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type treeviewgridlines_t = TreeViewGridLines.t
        where type 'a treeviewcolumnclass_t = 'a TreeViewColumnClass.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
    structure VBoxClass :
      GTK_V_BOX_CLASS
        where type 'a boxclass_t = 'a BoxClass.t
    structure VPanedClass :
      GTK_V_PANED_CLASS
        where type 'a panedclass_t = 'a PanedClass.t
    structure VScaleClass :
      GTK_V_SCALE_CLASS
        where type 'a scaleclass_t = 'a ScaleClass.t
    structure VScrollbarClass :
      GTK_V_SCROLLBAR_CLASS
        where type 'a scrollbarclass_t = 'a ScrollbarClass.t
    structure VSeparator :
      GTK_V_SEPARATOR
        where type 'a class_t = 'a VSeparatorClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure ViewportClass :
      GTK_VIEWPORT_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure WindowClass :
      GTK_WINDOW_CLASS
        where type 'a binclass_t = 'a BinClass.t
    structure ScrolledWindow :
      GTK_SCROLLED_WINDOW
        where type 'a class_t = 'a ScrolledWindowClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type directiontype_t = DirectionType.t
        where type scrolltype_t = ScrollType.t
        where type shadowtype_t = ShadowType.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type policytype_t = PolicyType.t
        where type cornertype_t = CornerType.t
        where type ('widget, 'a) styleproperty_readonly = ('widget, 'a) styleproperty_readonly
    structure AccelLabel :
      GTK_ACCEL_LABEL
        where type 'a class_t = 'a AccelLabelClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure Alignment :
      GTK_ALIGNMENT
        where type 'a class_t = 'a AlignmentClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure AppChooserButtonClass :
      GTK_APP_CHOOSER_BUTTON_CLASS
        where type 'a comboboxclass_t = 'a ComboBoxClass.t
    structure AppChooserWidget :
      GTK_APP_CHOOSER_WIDGET
        where type 'a class_t = 'a AppChooserWidgetClass.t
        where type 'a appchooserclass_t = 'a AppChooserClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a menuclass_t = 'a MenuClass.t
    structure Application :
      GTK_APPLICATION
        where type 'a class_t = 'a ApplicationClass.t
        where type 'a windowclass_t = 'a WindowClass.t
    structure AspectFrameClass :
      GTK_ASPECT_FRAME_CLASS
        where type 'a frameclass_t = 'a FrameClass.t
    structure AssistantClass :
      GTK_ASSISTANT_CLASS
        where type 'a windowclass_t = 'a WindowClass.t
    structure Button :
      GTK_BUTTON
        where type 'a class_t = 'a ButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type positiontype_t = PositionType.t
        where type reliefstyle_t = ReliefStyle.t
    structure ButtonBox :
      GTK_BUTTON_BOX
        where type 'a class_t = 'a ButtonBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type orientation_t = Orientation.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type buttonboxstyle_t = ButtonBoxStyle.t
    structure CheckMenuItemClass :
      GTK_CHECK_MENU_ITEM_CLASS
        where type 'a menuitemclass_t = 'a MenuItemClass.t
    structure ColorButtonClass :
      GTK_COLOR_BUTTON_CLASS
        where type 'a buttonclass_t = 'a ButtonClass.t
    structure ColorSelection :
      GTK_COLOR_SELECTION
        where type 'a class_t = 'a ColorSelectionClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure ComboBox :
      GTK_COMBO_BOX
        where type 'a class_t = 'a ComboBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celleditableclass_t = 'a CellEditableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
        where type treeiterrecord_t = TreeIterRecord.t
        where type scrolltype_t = ScrollType.t
        where type sensitivitytype_t = SensitivityType.t
        where type 'a cellareaclass_t = 'a CellAreaClass.t
        where type 'a treemodelclass_t = 'a TreeModelClass.t
    structure ComboBoxTextClass :
      GTK_COMBO_BOX_TEXT_CLASS
        where type 'a comboboxclass_t = 'a ComboBoxClass.t
    structure DialogClass :
      GTK_DIALOG_CLASS
        where type 'a windowclass_t = 'a WindowClass.t
    structure Entry :
      GTK_ENTRY
        where type 'a class_t = 'a EntryClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celleditableclass_t = 'a CellEditableClass.t
        where type 'a editableclass_t = 'a EditableClass.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type targetlistrecord_t = TargetListRecord.t
        where type deletetype_t = DeleteType.t
        where type entryiconposition_t = EntryIconPosition.t
        where type movementstep_t = MovementStep.t
        where type 'a menuclass_t = 'a MenuClass.t
        where type 'a entrybufferclass_t = 'a EntryBufferClass.t
        where type 'a entrycompletionclass_t = 'a EntryCompletionClass.t
        where type borderrecord_t = BorderRecord.t
        where type imagetype_t = ImageType.t
        where type shadowtype_t = ShadowType.t
    structure EventBox :
      GTK_EVENT_BOX
        where type 'a class_t = 'a EventBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure Expander :
      GTK_EXPANDER
        where type 'a class_t = 'a ExpanderClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure FileChooserButton :
      GTK_FILE_CHOOSER_BUTTON
        where type 'a class_t = 'a FileChooserButtonClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type filechooseraction_t = FileChooserAction.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a filechooserclass_t = 'a FileChooserClass.t
    structure FileChooserWidget :
      GTK_FILE_CHOOSER_WIDGET
        where type 'a class_t = 'a FileChooserWidgetClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a filechooserclass_t = 'a FileChooserClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type filechooseraction_t = FileChooserAction.t
    structure FontButtonClass :
      GTK_FONT_BUTTON_CLASS
        where type 'a buttonclass_t = 'a ButtonClass.t
    structure FontChooserWidget :
      GTK_FONT_CHOOSER_WIDGET
        where type 'a class_t = 'a FontChooserWidgetClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a fontchooserclass_t = 'a FontChooserClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure FontSelection :
      GTK_FONT_SELECTION
        where type 'a class_t = 'a FontSelectionClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure Frame :
      GTK_FRAME
        where type 'a class_t = 'a FrameClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type shadowtype_t = ShadowType.t
    structure HBox :
      GTK_H_BOX
        where type 'a class_t = 'a HBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure HButtonBoxClass :
      GTK_H_BUTTON_BOX_CLASS
        where type 'a buttonboxclass_t = 'a ButtonBoxClass.t
    structure HPaned :
      GTK_H_PANED
        where type 'a class_t = 'a HPanedClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure HScale :
      GTK_H_SCALE
        where type 'a class_t = 'a HScaleClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure HScrollbar :
      GTK_H_SCROLLBAR
        where type 'a class_t = 'a HScrollbarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure HandleBox :
      GTK_HANDLE_BOX
        where type 'a class_t = 'a HandleBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type shadowtype_t = ShadowType.t
        where type positiontype_t = PositionType.t
    structure ImageMenuItemClass :
      GTK_IMAGE_MENU_ITEM_CLASS
        where type 'a menuitemclass_t = 'a MenuItemClass.t
    structure InfoBar :
      GTK_INFO_BAR
        where type 'a class_t = 'a InfoBarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type messagetype_t = MessageType.t
    structure Label :
      GTK_LABEL
        where type 'a class_t = 'a LabelClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type movementstep_t = MovementStep.t
        where type 'a menuclass_t = 'a MenuClass.t
        where type justification_t = Justification.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure LinkButtonClass :
      GTK_LINK_BUTTON_CLASS
        where type 'a buttonclass_t = 'a ButtonClass.t
    structure LockButtonClass :
      GTK_LOCK_BUTTON_CLASS
        where type 'a buttonclass_t = 'a ButtonClass.t
    structure Menu :
      GTK_MENU
        where type 'a class_t = 'a MenuClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type scrolltype_t = ScrollType.t
        where type 'a accelgroupclass_t = 'a AccelGroupClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure MenuBar :
      GTK_MENU_BAR
        where type 'a class_t = 'a MenuBarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type packdirection_t = PackDirection.t
    structure MenuItem :
      GTK_MENU_ITEM
        where type 'a class_t = 'a MenuItemClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a menuclass_t = 'a MenuClass.t
    structure MountOperation :
      GTK_MOUNT_OPERATION
        where type 'a class_t = 'a MountOperationClass.t
        where type 'a windowclass_t = 'a WindowClass.t
    structure OffscreenWindowClass :
      GTK_OFFSCREEN_WINDOW_CLASS
        where type 'a windowclass_t = 'a WindowClass.t
    structure Overlay :
      GTK_OVERLAY
        where type 'a class_t = 'a OverlayClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure PlugClass :
      GTK_PLUG_CLASS
        where type 'a windowclass_t = 'a WindowClass.t
    structure PrintOperation :
      GTK_PRINT_OPERATION
        where type 'a class_t = 'a PrintOperationClass.t
        where type printoperationaction_t = PrintOperationAction.t
        where type printoperationresult_t = PrintOperationResult.t
        where type 'a windowclass_t = 'a WindowClass.t
        where type 'a printoperationpreviewclass_t = 'a PrintOperationPreviewClass.t
        where type 'a printcontextclass_t = 'a PrintContextClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a pagesetupclass_t = 'a PageSetupClass.t
        where type 'a printsettingsclass_t = 'a PrintSettingsClass.t
        where type printstatus_t = PrintStatus.t
        where type unit_t = Unit.t
    structure RecentChooserMenuClass :
      GTK_RECENT_CHOOSER_MENU_CLASS
        where type 'a menuclass_t = 'a MenuClass.t
    structure RecentChooserWidget :
      GTK_RECENT_CHOOSER_WIDGET
        where type 'a class_t = 'a RecentChooserWidgetClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a recentchooserclass_t = 'a RecentChooserClass.t
        where type 'a recentmanagerclass_t = 'a RecentManagerClass.t
    structure ScaleButtonClass :
      GTK_SCALE_BUTTON_CLASS
        where type 'a buttonclass_t = 'a ButtonClass.t
    structure SeparatorMenuItemClass :
      GTK_SEPARATOR_MENU_ITEM_CLASS
        where type 'a menuitemclass_t = 'a MenuItemClass.t
    structure SeparatorToolItemClass :
      GTK_SEPARATOR_TOOL_ITEM_CLASS
        where type 'a toolitemclass_t = 'a ToolItemClass.t
    structure StatusIcon :
      GTK_STATUS_ICON
        where type 'a class_t = 'a StatusIconClass.t
        where type 'a menuclass_t = 'a MenuClass.t
        where type 'a tooltipclass_t = 'a TooltipClass.t
        where type orientation_t = Orientation.t
        where type imagetype_t = ImageType.t
    structure Statusbar :
      GTK_STATUSBAR
        where type 'a class_t = 'a StatusbarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure TearoffMenuItemClass :
      GTK_TEAROFF_MENU_ITEM_CLASS
        where type 'a menuitemclass_t = 'a MenuItemClass.t
    structure TextView :
      GTK_TEXT_VIEW
        where type 'a class_t = 'a TextViewClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a scrollableclass_t = 'a ScrollableClass.t
        where type 'a textchildanchorclass_t = 'a TextChildAnchorClass.t
        where type textattributesrecord_t = TextAttributesRecord.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a textmarkclass_t = 'a TextMarkClass.t
        where type textiterrecord_t = TextIterRecord.t
        where type textwindowtype_t = TextWindowType.t
        where type deletetype_t = DeleteType.t
        where type movementstep_t = MovementStep.t
        where type scrollstep_t = ScrollStep.t
        where type 'a menuclass_t = 'a MenuClass.t
        where type 'a textbufferclass_t = 'a TextBufferClass.t
        where type justification_t = Justification.t
        where type wrapmode_t = WrapMode.t
    structure ToggleButtonClass :
      GTK_TOGGLE_BUTTON_CLASS
        where type 'a buttonclass_t = 'a ButtonClass.t
    structure ToolButtonClass :
      GTK_TOOL_BUTTON_CLASS
        where type 'a toolitemclass_t = 'a ToolItemClass.t
    structure ToolItem :
      GTK_TOOL_ITEM
        where type 'a class_t = 'a ToolItemClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type reliefstyle_t = ReliefStyle.t
        where type orientation_t = Orientation.t
        where type 'a sizegroupclass_t = 'a SizeGroupClass.t
        where type toolbarstyle_t = ToolbarStyle.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure ToolItemGroup :
      GTK_TOOL_ITEM_GROUP
        where type 'a class_t = 'a ToolItemGroupClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a toolshellclass_t = 'a ToolShellClass.t
        where type 'a toolitemclass_t = 'a ToolItemClass.t
        where type reliefstyle_t = ReliefStyle.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure ToolPalette :
      GTK_TOOL_PALETTE
        where type 'a class_t = 'a ToolPaletteClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a scrollableclass_t = 'a ScrollableClass.t
        where type targetentryrecord_t = TargetEntryRecord.t
        where type destdefaults_t = DestDefaults.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type selectiondatarecord_t = SelectionDataRecord.t
        where type 'a toolitemclass_t = 'a ToolItemClass.t
        where type toolpalettedragtargets_t = ToolPaletteDragTargets.t
        where type 'a toolitemgroupclass_t = 'a ToolItemGroupClass.t
        where type iconsize_t = IconSize.t
        where type toolbarstyle_t = ToolbarStyle.t
    structure Toolbar :
      GTK_TOOLBAR
        where type 'a class_t = 'a ToolbarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a toolshellclass_t = 'a ToolShellClass.t
        where type reliefstyle_t = ReliefStyle.t
        where type 'a toolitemclass_t = 'a ToolItemClass.t
        where type orientation_t = Orientation.t
        where type toolbarstyle_t = ToolbarStyle.t
    structure VBox :
      GTK_V_BOX
        where type 'a class_t = 'a VBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure VButtonBoxClass :
      GTK_V_BUTTON_BOX_CLASS
        where type 'a buttonboxclass_t = 'a ButtonBoxClass.t
    structure VPaned :
      GTK_V_PANED
        where type 'a class_t = 'a VPanedClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure VScale :
      GTK_V_SCALE
        where type 'a class_t = 'a VScaleClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure VScrollbar :
      GTK_V_SCROLLBAR
        where type 'a class_t = 'a VScrollbarClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure Viewport :
      GTK_VIEWPORT
        where type 'a class_t = 'a ViewportClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a scrollableclass_t = 'a ScrollableClass.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type shadowtype_t = ShadowType.t
    structure Widget :
      GTK_WIDGET
        where type 'a class_t = 'a WidgetClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type accelflags_t = AccelFlags.t
        where type orientation_t = Orientation.t
        where type targetlistrecord_t = TargetListRecord.t
        where type 'a clipboardclass_t = 'a ClipboardClass.t
        where type widgetpathrecord_t = WidgetPathRecord.t
        where type requisitionrecord_t = RequisitionRecord.t
        where type sizerequestmode_t = SizeRequestMode.t
        where type 'a settingsclass_t = 'a SettingsClass.t
        where type 'a stylecontextclass_t = 'a StyleContextClass.t
        where type 'a rcstyleclass_t = 'a RcStyleClass.t
        where type 'a accelgroupclass_t = 'a AccelGroupClass.t
        where type 'a windowclass_t = 'a WindowClass.t
        where type textdirection_t = TextDirection.t
        where type dragresult_t = DragResult.t
        where type directiontype_t = DirectionType.t
        where type 'a tooltipclass_t = 'a TooltipClass.t
        where type selectiondatarecord_t = SelectionDataRecord.t
        where type widgethelptype_t = WidgetHelpType.t
        where type statetype_t = StateType.t
        where type stateflags_t = StateFlags.t
        where type 'a containerclass_t = 'a ContainerClass.t
        where type 'a styleclass_t = 'a StyleClass.t
        where type align_t = Align.t
    structure Window :
      GTK_WINDOW
        where type 'a class_t = 'a WindowClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a windowgroupclass_t = 'a WindowGroupClass.t
        where type 'a accelgroupclass_t = 'a AccelGroupClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a applicationclass_t = 'a ApplicationClass.t
        where type windowtype_t = WindowType.t
        where type windowposition_t = WindowPosition.t
    structure WindowGroup :
      GTK_WINDOW_GROUP
        where type 'a class_t = 'a WindowGroupClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a windowclass_t = 'a WindowClass.t
    structure AboutDialogClass :
      GTK_ABOUT_DIALOG_CLASS
        where type 'a dialogclass_t = 'a DialogClass.t
    structure AppChooserButton :
      GTK_APP_CHOOSER_BUTTON
        where type 'a class_t = 'a AppChooserButtonClass.t
        where type 'a appchooserclass_t = 'a AppChooserClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celleditableclass_t = 'a CellEditableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
    structure AppChooserDialogClass :
      GTK_APP_CHOOSER_DIALOG_CLASS
        where type 'a dialogclass_t = 'a DialogClass.t
    structure AspectFrame :
      GTK_ASPECT_FRAME
        where type 'a class_t = 'a AspectFrameClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure Assistant :
      GTK_ASSISTANT
        where type 'a class_t = 'a AssistantClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type assistantpagetype_t = AssistantPageType.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure CheckButtonClass :
      GTK_CHECK_BUTTON_CLASS
        where type 'a togglebuttonclass_t = 'a ToggleButtonClass.t
    structure CheckMenuItem :
      GTK_CHECK_MENU_ITEM
        where type 'a class_t = 'a CheckMenuItemClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure ColorButton :
      GTK_COLOR_BUTTON
        where type 'a class_t = 'a ColorButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure ColorSelectionDialogClass :
      GTK_COLOR_SELECTION_DIALOG_CLASS
        where type 'a dialogclass_t = 'a DialogClass.t
    structure ComboBoxText :
      GTK_COMBO_BOX_TEXT
        where type 'a class_t = 'a ComboBoxTextClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a celleditableclass_t = 'a CellEditableClass.t
        where type 'a celllayoutclass_t = 'a CellLayoutClass.t
    structure Dialog :
      GTK_DIALOG
        where type 'a class_t = 'a DialogClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure FileChooserDialogClass :
      GTK_FILE_CHOOSER_DIALOG_CLASS
        where type 'a dialogclass_t = 'a DialogClass.t
    structure FontButton :
      GTK_FONT_BUTTON
        where type 'a class_t = 'a FontButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a fontchooserclass_t = 'a FontChooserClass.t
    structure FontChooserDialogClass :
      GTK_FONT_CHOOSER_DIALOG_CLASS
        where type 'a dialogclass_t = 'a DialogClass.t
    structure FontSelectionDialogClass :
      GTK_FONT_SELECTION_DIALOG_CLASS
        where type 'a dialogclass_t = 'a DialogClass.t
    structure HButtonBox :
      GTK_H_BUTTON_BOX
        where type 'a class_t = 'a HButtonBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure ImageMenuItem :
      GTK_IMAGE_MENU_ITEM
        where type 'a class_t = 'a ImageMenuItemClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a accelgroupclass_t = 'a AccelGroupClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure LinkButton :
      GTK_LINK_BUTTON
        where type 'a class_t = 'a LinkButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure LockButton :
      GTK_LOCK_BUTTON
        where type 'a class_t = 'a LockButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure MenuToolButtonClass :
      GTK_MENU_TOOL_BUTTON_CLASS
        where type 'a toolbuttonclass_t = 'a ToolButtonClass.t
    structure MessageDialogClass :
      GTK_MESSAGE_DIALOG_CLASS
        where type 'a dialogclass_t = 'a DialogClass.t
    structure OffscreenWindow :
      GTK_OFFSCREEN_WINDOW
        where type 'a class_t = 'a OffscreenWindowClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure Plug :
      GTK_PLUG
        where type 'a class_t = 'a PlugClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure RadioMenuItemClass :
      GTK_RADIO_MENU_ITEM_CLASS
        where type 'a checkmenuitemclass_t = 'a CheckMenuItemClass.t
    structure RecentChooserDialogClass :
      GTK_RECENT_CHOOSER_DIALOG_CLASS
        where type 'a dialogclass_t = 'a DialogClass.t
    structure RecentChooserMenu :
      GTK_RECENT_CHOOSER_MENU
        where type 'a class_t = 'a RecentChooserMenuClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a recentchooserclass_t = 'a RecentChooserClass.t
        where type 'a recentmanagerclass_t = 'a RecentManagerClass.t
    structure ScaleButton :
      GTK_SCALE_BUTTON
        where type 'a class_t = 'a ScaleButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a adjustmentclass_t = 'a AdjustmentClass.t
        where type iconsize_t = IconSize.t
    structure SeparatorMenuItem :
      GTK_SEPARATOR_MENU_ITEM
        where type 'a class_t = 'a SeparatorMenuItemClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure SeparatorToolItem :
      GTK_SEPARATOR_TOOL_ITEM
        where type 'a class_t = 'a SeparatorToolItemClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure TearoffMenuItem :
      GTK_TEAROFF_MENU_ITEM
        where type 'a class_t = 'a TearoffMenuItemClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure ToggleButton :
      GTK_TOGGLE_BUTTON
        where type 'a class_t = 'a ToggleButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure ToggleToolButtonClass :
      GTK_TOGGLE_TOOL_BUTTON_CLASS
        where type 'a toolbuttonclass_t = 'a ToolButtonClass.t
    structure ToolButton :
      GTK_TOOL_BUTTON
        where type 'a class_t = 'a ToolButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure VButtonBox :
      GTK_V_BUTTON_BOX
        where type 'a class_t = 'a VButtonBoxClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure VolumeButtonClass :
      GTK_VOLUME_BUTTON_CLASS
        where type 'a scalebuttonclass_t = 'a ScaleButtonClass.t
    structure AboutDialog :
      GTK_ABOUT_DIALOG
        where type 'a class_t = 'a AboutDialogClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type license_t = License.t
    structure AppChooserDialog :
      GTK_APP_CHOOSER_DIALOG
        where type 'a class_t = 'a AppChooserDialogClass.t
        where type 'a appchooserclass_t = 'a AppChooserClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type dialogflags_t = DialogFlags.t
        where type 'a windowclass_t = 'a WindowClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure CheckButton :
      GTK_CHECK_BUTTON
        where type 'a class_t = 'a CheckButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure ColorSelectionDialog :
      GTK_COLOR_SELECTION_DIALOG
        where type 'a class_t = 'a ColorSelectionDialogClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
    structure FileChooserDialog :
      GTK_FILE_CHOOSER_DIALOG
        where type 'a class_t = 'a FileChooserDialogClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a filechooserclass_t = 'a FileChooserClass.t
    structure FontChooserDialog :
      GTK_FONT_CHOOSER_DIALOG
        where type 'a class_t = 'a FontChooserDialogClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a fontchooserclass_t = 'a FontChooserClass.t
        where type 'a windowclass_t = 'a WindowClass.t
    structure FontSelectionDialog :
      GTK_FONT_SELECTION_DIALOG
        where type 'a class_t = 'a FontSelectionDialogClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure MenuToolButton :
      GTK_MENU_TOOL_BUTTON
        where type 'a class_t = 'a MenuToolButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type 'a menuclass_t = 'a MenuClass.t
    structure MessageDialog :
      GTK_MESSAGE_DIALOG
        where type 'a class_t = 'a MessageDialogClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type buttonstype_t = ButtonsType.t
        where type 'a widgetclass_t = 'a WidgetClass.t
        where type messagetype_t = MessageType.t
    structure RadioButtonClass :
      GTK_RADIO_BUTTON_CLASS
        where type 'a checkbuttonclass_t = 'a CheckButtonClass.t
    structure RadioMenuItem :
      GTK_RADIO_MENU_ITEM
        where type 'a class_t = 'a RadioMenuItemClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure RadioToolButtonClass :
      GTK_RADIO_TOOL_BUTTON_CLASS
        where type 'a toggletoolbuttonclass_t = 'a ToggleToolButtonClass.t
    structure RecentChooserDialog :
      GTK_RECENT_CHOOSER_DIALOG
        where type 'a class_t = 'a RecentChooserDialogClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a recentchooserclass_t = 'a RecentChooserClass.t
    structure ToggleToolButton :
      GTK_TOGGLE_TOOL_BUTTON
        where type 'a class_t = 'a ToggleToolButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure VolumeButton :
      GTK_VOLUME_BUTTON
        where type 'a class_t = 'a VolumeButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
        where type 'a orientableclass_t = 'a OrientableClass.t
    structure RadioButton :
      GTK_RADIO_BUTTON
        where type 'a class_t = 'a RadioButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    structure RadioToolButton :
      GTK_RADIO_TOOL_BUTTON
        where type 'a class_t = 'a RadioToolButtonClass.t
        where type 'a activatableclass_t = 'a ActivatableClass.t
        where type 'a buildableclass_t = 'a BuildableClass.t
    val BINARY_AGE : LargeInt.int
    val INPUT_ERROR : LargeInt.int
    val INTERFACE_AGE : LargeInt.int
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
    val PRINT_SETTINGS_OUTPUT_BIN : string
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
    val STYLE_CLASS_BACKGROUND : string
    val STYLE_CLASS_BUTTON : string
    val STYLE_CLASS_CALENDAR : string
    val STYLE_CLASS_CELL : string
    val STYLE_CLASS_CHECK : string
    val STYLE_CLASS_COMBOBOX_ENTRY : string
    val STYLE_CLASS_DEFAULT : string
    val STYLE_CLASS_DND : string
    val STYLE_CLASS_DOCK : string
    val STYLE_CLASS_ENTRY : string
    val STYLE_CLASS_ERROR : string
    val STYLE_CLASS_EXPANDER : string
    val STYLE_CLASS_FRAME : string
    val STYLE_CLASS_GRIP : string
    val STYLE_CLASS_HEADER : string
    val STYLE_CLASS_HIGHLIGHT : string
    val STYLE_CLASS_HORIZONTAL : string
    val STYLE_CLASS_IMAGE : string
    val STYLE_CLASS_INFO : string
    val STYLE_CLASS_INLINE_TOOLBAR : string
    val STYLE_CLASS_MARK : string
    val STYLE_CLASS_MENU : string
    val STYLE_CLASS_MENUBAR : string
    val STYLE_CLASS_MENUITEM : string
    val STYLE_CLASS_NOTEBOOK : string
    val STYLE_CLASS_PANE_SEPARATOR : string
    val STYLE_CLASS_PRIMARY_TOOLBAR : string
    val STYLE_CLASS_PROGRESSBAR : string
    val STYLE_CLASS_QUESTION : string
    val STYLE_CLASS_RADIO : string
    val STYLE_CLASS_RAISED : string
    val STYLE_CLASS_RUBBERBAND : string
    val STYLE_CLASS_SCALE : string
    val STYLE_CLASS_SCALE_HAS_MARKS_ABOVE : string
    val STYLE_CLASS_SCALE_HAS_MARKS_BELOW : string
    val STYLE_CLASS_SCROLLBAR : string
    val STYLE_CLASS_SEPARATOR : string
    val STYLE_CLASS_SIDEBAR : string
    val STYLE_CLASS_SLIDER : string
    val STYLE_CLASS_SPINBUTTON : string
    val STYLE_CLASS_SPINNER : string
    val STYLE_CLASS_TOOLBAR : string
    val STYLE_CLASS_TOOLTIP : string
    val STYLE_CLASS_TROUGH : string
    val STYLE_CLASS_VERTICAL : string
    val STYLE_CLASS_VIEW : string
    val STYLE_CLASS_WARNING : string
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
    val accelGroupsActivate :
      'a GObject.ObjectClass.t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val acceleratorGetDefaultModMask : unit -> Gdk.ModifierType.t
    val acceleratorGetLabel :
      LargeInt.int
       -> Gdk.ModifierType.t
       -> string
    val acceleratorName :
      LargeInt.int
       -> Gdk.ModifierType.t
       -> string
    val acceleratorParse : string -> LargeInt.int * Gdk.ModifierType.t
    val acceleratorSetDefaultModMask : Gdk.ModifierType.t -> unit
    val acceleratorValid :
      LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val alternativeDialogButtonOrder : 'a Gdk.ScreenClass.t option -> bool
    val builderErrorQuark : unit -> LargeInt.int
    val cairoShouldDrawWindow :
      Cairo.ContextRecord.t
       -> 'a Gdk.WindowClass.t
       -> bool
    val cairoTransformToWindow :
      Cairo.ContextRecord.t
       -> 'a WidgetClass.t
       -> 'b Gdk.WindowClass.t
       -> unit
    val checkVersion :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> string
    val cssProviderErrorQuark : unit -> LargeInt.int
    val deviceGrabAdd :
      'a WidgetClass.t
       -> 'b Gdk.DeviceClass.t
       -> bool
       -> unit
    val deviceGrabRemove :
      'a WidgetClass.t
       -> 'b Gdk.DeviceClass.t
       -> unit
    val disableSetlocale : unit -> unit
    val dragFinish :
      'a Gdk.DragContextClass.t
       -> bool
       -> bool
       -> LargeInt.int
       -> unit
    val dragGetSourceWidget : 'a Gdk.DragContextClass.t -> base WidgetClass.t
    val dragSetIconDefault : 'a Gdk.DragContextClass.t -> unit
    val dragSetIconGicon :
      'a Gdk.DragContextClass.t
       -> 'b Gio.IconClass.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val dragSetIconName :
      'a Gdk.DragContextClass.t
       -> string
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val dragSetIconPixbuf :
      'a Gdk.DragContextClass.t
       -> 'b GdkPixbuf.PixbufClass.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val dragSetIconStock :
      'a Gdk.DragContextClass.t
       -> string
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val dragSetIconSurface :
      'a Gdk.DragContextClass.t
       -> Cairo.SurfaceRecord.t
       -> unit
    val dragSetIconWidget :
      'a Gdk.DragContextClass.t
       -> 'b WidgetClass.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawInsertionCursor :
      'a WidgetClass.t
       -> Cairo.ContextRecord.t
       -> Cairo.RectangleIntRecord.t
       -> bool
       -> TextDirection.t
       -> bool
       -> unit
    val eventsPending : unit -> bool
    val fileChooserErrorQuark : unit -> LargeInt.int
    val getBinaryAge : unit -> LargeInt.int
    val getCurrentEvent : unit -> base Gdk.Event.t
    val getCurrentEventDevice : unit -> base Gdk.DeviceClass.t
    val getCurrentEventState : unit -> Gdk.ModifierType.t option
    val getCurrentEventTime : unit -> LargeInt.int
    val getDebugFlags : unit -> LargeInt.int
    val getDefaultLanguage : unit -> Pango.LanguageRecord.t
    val getEventWidget : 'a Gdk.Event.t -> base WidgetClass.t
    val getInterfaceAge : unit -> LargeInt.int
    val getMajorVersion : unit -> LargeInt.int
    val getMicroVersion : unit -> LargeInt.int
    val getMinorVersion : unit -> LargeInt.int
    val grabGetCurrent : unit -> base WidgetClass.t
    val iconSizeFromName : string -> LargeInt.int
    val iconSizeGetName : LargeInt.int -> string
    val iconSizeLookup : LargeInt.int -> (LargeInt.int * LargeInt.int) option
    val iconSizeLookupForSettings :
      'a SettingsClass.t
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
    val iconSizeRegister :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val iconSizeRegisterAlias :
      string
       -> LargeInt.int
       -> unit
    val iconThemeErrorQuark : unit -> LargeInt.int
    val init : string list -> string list
    val keySnooperRemove : LargeInt.int -> unit
    val main : unit -> unit
    val mainDoEvent : 'a Gdk.Event.t -> unit
    val mainIteration : unit -> bool
    val mainIterationDo : bool -> bool
    val mainLevel : unit -> LargeInt.int
    val mainQuit : unit -> unit
    val paintArrow :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> ArrowType.t
       -> bool
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintBox :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintBoxGap :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> PositionType.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintCheck :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintDiamond :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintExpander :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> ExpanderStyle.t
       -> unit
    val paintExtension :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> PositionType.t
       -> unit
    val paintFlatBox :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintFocus :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintHandle :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> Orientation.t
       -> unit
    val paintHline :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintLayout :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> bool
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> 'c Pango.LayoutClass.t
       -> unit
    val paintOption :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintResizeGrip :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> 'b WidgetClass.t option
       -> string option
       -> Gdk.WindowEdge.t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintShadow :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintShadowGap :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> PositionType.t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintSlider :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> Orientation.t
       -> unit
    val paintSpinner :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintTab :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> ShadowType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paintVline :
      'a StyleClass.t
       -> Cairo.ContextRecord.t
       -> StateType.t
       -> 'b WidgetClass.t option
       -> string option
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val paperSizeGetDefault : unit -> string
    val printErrorQuark : unit -> LargeInt.int
    val printRunPageSetupDialog :
      'a WindowClass.t option
       -> 'b PageSetupClass.t option
       -> 'c PrintSettingsClass.t
       -> base PageSetupClass.t
    val propagateEvent :
      'a WidgetClass.t
       -> 'b Gdk.Event.t
       -> unit
    val rcAddDefaultFile : string -> unit
    val rcGetStyle : 'a WidgetClass.t -> base StyleClass.t
    val recentChooserErrorQuark : unit -> LargeInt.int
    val recentManagerErrorQuark : unit -> LargeInt.int
    val renderActivity :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderArrow :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderBackground :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderCheck :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderExpander :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderExtension :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> PositionType.t
       -> unit
    val renderFocus :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderFrame :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderFrameGap :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> PositionType.t
       -> real
       -> real
       -> unit
    val renderHandle :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderIcon :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> 'b GdkPixbuf.PixbufClass.t
       -> real
       -> real
       -> unit
    val renderIconPixbuf :
      'a StyleContextClass.t
       -> IconSourceRecord.t
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.t
    val renderLayout :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> 'b Pango.LayoutClass.t
       -> unit
    val renderLine :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderOption :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> unit
    val renderSlider :
      'a StyleContextClass.t
       -> Cairo.ContextRecord.t
       -> real
       -> real
       -> real
       -> real
       -> Orientation.t
       -> unit
    val rgbToHsv :
      real
       -> real
       -> real
       -> real
           * real
           * real
    val selectionAddTarget :
      'a WidgetClass.t
       -> Gdk.AtomRecord.t
       -> Gdk.AtomRecord.t
       -> LargeInt.int
       -> unit
    val selectionClearTargets :
      'a WidgetClass.t
       -> Gdk.AtomRecord.t
       -> unit
    val selectionConvert :
      'a WidgetClass.t
       -> Gdk.AtomRecord.t
       -> Gdk.AtomRecord.t
       -> LargeInt.int
       -> bool
    val selectionOwnerSet :
      'a WidgetClass.t option
       -> Gdk.AtomRecord.t
       -> LargeInt.int
       -> bool
    val selectionOwnerSetForDisplay :
      'a Gdk.DisplayClass.t
       -> 'b WidgetClass.t option
       -> Gdk.AtomRecord.t
       -> LargeInt.int
       -> bool
    val selectionRemoveAll : 'a WidgetClass.t -> unit
    val setDebugFlags : LargeInt.int -> unit
    val showUri :
      'a Gdk.ScreenClass.t option
       -> string
       -> LargeInt.int
       -> bool
    val stockLookup : string -> StockItemRecord.t option
    val testCreateSimpleWindow :
      string
       -> string
       -> base WidgetClass.t
    val testFindLabel :
      'a WidgetClass.t
       -> string
       -> base WidgetClass.t
    val testRegisterAllTypes : unit -> unit
    val testSliderGetValue : 'a WidgetClass.t -> real
    val testSliderSetPerc :
      'a WidgetClass.t
       -> real
       -> unit
    val testSpinButtonClick :
      'a SpinButtonClass.t
       -> LargeInt.int
       -> bool
       -> bool
    val testTextGet : 'a WidgetClass.t -> string
    val testTextSet :
      'a WidgetClass.t
       -> string
       -> unit
    val testWidgetClick :
      'a WidgetClass.t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val testWidgetSendKey :
      'a WidgetClass.t
       -> LargeInt.int
       -> Gdk.ModifierType.t
       -> bool
    val treeGetRowDragData : SelectionDataRecord.t -> (base TreeModelClass.t * TreePathRecord.t) option
    val treeRowReferenceDeleted :
      'a GObject.ObjectClass.t
       -> TreePathRecord.t
       -> unit
    val treeRowReferenceInserted :
      'a GObject.ObjectClass.t
       -> TreePathRecord.t
       -> unit
    val treeSetRowDragData :
      SelectionDataRecord.t
       -> 'a TreeModelClass.t
       -> TreePathRecord.t
       -> bool
  end
