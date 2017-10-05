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
      val getType_ = call (getSymbol "gtk_source_completion_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addProvider_ =
        call (getSymbol "gtk_source_completion_add_provider")
          (
            GtkSourceCompletionClass.PolyML.cPtr
             &&> GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val blockInteractive_ = call (getSymbol "gtk_source_completion_block_interactive") (GtkSourceCompletionClass.PolyML.cPtr --> cVoid)
      val createContext_ = call (getSymbol "gtk_source_completion_create_context") (GtkSourceCompletionClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cOptPtr --> GtkSourceCompletionContextClass.PolyML.cPtr)
      val getInfoWindow_ = call (getSymbol "gtk_source_completion_get_info_window") (GtkSourceCompletionClass.PolyML.cPtr --> GtkSourceCompletionInfoClass.PolyML.cPtr)
      val getView_ = call (getSymbol "gtk_source_completion_get_view") (GtkSourceCompletionClass.PolyML.cPtr --> GtkSourceViewClass.PolyML.cPtr)
      val hide_ = call (getSymbol "gtk_source_completion_hide") (GtkSourceCompletionClass.PolyML.cPtr --> cVoid)
      val moveWindow_ = call (getSymbol "gtk_source_completion_move_window") (GtkSourceCompletionClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> cVoid)
      val removeProvider_ =
        call (getSymbol "gtk_source_completion_remove_provider")
          (
            GtkSourceCompletionClass.PolyML.cPtr
             &&> GtkSourceCompletionProviderClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val unblockInteractive_ = call (getSymbol "gtk_source_completion_unblock_interactive") (GtkSourceCompletionClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceCompletionClass.class
    type 'a completion_info_class = 'a GtkSourceCompletionInfoClass.class
    type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    type 'a completion_context_class = 'a GtkSourceCompletionContextClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addProvider self provider =
      (
        GtkSourceCompletionClass.FFI.withPtr
         &&&> GtkSourceCompletionProviderClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        addProvider_
        (
          self
           & provider
           & []
        )
    fun blockInteractive self = (GtkSourceCompletionClass.FFI.withPtr ---> I) blockInteractive_ self
    fun createContext self position = (GtkSourceCompletionClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withOptPtr ---> GtkSourceCompletionContextClass.FFI.fromPtr true) createContext_ (self & position)
    fun getInfoWindow self = (GtkSourceCompletionClass.FFI.withPtr ---> GtkSourceCompletionInfoClass.FFI.fromPtr false) getInfoWindow_ self
    fun getView self = (GtkSourceCompletionClass.FFI.withPtr ---> GtkSourceViewClass.FFI.fromPtr false) getView_ self
    fun hide self = (GtkSourceCompletionClass.FFI.withPtr ---> I) hide_ self
    fun moveWindow self iter = (GtkSourceCompletionClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> I) moveWindow_ (self & iter)
    fun removeProvider self provider =
      (
        GtkSourceCompletionClass.FFI.withPtr
         &&&> GtkSourceCompletionProviderClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        removeProvider_
        (
          self
           & provider
           & []
        )
    fun unblockInteractive self = (GtkSourceCompletionClass.FFI.withPtr ---> I) unblockInteractive_ self
    local
      open ClosureMarshal Signal
    in
      fun activateProposalSig f = signal "activate-proposal" (void ---> ret_void) f
      fun hideSig f = signal "hide" (void ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & num => f (step, num))
      fun movePageSig f = signal "move-page" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & num => f (step, num))
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
