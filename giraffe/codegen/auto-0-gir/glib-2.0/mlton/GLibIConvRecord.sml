structure GLibIConvRecord :> G_LIB_I_CONV_RECORD =
  struct
    structure Record =
      PointerRecord(
        val name = "GLib.IConv"
      )
    open Record
  end
