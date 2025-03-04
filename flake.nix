{
  description = "Locked versions of nvim-cmp & dependencies";

  inputs = {
    utils.url = "github:NewDawn0/nixUtils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, utils, ... }: {
    overlays.default = final: prev: {
      vimPlugins = prev.vimPlugins // {
        nvim-cmp = self.packages.${prev.system}.nvim-cmp;
        cmp-buffer = self.packages.${prev.system}.cmp-buffer;
        cmp-nvim-lsp = self.packages.${prev.system}.cmp-nvim-lsp;
        cmp-path = self.packages.${prev.system}.cmp-path;
        cmp_luasnip = self.packages.${prev.system}.cmp_luasnip;
        lspkind-nvim = self.packages.${prev.system}.lspkind-nvim;
        luasnip = self.packages.${prev.system}.luasnip;
        nvim-lspconfig = self.packages.${prev.system}.nvim-lspconfig;
      };
    };
    packages = utils.lib.eachSystem { inherit nixpkgs; } (pkgs: {
      nvim-cmp = pkgs.vimPlugins.nvim-cmp;
      cmp-buffer = pkgs.vimPlugins.cmp-buffer;
      cmp-nvim-lsp = pkgs.vimPlugins.cmp-nvim-lsp;
      cmp-path = pkgs.vimPlugins.cmp-path;
      cmp_luasnip = pkgs.vimPlugins.cmp_luasnip;
      lspkind-nvim = pkgs.vimPlugins.lspkind-nvim;
      luasnip = pkgs.vimPlugins.luasnip;
      nvim-lspconfig = pkgs.vimPlugins.nvim-lspconfig;
    });
  };
}
