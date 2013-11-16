/* Giraffe Library                                                            *
 *                                                                            *
 * Vte C interface support for Poly/ML                                        *
 *                                                                            *
 * Giraffe Library is released under the GNU LGPL version 3.                  *
 * See file LICENCE for details.                                              *
 *                                                                            */

#include <vte/vte.h>


/* VteTerminal */

void
giraffe_vte_terminal_set_colors (VteTerminal *terminal,
                                 const GdkColor *foreground,
                                 const GdkColor *background)
{
  vte_terminal_set_colors (terminal,
                           foreground,
                           background,
                           NULL,
                           0);
}

gboolean
giraffe_vte_terminal_fork_command_full (VteTerminal *terminal,
                                        VtePtyFlags pty_flags,
                                        const char *working_directory,
                                        char **argv,
                                        char **envp,
                                        GSpawnFlags flags,
                                        GPid *child_pid,
                                        GError **error)
{
  return vte_terminal_fork_command_full (terminal,
                                         pty_flags,
                                         working_directory,
                                         argv,
                                         envp,
                                         flags,
                                         NULL,
                                         NULL,
                                         child_pid,
                                         error);
}
