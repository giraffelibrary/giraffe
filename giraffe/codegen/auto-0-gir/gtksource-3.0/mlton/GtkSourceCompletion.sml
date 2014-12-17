structure GtkSourceCompletion :>
  GTK_SOURCE_COMPLETION
    where type 'a class_t = 'a GtkSourceCompletionClass.t
    where type 'a completioninfoclass_t = 'a GtkSourceCompletionInfoClass.t
    where type 'a completionproviderclass_t = 'a GtkSourceCompletionProviderClass.t
    where type 'a completioncontextclass_t = 'a GtkSourceCompletionContextClass.t
    where type 'a viewclass_t = 'a GtkSourceViewClass.t =
  struct
    val getType_ = _import "gtk_source_completion_get_type" : unit -> GObjectType.C.val_;
    val addProvider_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_add_provider" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val blockInteractive_ = _import "gtk_source_completion_block_interactive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val createContext_ = fn x1 & x2 => (_import "gtk_source_completion_create_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GtkTextIterRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getInfoWindow_ = _import "gtk_source_completion_get_info_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getView_ = _import "gtk_source_completion_get_view" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val hide_ = _import "gtk_source_completion_hide" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val moveWindow_ = fn x1 & x2 => (_import "gtk_source_completion_move_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> unit;) (x1, x2)
    val removeProvider_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_remove_provider" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unblockInteractive_ = _import "gtk_source_completion_unblock_interactive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
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
