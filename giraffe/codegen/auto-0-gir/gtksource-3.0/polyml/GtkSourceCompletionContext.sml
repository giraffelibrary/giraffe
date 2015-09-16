structure GtkSourceCompletionContext :>
  GTK_SOURCE_COMPLETION_CONTEXT
    where type 'a class_t = 'a GtkSourceCompletionContextClass.t
    where type completion_activation_t = GtkSourceCompletionActivation.t
    where type 'a completion_class_t = 'a GtkSourceCompletionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getActivation_ = call (load_sym libgtksourceview "gtk_source_completion_context_get_activation") (GObjectObjectClass.PolyML.PTR --> GtkSourceCompletionActivation.PolyML.VAL)
      val getIter_ = call (load_sym libgtksourceview "gtk_source_completion_context_get_iter") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSourceCompletionContextClass.t
    type completion_activation_t = GtkSourceCompletionActivation.t
    type 'a completion_class_t = 'a GtkSourceCompletionClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getActivation self = (GObjectObjectClass.C.withPtr ---> GtkSourceCompletionActivation.C.fromVal) getActivation_ self
    fun getIter self =
      let
        val iter & () = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withNewPtr ---> GtkTextIterRecord.C.fromPtr true && I) getIter_ (self & ())
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
