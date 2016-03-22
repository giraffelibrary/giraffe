structure GtkSourceCompletionWordsClass :>
  GTK_SOURCE_COMPLETION_WORDS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a completion_words = unit
    type 'a class = 'a completion_words class
  end
