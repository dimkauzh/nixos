{ pkgs, ... }:


let
  settingsFormat = pkgs.formats.toml { };

  vAnalyzerSettings = {
    custom_vroot = "${pkgs.vlang}/lib";
    enable_sematic_tokens = "full";

    inlay_hints = {
      enable = true;
      enable_range_hints = true;
      enable_type_hints = true;
      enable_implicit_err_hints = true;
      enable_parameter_name_hints = true;
      enable_constant_type_hints = true;
      enable_enum_field_value_hints = true;
    };

    code_lens = {
      enable = true;
      enable_run_lens = true;
      enable_inheritors_lens = true;
      enable_super_interfaces_lens = true;
      enable_run_tests_lens = true;
    };
  };

  analyzerSettingsFile = settingsFormat.generate "config.toml" vAnalyzerSettings;

in
{
  home.file.".config/v-analyzer/config.toml".source = analyzerSettingsFile;
}
