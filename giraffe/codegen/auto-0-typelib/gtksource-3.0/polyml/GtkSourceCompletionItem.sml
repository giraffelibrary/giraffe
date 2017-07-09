structure GtkSourceCompletionItem :>
  GTK_SOURCE_COMPLETION_ITEM
    where type 'a class = 'a GtkSourceCompletionItemClass.class
    where type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_completion_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_source_completion_item_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkPixbufPixbufClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkSourceCompletionItemClass.PolyML.cPtr
          )
      val newFromStock_ =
        call (getSymbol "gtk_source_completion_item_new_from_stock")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkSourceCompletionItemClass.PolyML.cPtr
          )
      val newWithMarkup_ =
        call (getSymbol "gtk_source_completion_item_new_with_markup")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkPixbufPixbufClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkSourceCompletionItemClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GtkSourceCompletionItemClass.class
    type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    fun asCompletionProposal self = (GObjectObjectClass.FFI.withPtr ---> GtkSourceCompletionProposalClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new label text icon info =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkSourceCompletionItemClass.FFI.fromPtr true
      )
        new_
        (
          label
           & text
           & icon
           & info
        )
    fun newFromStock label text stock info =
      (
        Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkSourceCompletionItemClass.FFI.fromPtr true
      )
        newFromStock_
        (
          label
           & text
           & stock
           & info
        )
    fun newWithMarkup markup text icon info =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkSourceCompletionItemClass.FFI.fromPtr true
      )
        newWithMarkup_
        (
          markup
           & text
           & icon
           & info
        )
    local
      open Property
    in
      val iconProp =
        {
          get = fn x => get "icon" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "icon" GdkPixbufPixbufClass.tOpt x
        }
      val infoProp =
        {
          get = fn x => get "info" stringOpt x,
          set = fn x => set "info" stringOpt x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val markupProp =
        {
          get = fn x => get "markup" stringOpt x,
          set = fn x => set "markup" stringOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end
