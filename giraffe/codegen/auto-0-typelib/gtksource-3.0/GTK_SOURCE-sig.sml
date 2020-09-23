signature GTK_SOURCE =
  sig
    structure BackgroundPatternType : GTK_SOURCE_BACKGROUND_PATTERN_TYPE
    structure BracketMatchType : GTK_SOURCE_BRACKET_MATCH_TYPE
    structure BufferClass : GTK_SOURCE_BUFFER_CLASS
    structure ChangeCaseType : GTK_SOURCE_CHANGE_CASE_TYPE
    structure CompletionClass : GTK_SOURCE_COMPLETION_CLASS
    structure CompletionActivation : GTK_SOURCE_COMPLETION_ACTIVATION
    structure CompletionContextClass : GTK_SOURCE_COMPLETION_CONTEXT_CLASS
    structure CompletionError : GTK_SOURCE_COMPLETION_ERROR
    exception CompletionError of CompletionError.t
    structure CompletionInfoClass : GTK_SOURCE_COMPLETION_INFO_CLASS
    structure CompletionItemClass : GTK_SOURCE_COMPLETION_ITEM_CLASS
    structure CompletionProposalClass : GTK_SOURCE_COMPLETION_PROPOSAL_CLASS
    structure CompletionProviderClass : GTK_SOURCE_COMPLETION_PROVIDER_CLASS
    structure CompletionWordsClass : GTK_SOURCE_COMPLETION_WORDS_CLASS
    structure CompressionType : GTK_SOURCE_COMPRESSION_TYPE
    structure DrawSpacesFlags : GTK_SOURCE_DRAW_SPACES_FLAGS
    structure EncodingRecord : GTK_SOURCE_ENCODING_RECORD
    structure FileClass : GTK_SOURCE_FILE_CLASS
    structure FileLoaderClass : GTK_SOURCE_FILE_LOADER_CLASS
    structure FileLoaderError : GTK_SOURCE_FILE_LOADER_ERROR
    exception FileLoaderError of FileLoaderError.t
    structure FileSaverClass : GTK_SOURCE_FILE_SAVER_CLASS
    structure FileSaverError : GTK_SOURCE_FILE_SAVER_ERROR
    exception FileSaverError of FileSaverError.t
    structure FileSaverFlags : GTK_SOURCE_FILE_SAVER_FLAGS
    structure GutterClass : GTK_SOURCE_GUTTER_CLASS
    structure GutterRendererClass : GTK_SOURCE_GUTTER_RENDERER_CLASS
    structure GutterRendererAlignmentMode : GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE
    structure GutterRendererState : GTK_SOURCE_GUTTER_RENDERER_STATE
    structure LanguageClass : GTK_SOURCE_LANGUAGE_CLASS
    structure LanguageManagerClass : GTK_SOURCE_LANGUAGE_MANAGER_CLASS
    structure MarkClass : GTK_SOURCE_MARK_CLASS
    structure MarkAttributesClass : GTK_SOURCE_MARK_ATTRIBUTES_CLASS
    structure NewlineType : GTK_SOURCE_NEWLINE_TYPE
    structure PrintCompositorClass : GTK_SOURCE_PRINT_COMPOSITOR_CLASS
    structure RegionClass : GTK_SOURCE_REGION_CLASS
    structure SearchContextClass : GTK_SOURCE_SEARCH_CONTEXT_CLASS
    structure SearchSettingsClass : GTK_SOURCE_SEARCH_SETTINGS_CLASS
    structure SmartHomeEndType : GTK_SOURCE_SMART_HOME_END_TYPE
    structure SortFlags : GTK_SOURCE_SORT_FLAGS
    structure StyleClass : GTK_SOURCE_STYLE_CLASS
    structure StyleSchemeClass : GTK_SOURCE_STYLE_SCHEME_CLASS
    structure StyleSchemeChooserClass : GTK_SOURCE_STYLE_SCHEME_CHOOSER_CLASS
    structure StyleSchemeChooserButtonClass : GTK_SOURCE_STYLE_SCHEME_CHOOSER_BUTTON_CLASS
    structure StyleSchemeChooserWidgetClass : GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET_CLASS
    structure StyleSchemeManagerClass : GTK_SOURCE_STYLE_SCHEME_MANAGER_CLASS
    structure TagClass : GTK_SOURCE_TAG_CLASS
    structure UndoManagerClass : GTK_SOURCE_UNDO_MANAGER_CLASS
    structure ViewClass : GTK_SOURCE_VIEW_CLASS
    structure ViewGutterPosition : GTK_SOURCE_VIEW_GUTTER_POSITION
    structure Buffer :
      GTK_SOURCE_BUFFER
        where type 'a class = 'a BufferClass.class
        where type change_case_type_t = ChangeCaseType.t
        where type 'a mark_class = 'a MarkClass.class
        where type sort_flags_t = SortFlags.t
        where type bracket_match_type_t = BracketMatchType.t
        where type 'a language_class = 'a LanguageClass.class
        where type 'a style_scheme_class = 'a StyleSchemeClass.class
        where type 'a undo_manager_class = 'a UndoManagerClass.class
    structure Completion :
      GTK_SOURCE_COMPLETION
        where type 'a class = 'a CompletionClass.class
        where type 'a completion_info_class = 'a CompletionInfoClass.class
        where type 'a completion_provider_class = 'a CompletionProviderClass.class
        where type 'a completion_context_class = 'a CompletionContextClass.class
        where type 'a view_class = 'a ViewClass.class
    structure CompletionContext :
      GTK_SOURCE_COMPLETION_CONTEXT
        where type 'a class = 'a CompletionContextClass.class
        where type completion_activation_t = CompletionActivation.t
        where type 'a completion_class = 'a CompletionClass.class
    structure CompletionInfo :
      GTK_SOURCE_COMPLETION_INFO
        where type 'a class = 'a CompletionInfoClass.class
    structure CompletionItem :
      GTK_SOURCE_COMPLETION_ITEM
        where type 'a class = 'a CompletionItemClass.class
        where type 'a completion_proposal_class = 'a CompletionProposalClass.class
    structure CompletionProposal :
      GTK_SOURCE_COMPLETION_PROPOSAL
        where type 'a class = 'a CompletionProposalClass.class
    structure CompletionProvider :
      GTK_SOURCE_COMPLETION_PROVIDER
        where type 'a class = 'a CompletionProviderClass.class
        where type completion_activation_t = CompletionActivation.t
        where type 'a completion_context_class = 'a CompletionContextClass.class
        where type 'a completion_info_class = 'a CompletionInfoClass.class
        where type 'a completion_proposal_class = 'a CompletionProposalClass.class
    structure CompletionWords :
      GTK_SOURCE_COMPLETION_WORDS
        where type 'a class = 'a CompletionWordsClass.class
        where type 'a completion_provider_class = 'a CompletionProviderClass.class
        where type completion_activation_t = CompletionActivation.t
    structure Encoding :
      GTK_SOURCE_ENCODING
        where type t = EncodingRecord.t
    structure File :
      GTK_SOURCE_FILE
        where type 'a class = 'a FileClass.class
        where type compression_type_t = CompressionType.t
        where type encoding_t = EncodingRecord.t
        where type newline_type_t = NewlineType.t
    structure FileLoader :
      GTK_SOURCE_FILE_LOADER
        where type 'a class = 'a FileLoaderClass.class
        where type compression_type_t = CompressionType.t
        where type encoding_t = EncodingRecord.t
        where type newline_type_t = NewlineType.t
        where type 'a buffer_class = 'a BufferClass.class
        where type 'a file_class = 'a FileClass.class
    structure FileSaver :
      GTK_SOURCE_FILE_SAVER
        where type 'a class = 'a FileSaverClass.class
        where type 'a buffer_class = 'a BufferClass.class
        where type compression_type_t = CompressionType.t
        where type encoding_t = EncodingRecord.t
        where type 'a file_class = 'a FileClass.class
        where type file_saver_flags_t = FileSaverFlags.t
        where type newline_type_t = NewlineType.t
    structure Gutter :
      GTK_SOURCE_GUTTER
        where type 'a class = 'a GutterClass.class
        where type 'a gutter_renderer_class = 'a GutterRendererClass.class
        where type 'a view_class = 'a ViewClass.class
    structure GutterRenderer :
      GTK_SOURCE_GUTTER_RENDERER
        where type 'a class = 'a GutterRendererClass.class
        where type gutter_renderer_state_t = GutterRendererState.t
        where type gutter_renderer_alignment_mode_t = GutterRendererAlignmentMode.t
    structure GutterRendererPixbufClass :
      GTK_SOURCE_GUTTER_RENDERER_PIXBUF_CLASS
        where type 'a gutter_renderer_class = 'a GutterRendererClass.class
    structure GutterRendererTextClass :
      GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS
        where type 'a gutter_renderer_class = 'a GutterRendererClass.class
    structure Language :
      GTK_SOURCE_LANGUAGE
        where type 'a class = 'a LanguageClass.class
    structure LanguageManager :
      GTK_SOURCE_LANGUAGE_MANAGER
        where type 'a class = 'a LanguageManagerClass.class
        where type 'a language_class = 'a LanguageClass.class
    structure MapClass :
      GTK_SOURCE_MAP_CLASS
        where type 'a view_class = 'a ViewClass.class
    structure Mark :
      GTK_SOURCE_MARK
        where type 'a class = 'a MarkClass.class
    structure MarkAttributes :
      GTK_SOURCE_MARK_ATTRIBUTES
        where type 'a class = 'a MarkAttributesClass.class
        where type 'a mark_class = 'a MarkClass.class
    structure PrintCompositor :
      GTK_SOURCE_PRINT_COMPOSITOR
        where type 'a class = 'a PrintCompositorClass.class
        where type 'a view_class = 'a ViewClass.class
        where type 'a buffer_class = 'a BufferClass.class
    structure Region :
      GTK_SOURCE_REGION
        where type 'a class = 'a RegionClass.class
    structure SearchContext :
      GTK_SOURCE_SEARCH_CONTEXT
        where type 'a class = 'a SearchContextClass.class
        where type 'a buffer_class = 'a BufferClass.class
        where type 'a style_class = 'a StyleClass.class
        where type 'a search_settings_class = 'a SearchSettingsClass.class
    structure SearchSettings :
      GTK_SOURCE_SEARCH_SETTINGS
        where type 'a class = 'a SearchSettingsClass.class
    structure Style :
      GTK_SOURCE_STYLE
        where type 'a class = 'a StyleClass.class
    structure StyleScheme :
      GTK_SOURCE_STYLE_SCHEME
        where type 'a class = 'a StyleSchemeClass.class
        where type 'a style_class = 'a StyleClass.class
    structure StyleSchemeChooser :
      GTK_SOURCE_STYLE_SCHEME_CHOOSER
        where type 'a class = 'a StyleSchemeChooserClass.class
        where type 'a style_scheme_class = 'a StyleSchemeClass.class
    structure StyleSchemeChooserButton :
      GTK_SOURCE_STYLE_SCHEME_CHOOSER_BUTTON
        where type 'a class = 'a StyleSchemeChooserButtonClass.class
        where type 'a style_scheme_chooser_class = 'a StyleSchemeChooserClass.class
    structure StyleSchemeChooserWidget :
      GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET
        where type 'a class = 'a StyleSchemeChooserWidgetClass.class
        where type 'a style_scheme_chooser_class = 'a StyleSchemeChooserClass.class
    structure StyleSchemeManager :
      GTK_SOURCE_STYLE_SCHEME_MANAGER
        where type 'a class = 'a StyleSchemeManagerClass.class
        where type 'a style_scheme_class = 'a StyleSchemeClass.class
    structure Tag :
      GTK_SOURCE_TAG
        where type 'a class = 'a TagClass.class
    structure UndoManager :
      GTK_SOURCE_UNDO_MANAGER
        where type 'a class = 'a UndoManagerClass.class
    structure View :
      GTK_SOURCE_VIEW
        where type 'a class = 'a ViewClass.class
        where type 'a buffer_class = 'a BufferClass.class
        where type 'a gutter_class = 'a GutterClass.class
        where type 'a mark_attributes_class = 'a MarkAttributesClass.class
        where type change_case_type_t = ChangeCaseType.t
        where type background_pattern_type_t = BackgroundPatternType.t
        where type 'a completion_class = 'a CompletionClass.class
        where type draw_spaces_flags_t = DrawSpacesFlags.t
        where type smart_home_end_type_t = SmartHomeEndType.t
    structure GutterRendererPixbuf :
      GTK_SOURCE_GUTTER_RENDERER_PIXBUF
        where type 'a class = 'a GutterRendererPixbufClass.class
    structure GutterRendererText :
      GTK_SOURCE_GUTTER_RENDERER_TEXT
        where type 'a class = 'a GutterRendererTextClass.class
    structure Map :
      GTK_SOURCE_MAP
        where type 'a class = 'a MapClass.class
        where type 'a view_class = 'a ViewClass.class
    val completionErrorQuark : unit -> LargeInt.int
    val encodingGetCurrent : unit -> EncodingRecord.t
    val encodingGetFromCharset : string -> EncodingRecord.t option
    val encodingGetUtf8 : unit -> EncodingRecord.t
    val fileLoaderErrorQuark : unit -> LargeInt.int
    val fileSaverErrorQuark : unit -> LargeInt.int
    val utilsEscapeSearchText : string -> string
    val utilsUnescapeSearchText : string -> string
  end
