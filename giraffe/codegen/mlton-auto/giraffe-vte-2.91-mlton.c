#include "cvector.h"
#include "cvectorvector.h"

VteRegex*
mlton_vte_regex_new_for_match (SML_CVECTOR_VAL(const char, pattern),
                               gssize pattern_length,
                               guint32 flags,
                               GError** error)
{
  return vte_regex_new_for_match (GET_SML_CVECTOR_VAL(const char, pattern),
                                  pattern_length,
                                  flags,
                                  error);
}

VteRegex*
mlton_vte_regex_new_for_search (SML_CVECTOR_VAL(const char, pattern),
                                gssize pattern_length,
                                guint32 flags,
                                GError** error)
{
  return vte_regex_new_for_search (GET_SML_CVECTOR_VAL(const char, pattern),
                                   pattern_length,
                                   flags,
                                   error);
}

void
mlton_vte_terminal_feed (VteTerminal* terminal,
                         SML_CVECTOR_VAL(char, data),
                         gssize length)
{
  vte_terminal_feed (terminal,
                     GET_SML_CVECTOR_VAL(char, data),
                     length);
}

void
mlton_vte_terminal_feed_child (VteTerminal* terminal,
                               SML_CVECTOR_VAL(const char, text),
                               gssize length)
{
  vte_terminal_feed_child (terminal,
                           GET_SML_CVECTOR_VAL(const char, text),
                           length);
}

void
mlton_vte_terminal_feed_child_binary (VteTerminal* terminal,
                                      SML_CVECTOR_VAL(guint8, data),
                                      gsize length)
{
  vte_terminal_feed_child_binary (terminal,
                                  GET_SML_CVECTOR_VAL(guint8, data),
                                  length);
}

void
mlton_vte_terminal_match_set_cursor_name (VteTerminal* terminal,
                                          int tag,
                                          SML_CVECTOR_VAL(const char, cursor_name))
{
  vte_terminal_match_set_cursor_name (terminal,
                                      tag,
                                      GET_SML_CVECTOR_VAL(const char, cursor_name));
}

void
mlton_vte_terminal_set_colors (VteTerminal* terminal,
                               const GdkRGBA* foreground,
                               const GdkRGBA* background,
                               SML_CVECTOR_VAL(GdkRGBA, palette),
                               gsize palette_size)
{
  vte_terminal_set_colors (terminal,
                           foreground,
                           background,
                           GET_SML_CVECTOR_VAL(GdkRGBA, palette),
                           palette_size);
}

gboolean
mlton_vte_terminal_set_encoding (VteTerminal* terminal,
                                 SML_CVECTOR_VAL(const char, codeset),
                                 GError** error)
{
  return vte_terminal_set_encoding (terminal,
                                    GET_SML_CVECTOR_VAL(const char, codeset),
                                    error);
}

#if VTE_CHECK_VERSION(0, 40, 0)
void
mlton_vte_terminal_set_word_char_exceptions (VteTerminal* terminal,
                                             SML_CVECTOR_VAL(const char, exceptions))
{
  vte_terminal_set_word_char_exceptions (terminal,
                                         GET_SML_CVECTOR_VAL(const char, exceptions));
}
#endif

gboolean
mlton_vte_terminal_spawn_sync (VteTerminal* terminal,
                               VtePtyFlags pty_flags,
                               SML_CVECTOR_VAL(const char, working_directory),
                               SML_CVECTORVECTOR_VAL(char, argv),
                               SML_CVECTORVECTOR_VAL(char, envv),
                               GSpawnFlags spawn_flags,
                               GSpawnChildSetupFunc child_setup,
                               gpointer child_setup_data,
                               GPid* child_pid,
                               GCancellable* cancellable,
                               GError** error)
{
  return vte_terminal_spawn_sync (terminal,
                                  pty_flags,
                                  GET_SML_CVECTOR_VAL(const char, working_directory),
                                  GET_SML_CVECTORVECTOR_VAL(char, argv),
                                  GET_SML_CVECTORVECTOR_VAL(char, envv),
                                  spawn_flags,
                                  child_setup,
                                  child_setup_data,
                                  child_pid,
                                  cancellable,
                                  error);
}
