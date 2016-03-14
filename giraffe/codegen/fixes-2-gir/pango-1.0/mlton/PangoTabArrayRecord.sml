structure PangoTabArrayRecord :> PANGO_TAB_ARRAY_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val copy_ = _import "pango_tab_array_copy" : notnull p -> notnull p;
    val free_ = _import "pango_tab_array_free" : notnull p -> unit;
    val getType_ = _import "pango_tab_array_get_type" : unit -> GObjectType.C.val_;

    structure Record =
      BoxedRecord (
        type notnull = notnull
        type 'a p = 'a p
        val take_ = ignore
        val copy_ = copy_
        val free_ = free_
      )
    open Record

    structure Type =
      BoxedType (
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type
  end
