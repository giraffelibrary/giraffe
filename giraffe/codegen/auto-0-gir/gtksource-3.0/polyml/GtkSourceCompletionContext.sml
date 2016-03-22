structure GtkSourceCompletionContext :>
  GTK_SOURCE_COMPLETION_CONTEXT
    where type 'a class = 'a GtkSourceCompletionContextClass.class
    where type completion_activation_t = GtkSourceCompletionActivation.t
    where type 'a completion_class = 'a GtkSourceCompletionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getActivation_ = call (load_sym libgtksourceview "gtk_source_completion_context_get_activation") (GtkSourceCompletionContextClass.PolyML.cPtr --> GtkSourceCompletionActivation.PolyML.cVal)
      val getIter_ = call (load_sym libgtksourceview "gtk_source_completion_context_get_iter") (GtkSourceCompletionContextClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkSourceCompletionContextClass.class
    type completion_activation_t = GtkSourceCompletionActivation.t
    type 'a completion_class = 'a GtkSourceCompletionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getActivation self = (GtkSourceCompletionContextClass.C.withPtr ---> GtkSourceCompletionActivation.C.fromVal) getActivation_ self
    fun getIter self =
      let
        val iter & () = (GtkSourceCompletionContextClass.C.withPtr &&&> GtkTextIterRecord.C.withNewPtr ---> GtkTextIterRecord.C.fromPtr true && I) getIter_ (self & ())
      in
        iter
      end
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activationProp =
        {
          get = fn x => get "activation" GtkSourceCompletionActivation.t x,
          set = fn x => set "activation" GtkSourceCompletionActivation.t x
        }
      val completionProp =
        {
          get = fn x => get "completion" GtkSourceCompletionClass.tOpt x,
          set = fn x => set "completion" GtkSourceCompletionClass.tOpt x
        }
      val iterProp =
        {
          get = fn x => get "iter" GtkTextIterRecord.tOpt x,
          set = fn x => set "iter" GtkTextIterRecord.tOpt x
        }
    end
  end
