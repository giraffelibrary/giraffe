structure GtkSourceCompletionWords :>
  GTK_SOURCE_COMPLETION_WORDS
    where type 'a class = 'a GtkSourceCompletionWordsClass.class
    where type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_words_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_completion_words_new") (Utf8.PolyML.cInOptPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> GtkSourceCompletionWordsClass.PolyML.cPtr)
      val register_ = call (load_sym libgtksourceview "gtk_source_completion_words_register") (GtkSourceCompletionWordsClass.PolyML.cPtr &&> GtkTextBufferClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unregister_ = call (load_sym libgtksourceview "gtk_source_completion_words_unregister") (GtkSourceCompletionWordsClass.PolyML.cPtr &&> GtkTextBufferClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkSourceCompletionWordsClass.class
    type 'a completion_provider_class = 'a GtkSourceCompletionProviderClass.class
    type t = base class
    fun asCompletionProvider self = (GObjectObjectClass.C.withPtr ---> GtkSourceCompletionProviderClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name icon = (Utf8.C.withOptPtr &&&> GdkPixbufPixbufClass.C.withOptPtr ---> GtkSourceCompletionWordsClass.C.fromPtr true) new_ (name & icon)
    fun register self buffer = (GtkSourceCompletionWordsClass.C.withPtr &&&> GtkTextBufferClass.C.withPtr ---> I) register_ (self & buffer)
    fun unregister self buffer = (GtkSourceCompletionWordsClass.C.withPtr &&&> GtkTextBufferClass.C.withPtr ---> I) unregister_ (self & buffer)
    local
      open Property
    in
      val iconProp =
        {
          get = fn x => get "icon" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "icon" GdkPixbufPixbufClass.tOpt x
        }
      val interactiveDelayProp =
        {
          get = fn x => get "interactive-delay" int x,
          set = fn x => set "interactive-delay" int x
        }
      val minimumWordSizeProp =
        {
          get = fn x => get "minimum-word-size" uint x,
          set = fn x => set "minimum-word-size" uint x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
      val priorityProp =
        {
          get = fn x => get "priority" int x,
          set = fn x => set "priority" int x
        }
      val proposalsBatchSizeProp =
        {
          get = fn x => get "proposals-batch-size" uint x,
          set = fn x => set "proposals-batch-size" uint x
        }
      val scanBatchSizeProp =
        {
          get = fn x => get "scan-batch-size" uint x,
          set = fn x => set "scan-batch-size" uint x
        }
    end
  end
