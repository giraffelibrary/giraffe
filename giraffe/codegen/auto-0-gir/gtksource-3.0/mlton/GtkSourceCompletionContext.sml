structure GtkSourceCompletionContext :>
  GTK_SOURCE_COMPLETION_CONTEXT
    where type 'a class = 'a GtkSourceCompletionContextClass.class
    where type completion_activation_t = GtkSourceCompletionActivation.t
    where type 'a completion_class = 'a GtkSourceCompletionClass.class =
  struct
    val getType_ = _import "gtk_source_completion_context_get_type" : unit -> GObjectType.FFI.val_;
    val getActivation_ = _import "gtk_source_completion_context_get_activation" : GtkSourceCompletionContextClass.FFI.non_opt GtkSourceCompletionContextClass.FFI.p -> GtkSourceCompletionActivation.FFI.val_;
    val getIter_ = fn x1 & x2 => (_import "gtk_source_completion_context_get_iter" : GtkSourceCompletionContextClass.FFI.non_opt GtkSourceCompletionContextClass.FFI.p * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GtkSourceCompletionContextClass.class
    type completion_activation_t = GtkSourceCompletionActivation.t
    type 'a completion_class = 'a GtkSourceCompletionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getActivation self = (GtkSourceCompletionContextClass.FFI.withPtr false ---> GtkSourceCompletionActivation.FFI.fromVal) getActivation_ self
    fun getIter self =
      let
        val iter & retVal = (GtkSourceCompletionContextClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withNewPtr ---> GtkTextIterRecord.FFI.fromPtr true && GBool.FFI.fromVal) getIter_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val activationProp =
        {
          name = "activation",
          gtype = fn () => C.gtype GtkSourceCompletionActivation.t (),
          get = fn x => fn () => C.get GtkSourceCompletionActivation.t x,
          set = fn x => C.set GtkSourceCompletionActivation.t x,
          init = fn x => C.set GtkSourceCompletionActivation.t x
        }
      val completionProp =
        {
          name = "completion",
          gtype = fn () => C.gtype GtkSourceCompletionClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceCompletionClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkSourceCompletionClass.tOpt x
        }
      val iterProp =
        {
          name = "iter",
          gtype = fn () => C.gtype GtkTextIterRecord.tOpt (),
          get = fn x => fn () => C.get GtkTextIterRecord.tOpt x,
          set = fn x => C.set GtkTextIterRecord.tOpt x,
          init = fn x => C.set GtkTextIterRecord.tOpt x
        }
    end
  end
