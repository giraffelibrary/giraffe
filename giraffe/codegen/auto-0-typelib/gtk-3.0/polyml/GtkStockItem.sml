structure GtkStockItem :>
  GTK_STOCK_ITEM
    where type record_t = GtkStockItemRecord.t =
  struct
    type record_t = GtkStockItemRecord.t
    type t = record_t
  end
