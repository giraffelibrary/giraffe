signature GTK_SOURCE =
  sig
    structure BracketMatchType : GTK_SOURCE_BRACKET_MATCH_TYPE
    structure BufferClass : GTK_SOURCE_BUFFER_CLASS
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
    structure DrawSpacesFlags : GTK_SOURCE_DRAW_SPACES_FLAGS
    structure GutterClass : GTK_SOURCE_GUTTER_CLASS
    structure GutterRendererClass : GTK_SOURCE_GUTTER_RENDERER_CLASS
    structure GutterRendererAlignmentMode : GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE
    structure GutterRendererState : GTK_SOURCE_GUTTER_RENDERER_STATE
    structure LanguageClass : GTK_SOURCE_LANGUAGE_CLASS
    structure LanguageManagerClass : GTK_SOURCE_LANGUAGE_MANAGER_CLASS
    structure MarkClass : GTK_SOURCE_MARK_CLASS
    structure MarkAttributesClass : GTK_SOURCE_MARK_ATTRIBUTES_CLASS
    structure PrintCompositorClass : GTK_SOURCE_PRINT_COMPOSITOR_CLASS
    structure SmartHomeEndType : GTK_SOURCE_SMART_HOME_END_TYPE
    structure StyleClass : GTK_SOURCE_STYLE_CLASS
    structure StyleSchemeClass : GTK_SOURCE_STYLE_SCHEME_CLASS
    structure StyleSchemeManagerClass : GTK_SOURCE_STYLE_SCHEME_MANAGER_CLASS
    structure UndoManagerClass : GTK_SOURCE_UNDO_MANAGER_CLASS
    structure ViewClass : GTK_SOURCE_VIEW_CLASS
    structure ViewGutterPosition : GTK_SOURCE_VIEW_GUTTER_POSITION
    structure Buffer :
      GTK_SOURCE_BUFFER
        where type 'a class_t = 'a BufferClass.t
        where type 'a mark_class_t = 'a MarkClass.t
        where type bracket_match_type_t = BracketMatchType.t
        where type 'a language_class_t = 'a LanguageClass.t
        where type 'a style_scheme_class_t = 'a StyleSchemeClass.t
        where type 'a undo_manager_class_t = 'a UndoManagerClass.t
    structure Completion :
      GTK_SOURCE_COMPLETION
        where type 'a class_t = 'a CompletionClass.t
        where type 'a completion_info_class_t = 'a CompletionInfoClass.t
        where type 'a completion_provider_class_t = 'a CompletionProviderClass.t
        where type 'a completion_context_class_t = 'a CompletionContextClass.t
        where type 'a view_class_t = 'a ViewClass.t
    structure CompletionContext :
      GTK_SOURCE_COMPLETION_CONTEXT
        where type 'a class_t = 'a CompletionContextClass.t
        where type completion_activation_t = CompletionActivation.t
        where type 'a completion_class_t = 'a CompletionClass.t
    structure CompletionInfo :
      GTK_SOURCE_COMPLETION_INFO
        where type 'a class_t = 'a CompletionInfoClass.t
    structure CompletionItem :
      GTK_SOURCE_COMPLETION_ITEM
        where type 'a class_t = 'a CompletionItemClass.t
        where type 'a completion_proposal_class_t = 'a CompletionProposalClass.t
    structure CompletionProposal :
      GTK_SOURCE_COMPLETION_PROPOSAL
        where type 'a class_t = 'a CompletionProposalClass.t
    structure CompletionProvider :
      GTK_SOURCE_COMPLETION_PROVIDER
        where type 'a class_t = 'a CompletionProviderClass.t
        where type completion_activation_t = CompletionActivation.t
        where type 'a completion_context_class_t = 'a CompletionContextClass.t
        where type 'a completion_info_class_t = 'a CompletionInfoClass.t
        where type 'a completion_proposal_class_t = 'a CompletionProposalClass.t
    structure CompletionWords :
      GTK_SOURCE_COMPLETION_WORDS
        where type 'a class_t = 'a CompletionWordsClass.t
        where type 'a completion_provider_class_t = 'a CompletionProviderClass.t
    structure Gutter :
      GTK_SOURCE_GUTTER
        where type 'a class_t = 'a GutterClass.t
        where type 'a gutter_renderer_class_t = 'a GutterRendererClass.t
        where type 'a view_class_t = 'a ViewClass.t
    structure GutterRenderer :
      GTK_SOURCE_GUTTER_RENDERER
        where type 'a class_t = 'a GutterRendererClass.t
        where type gutter_renderer_state_t = GutterRendererState.t
        where type gutter_renderer_alignment_mode_t = GutterRendererAlignmentMode.t
    structure GutterRendererPixbufClass :
      GTK_SOURCE_GUTTER_RENDERER_PIXBUF_CLASS
        where type 'a gutter_renderer_class_t = 'a GutterRendererClass.t
    structure GutterRendererTextClass :
      GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS
        where type 'a gutter_renderer_class_t = 'a GutterRendererClass.t
    structure Language :
      GTK_SOURCE_LANGUAGE
        where type 'a class_t = 'a LanguageClass.t
    structure LanguageManager :
      GTK_SOURCE_LANGUAGE_MANAGER
        where type 'a class_t = 'a LanguageManagerClass.t
        where type 'a language_class_t = 'a LanguageClass.t
    structure Mark :
      GTK_SOURCE_MARK
        where type 'a class_t = 'a MarkClass.t
    structure MarkAttributes :
      GTK_SOURCE_MARK_ATTRIBUTES
        where type 'a class_t = 'a MarkAttributesClass.t
        where type 'a mark_class_t = 'a MarkClass.t
    structure PrintCompositor :
      GTK_SOURCE_PRINT_COMPOSITOR
        where type 'a class_t = 'a PrintCompositorClass.t
        where type 'a view_class_t = 'a ViewClass.t
        where type 'a buffer_class_t = 'a BufferClass.t
    structure Style :
      GTK_SOURCE_STYLE
        where type 'a class_t = 'a StyleClass.t
    structure StyleScheme :
      GTK_SOURCE_STYLE_SCHEME
        where type 'a class_t = 'a StyleSchemeClass.t
        where type 'a style_class_t = 'a StyleClass.t
    structure StyleSchemeManager :
      GTK_SOURCE_STYLE_SCHEME_MANAGER
        where type 'a class_t = 'a StyleSchemeManagerClass.t
        where type 'a style_scheme_class_t = 'a StyleSchemeClass.t
    structure UndoManager :
      GTK_SOURCE_UNDO_MANAGER
        where type 'a class_t = 'a UndoManagerClass.t
    structure View :
      GTK_SOURCE_VIEW
        where type 'a class_t = 'a ViewClass.t
        where type 'a buffer_class_t = 'a BufferClass.t
        where type 'a gutter_class_t = 'a GutterClass.t
        where type 'a mark_attributes_class_t = 'a MarkAttributesClass.t
        where type 'a completion_class_t = 'a CompletionClass.t
        where type draw_spaces_flags_t = DrawSpacesFlags.t
        where type smart_home_end_type_t = SmartHomeEndType.t
    structure GutterRendererPixbuf :
      GTK_SOURCE_GUTTER_RENDERER_PIXBUF
        where type 'a class_t = 'a GutterRendererPixbufClass.t
    structure GutterRendererText :
      GTK_SOURCE_GUTTER_RENDERER_TEXT
        where type 'a class_t = 'a GutterRendererTextClass.t
    val COMPLETION_CAPABILITY_AUTOMATIC : string
    val COMPLETION_CAPABILITY_INTERACTIVE : string
    val completionErrorQuark : unit -> LargeInt.int
  end
