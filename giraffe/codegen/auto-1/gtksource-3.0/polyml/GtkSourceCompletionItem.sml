structure GtkSourceCompletionItem :>
  GTK_SOURCE_COMPLETION_ITEM
    where type 'a class_t = 'a GtkSourceCompletionItemClass.t
    where type 'a completionproposalclass_t = 'a GtkSourceCompletionProposalClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_item_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgtksourceview "gtk_source_completion_item_new")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val newFromStock_ =
        call (load_sym libgtksourceview "gtk_source_completion_item_new_from_stock")
          (
            FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INOPTPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val newWithMarkup_ =
        call (load_sym libgtksourceview "gtk_source_completion_item_new_with_markup")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a GtkSourceCompletionItemClass.t
    type 'a completionproposalclass_t = 'a GtkSourceCompletionProposalClass.t
    fun asCompletionProposal self = (GObjectObjectClass.C.withPtr ---> GtkSourceCompletionProposalClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label text icon info =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.withConstOptPtr
         ---> GtkSourceCompletionItemClass.C.fromPtr true
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
        FFI.String.withConstOptPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         ---> GtkSourceCompletionItemClass.C.fromPtr true
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
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.withConstOptPtr
         ---> GtkSourceCompletionItemClass.C.fromPtr true
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
