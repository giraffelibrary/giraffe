#include "cvector.h"
#include "cvectorvector.h"

gboolean
mlton_g_module_symbol (GModule* module,
                       SML_CVECTOR_VAL(const gchar, symbol_name),
                       gpointer* symbol)
{
  return g_module_symbol (module,
                          GET_SML_CVECTOR_VAL(const gchar, symbol_name),
                          symbol);
}

gchar*
mlton_g_module_build_path (SML_CVECTOR_VAL(const gchar, directory),
                           SML_CVECTOR_VAL(const gchar, module_name))
{
  return g_module_build_path (GET_SML_CVECTOR_VAL(const gchar, directory),
                              GET_SML_CVECTOR_VAL(const gchar, module_name));
}
