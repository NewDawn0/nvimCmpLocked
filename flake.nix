{
  description = "Locked versions of nvim-cmp & dependencies";

  inputs = {
    utils.url = "github:NewDawn0/nixUtils";
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, utils, ... }: {
    overlays.default = final: prev: {
      vimPlugins = prev.vimPlugins // {
        cmp-buffer = self.packages.${prev.system}.cmp-buffer;
        cmp-nvim-lsp = self.packages.${prev.system}.cmp-nvim-lsp;
        cmp-path = self.packages.${prev.system}.cmp-path;
        cmp_luasnip = self.packages.${prev.system}.cmp_luasnip;
        lsp-zero-nvim = self.packages.${prev.system}.lsp-zero-nvim;
        lspkind-nvim = self.packages.${prev.system}.lspkind-nvim;
        luasnip = self.packages.${prev.system}.luasnip;
        nvim-cmp = self.packages.${prev.system}.nvim-cmp;
        nvim-lspconfig = self.packages.${prev.system}.nvim-lspconfig;
        friendly-snippets = self.packages.${prev.system}.friendly-snippets;
      };
    };
    packages = utils.lib.eachSystem { inherit nixpkgs; } (pkgs: {
      cmp-buffer = pkgs.vimPlugins.cmp-buffer;
      cmp-nvim-lsp = pkgs.vimPlugins.cmp-nvim-lsp;
      cmp-path = pkgs.vimPlugins.cmp-path;
      cmp_luasnip = pkgs.vimPlugins.cmp_luasnip;
      lsp-zero-nvim = pkgs.vimPlugins.lsp-zero-nvim;
      lspkind-nvim = pkgs.vimPlugins.lspkind-nvim;
      luasnip = pkgs.vimPlugins.luasnip;
      nvim-cmp = pkgs.vimPlugins.nvim-cmp;
      nvim-lspconfig = pkgs.vimPlugins.nvim-lspconfig;
      friendly-snippets = pkgs.vimPlugins.friendly-snippets;
    });
  };
}
