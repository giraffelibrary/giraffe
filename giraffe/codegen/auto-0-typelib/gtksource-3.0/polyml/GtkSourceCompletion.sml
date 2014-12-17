structure GtkSourceCompletion :>
  GTK_SOURCE_COMPLETION
    where type 'a class_t = 'a GtkSourceCompletionClass.t
    where type 'a completioninfoclass_t = 'a GtkSourceCompletionInfoClass.t
    where type 'a completionproviderclass_t = 'a GtkSourceCompletionProviderClass.t
    where type 'a completioncontextclass_t = 'a GtkSourceCompletionContextClass.t
    where type 'a viewclass_t = 'a GtkSourceViewClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addProvider_ =
        call (load_sym libgtksourceview "gtk_source_completion_add_provider")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val blockInteractive_ = call (load_sym libgtksourceview "gtk_source_completion_block_interactive") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val createContext_ = call (load_sym libgtksourceview "gtk_source_completion_create_context") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val getInfoWindow_ = call (load_sym libgtksourceview "gtk_source_completion_get_info_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getView_ = call (load_sym libgtksourceview "gtk_source_completion_get_view") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val hide_ = call (load_sym libgtksourceview "gtk_source_completion_hide") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val moveWindow_ = call (load_sym libgtksourceview "gtk_source_completion_move_window") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val removeProvider_ =
        call (load_sym libgtksourceview "gtk_source_completion_remove_provider")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val unblockInteractive_ = call (load_sym libgtksourceview "gtk_source_completion_unblock_interactive") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSourceCompletionClass.t
    type 'a completioninfoclass_t = 'a GtkSourceCompletionInfoClass.t
    type 'a completionproviderclass_t = 'a GtkSourceCompletionProviderClass.t
    type 'a completioncontextclass_t = 'a GtkSourceCompletionContextClass.t
    type 'a viewclass_t = 'a GtkSourceViewClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addProvider self provider =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        addProvider_
        (
          self
           & provider
           & []
        )
    fun blockInteractive self = (GObjectObjectClass.C.withPtr ---> I) blockInteractive_ self
    fun createContext self position = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withOptPtr ---> GtkSourceCompletionContextClass.C.fromPtr true) createContext_ (self & position)
    fun getInfoWindow self = (GObjectObjectClass.C.withPtr ---> GtkSourceCompletionInfoClass.C.fromPtr false) getInfoWindow_ self
    fun getView self = (GObjectObjectClass.C.withPtr ---> GtkSourceViewClass.C.fromPtr false) getView_ self
    fun hide self = (GObjectObjectClass.C.withPtr ---> I) hide_ self
    fun moveWindow self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) moveWindow_ (self & iter)
    fun removeProvider self provider =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeProvider_
        (
          self
           & provider
           & []
        )
    fun unblockInteractive self = (GObjectObjectClass.C.withPtr ---> I) unblockInteractive_ self
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
