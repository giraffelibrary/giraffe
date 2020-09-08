structure GtkSourceCompletionWords :>
  GTK_SOURCE_COMPLETION_WORDS
    where type 'a class = 'a GtkSourceCompletionWordsClass.class
    where type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    where type completion_activation_t = GtkSourceCompletionActivation.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_completion_words_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_completion_words_new") (Utf8.PolyML.cInOptPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> GtkSourceCompletionWordsClass.PolyML.cPtr)
      val register_ = call (getSymbol "gtk_source_completion_words_register") (GtkSourceCompletionWordsClass.PolyML.cPtr &&> GtkTextBufferClass.PolyML.cPtr --> cVoid)
      val unregister_ = call (getSymbol "gtk_source_completion_words_unregister") (GtkSourceCompletionWordsClass.PolyML.cPtr &&> GtkTextBufferClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceCompletionWordsClass.class
    type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    type completion_activation_t = GtkSourceCompletionActivation.t
    type t = base class
    fun asCompletionProvider self = (GObjectObjectClass.FFI.withPtr false ---> GtkSourceCompletionProviderClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (name, icon) = (Utf8.FFI.withOptPtr 0 &&&> GdkPixbufPixbufClass.FFI.withOptPtr false ---> GtkSourceCompletionWordsClass.FFI.fromPtr true) new_ (name & icon)
    fun register self buffer = (GtkSourceCompletionWordsClass.FFI.withPtr false &&&> GtkTextBufferClass.FFI.withPtr false ---> I) register_ (self & buffer)
    fun unregister self buffer = (GtkSourceCompletionWordsClass.FFI.withPtr false &&&> GtkTextBufferClass.FFI.withPtr false ---> I) unregister_ (self & buffer)
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
      val iconProp =
        {
          name = "icon",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val interactiveDelayProp =
        {
          name = "interactive-delay",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val minimumWordSizeProp =
        {
          name = "minimum-word-size",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val priorityProp =
        {
          name = "priority",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val proposalsBatchSizeProp =
        {
          name = "proposals-batch-size",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val scanBatchSizeProp =
        {
          name = "scan-batch-size",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
    end
  end
