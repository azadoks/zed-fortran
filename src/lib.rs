use zed_extension_api::{self as zed, settings::LspSettings};

struct FortranExtension {}

impl zed::Extension for FortranExtension {
    fn new() -> Self {
        Self {}
    }

    fn language_server_command(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        // `lsp.fortls.binary.{path,arguments}` in Zed settings override the defaults.
        let binary = LspSettings::for_worktree(language_server_id.as_ref(), worktree)
            .ok()
            .and_then(|settings| settings.binary);

        let path = binary
            .as_ref()
            .and_then(|binary| binary.path.clone())
            .or_else(|| worktree.which("fortls"))
            .ok_or_else(|| "fortls not found on PATH (install it with `pip install fortls`)".to_string())?;
        let args = binary
            .as_ref()
            .and_then(|binary| binary.arguments.clone())
            .unwrap_or_else(|| vec!["--lowercase_intrinsics".to_string()]);

        Ok(zed::Command {
            command: path,
            args,
            env: worktree.shell_env(),
        })
    }
}

zed::register_extension!(FortranExtension);
