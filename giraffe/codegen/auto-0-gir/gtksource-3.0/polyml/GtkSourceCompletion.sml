structure GtkSourceCompletion :>
  GTK_SOURCE_COMPLETION
    where type 'a class = 'a GtkSourceCompletionClass.class
    where type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    where type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    where type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val addProvider_ =
        call (load_sym libgtksourceview "gtk_source_completion_add_provider")
          (
            GtkSourceCompletionClass.PolyML.cPtr
             &&> GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val blockInteractive_ = call (load_sym libgtksourceview "gtk_source_completion_block_interactive") (GtkSourceCompletionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val createContext_ = call (load_sym libgtksourceview "gtk_source_completion_create_context") (GtkSourceCompletionClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cOptPtr --> GtkSourceCompletionContextClass.PolyML.cPtr)
      val getInfoWindow_ = call (load_sym libgtksourceview "gtk_source_completion_get_info_window") (GtkSourceCompletionClass.PolyML.cPtr --> GtkSourceCompletionInfoClass.PolyML.cPtr)
      val getView_ = call (load_sym libgtksourceview "gtk_source_completion_get_view") (GtkSourceCompletionClass.PolyML.cPtr --> GtkSourceViewClass.PolyML.cPtr)
      val hide_ = call (load_sym libgtksourceview "gtk_source_completion_hide") (GtkSourceCompletionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val moveWindow_ = call (load_sym libgtksourceview "gtk_source_completion_move_window") (GtkSourceCompletionClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val removeProvider_ =
        call (load_sym libgtksourceview "gtk_source_completion_remove_provider")
          (
            GtkSourceCompletionClass.PolyML.cPtr
             &&> GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val unblockInteractive_ = call (load_sym libgtksourceview "gtk_source_completion_unblock_interactive") (GtkSourceCompletionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSourceCompletionClass.class
    type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addProvider self provider =
      (
        GtkSourceCompletionClass.C.withPtr
         &&&> GtkSourceCompletionProviderClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        addProvider_
        (
          self
           & provider
           & []
        )
    fun blockInteractive self = (GtkSourceCompletionClass.C.withPtr ---> I) blockInteractive_ self
    fun createContext self position = (GtkSourceCompletionClass.C.withPtr &&&> GtkTextIterRecord.C.withOptPtr ---> GtkSourceCompletionContextClass.C.fromPtr true) createContext_ (self & position)
    fun getInfoWindow self = (GtkSourceCompletionClass.C.withPtr ---> GtkSourceCompletionInfoClass.C.fromPtr false) getInfoWindow_ self
    fun getView self = (GtkSourceCompletionClass.C.withPtr ---> GtkSourceViewClass.C.fromPtr false) getView_ self
    fun hide self = (GtkSourceCompletionClass.C.withPtr ---> I) hide_ self
    fun moveWindow self iter = (GtkSourceCompletionClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) moveWindow_ (self & iter)
    fun removeProvider self provider =
      (
        GtkSourceCompletionClass.C.withPtr
         &&&> GtkSourceCompletionProviderClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeProvider_
        (
          self
           & provider
           & []
        )
    fun unblockInteractive self = (GtkSourceCompletionClass.C.withPtr ---> I) unblockInteractive_ self
    local
      open ClosureMarshal Signal
    in
      fun activateProposalSig f = signal "activate-proposal" (void ---> ret_void) f
      fun hideSig f = signal "hide" (void ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & num => f step num)
      fun movePageSig f = signal "move-page" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & num => f step num)
      fun populateContextSig f = signal "populate-context" (get 0w1 GtkSourceCompletionContextClass.t ---> ret_void) f
      fun showSig f = signal "show" (void ---> ret_void) f
    end
    local
      open Property
    in
      val acceleratorsProp =
        {
          get = fn x => get "accelerators" uint x,
          set = fn x => set "accelerators" uint x
        }
      val autoCompleteDelayProp =
        {
          get = fn x => get "auto-complete-delay" uint x,
          set = fn x => set "auto-complete-delay" uint x
        }
      val proposalPageSizeProp =
        {
          get = fn x => get "proposal-page-size" uint x,
          set = fn x => set "proposal-page-size" uint x
        }
      val providerPageSizeProp =
        {
          get = fn x => get "provider-page-size" uint x,
          set = fn x => set "provider-page-size" uint x
        }
      val rememberInfoVisibilityProp =
        {
          get = fn x => get "remember-info-visibility" boolean x,
          set = fn x => set "remember-info-visibility" boolean x
        }
      val selectOnShowProp =
        {
          get = fn x => get "select-on-show" boolean x,
          set = fn x => set "select-on-show" boolean x
        }
      val showHeadersProp =
        {
          get = fn x => get "show-headers" boolean x,
          set = fn x => set "show-headers" boolean x
        }
      val showIconsProp =
        {
          get = fn x => get "show-icons" boolean x,
          set = fn x => set "show-icons" boolean x
        }
      val viewProp =
        {
          get = fn x => get "view" GtkSourceViewClass.tOpt x,
          set = fn x => set "view" GtkSourceViewClass.tOpt x
        }
    end
  end
