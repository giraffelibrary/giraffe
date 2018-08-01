#include "cvector.h"
#include "cvectorvector.h"

#if VTE_CHECK_VERSION(0, 26, 0)
void
mlton_vte_pty_set_term (VtePty* pty,
                        SML_CVECTOR_VAL(const char, emulation))
{
  vte_pty_set_term (pty,
                    GET_SML_CVECTOR_VAL(const char, emulation));
}
#endif

void
mlton_vte_terminal_feed (VteTerminal* terminal,
                         SML_CVECTOR_VAL(char, data),
                         glong length)
{
  vte_terminal_feed (terminal,
                     GET_SML_CVECTOR_VAL(char, data),
                     length);
}

void
mlton_vte_terminal_feed_child (VteTerminal* terminal,
                               SML_CVECTOR_VAL(const char, text),
                               glong length)
{
  vte_terminal_feed_child (terminal,
                           GET_SML_CVECTOR_VAL(const char, text),
                           length);
}

#if VTE_CHECK_VERSION(0, 12, 1)
void
mlton_vte_terminal_feed_child_binary (VteTerminal* terminal,
                                      SML_CVECTOR_VAL(const char, data),
                                      glong length)
{
  vte_terminal_feed_child_binary (terminal,
                                  GET_SML_CVECTOR_VAL(const char, data),
                                  length);
}
#endif

#if VTE_CHECK_VERSION(0, 26, 0)
gboolean
mlton_vte_terminal_fork_command_full (VteTerminal* terminal,
                                      VtePtyFlags pty_flags,
                                      SML_CVECTOR_VAL(const char, working_directory),
                                      SML_CVECTORVECTOR_VAL(char, argv),
                                      SML_CVECTORVECTOR_VAL(char, envv),
                                      GSpawnFlags spawn_flags,
                                      GSpawnChildSetupFunc child_setup,
                                      gpointer child_setup_data,
                                      GPid* child_pid,
                                      GError** error)
{
  return vte_terminal_fork_command_full (terminal,
                                         pty_flags,
                                         GET_SML_CVECTOR_VAL(const char, working_directory),
                                         GET_SML_CVECTORVECTOR_VAL(char, argv),
                                         GET_SML_CVECTORVECTOR_VAL(char, envv),
                                         spawn_flags,
                                         child_setup,
                                         child_setup_data,
                                         child_pid,
                                         error);
}
#endif

#if VTE_CHECK_VERSION(0, 17, 1)
void
mlton_vte_terminal_match_set_cursor_name (VteTerminal* terminal,
                                          int tag,
                                          SML_CVECTOR_VAL(const char, cursor_name))
{
  vte_terminal_match_set_cursor_name (terminal,
                                      tag,
                                      GET_SML_CVECTOR_VAL(const char, cursor_name));
}
#endif

void
mlton_vte_terminal_set_colors (VteTerminal* terminal,
                               const GdkColor* foreground,
                               const GdkColor* background,
                               SML_CVECTOR_VAL(GdkColor, palette),
                               glong palette_size)
{
  vte_terminal_set_colors (terminal,
                           foreground,
                           background,
                           GET_SML_CVECTOR_VAL(GdkColor, palette),
                           palette_size);
}

#if VTE_CHECK_VERSION(0, 28, 0)
void
mlton_vte_terminal_set_colors_rgba (VteTerminal* terminal,
                                    const GdkRGBA* foreground,
                                    const GdkRGBA* background,
                                    SML_CVECTOR_VAL(GdkRGBA, palette),
                                    gsize palette_size)
{
  vte_terminal_set_colors_rgba (terminal,
                                foreground,
                                background,
                                GET_SML_CVECTOR_VAL(GdkRGBA, palette),
                                palette_size);
}
#endif

void
mlton_vte_terminal_set_emulation (VteTerminal* terminal,
                                  SML_CVECTOR_VAL(const char, emulation))
{
  vte_terminal_set_emulation (terminal,
                              GET_SML_CVECTOR_VAL(const char, emulation));
}

void
mlton_vte_terminal_set_encoding (VteTerminal* terminal,
                                 SML_CVECTOR_VAL(const char, codeset))
{
  vte_terminal_set_encoding (terminal,
                             GET_SML_CVECTOR_VAL(const char, codeset));
}

void
mlton_vte_terminal_set_font_from_string (VteTerminal* terminal,
                                         SML_CVECTOR_VAL(char, name))
{
  vte_terminal_set_font_from_string (terminal,
                                     GET_SML_CVECTOR_VAL(char, name));
}

void
mlton_vte_terminal_set_word_chars (VteTerminal* terminal,
                                   SML_CVECTOR_VAL(const char, spec))
{
  vte_terminal_set_word_chars (terminal,
                               GET_SML_CVECTOR_VAL(const char, spec));
}
