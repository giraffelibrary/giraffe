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
        where type 'a class = 'a BufferClass.class
        where type 'a mark_class = 'a MarkClass.class
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
    structure Style :
      GTK_SOURCE_STYLE
        where type 'a class = 'a StyleClass.class
    structure StyleScheme :
      GTK_SOURCE_STYLE_SCHEME
        where type 'a class = 'a StyleSchemeClass.class
        where type 'a style_class = 'a StyleClass.class
    structure StyleSchemeManager :
      GTK_SOURCE_STYLE_SCHEME_MANAGER
        where type 'a class = 'a StyleSchemeManagerClass.class
        where type 'a style_scheme_class = 'a StyleSchemeClass.class
    structure UndoManager :
      GTK_SOURCE_UNDO_MANAGER
        where type 'a class = 'a UndoManagerClass.class
    structure View :
      GTK_SOURCE_VIEW
        where type 'a class = 'a ViewClass.class
        where type 'a buffer_class = 'a BufferClass.class
        where type 'a gutter_class = 'a GutterClass.class
        where type 'a mark_attributes_class = 'a MarkAttributesClass.class
        where type 'a completion_class = 'a CompletionClass.class
        where type draw_spaces_flags_t = DrawSpacesFlags.t
        where type smart_home_end_type_t = SmartHomeEndType.t
    structure GutterRendererPixbuf :
      GTK_SOURCE_GUTTER_RENDERER_PIXBUF
        where type 'a class = 'a GutterRendererPixbufClass.class
    structure GutterRendererText :
      GTK_SOURCE_GUTTER_RENDERER_TEXT
        where type 'a class = 'a GutterRendererTextClass.class
    val COMPLETION_CAPABILITY_AUTOMATIC : string
    val COMPLETION_CAPABILITY_INTERACTIVE : string
  end
