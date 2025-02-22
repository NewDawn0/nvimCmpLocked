{
  description = "Locked versions of nvim-cmp & dependencies";

  inputs = {
    utils.url = "github:NewDawn0/nixUtils";
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, utils, ... }: {
    overlays.default = final: prev: {
      vimPlugins = prev.vimPlugins // {
        cmp-locked = self.packages.${prev.system}.default;
      };
    };
    packages = utils.lib.eachSystem { inherit nixpkgs; } (pkgs: {
      default = pkgs.symlinkJoin {
        name = "cmp-locked";
        paths = with pkgs.vimPlugins; [
          nvim-cmp
          cmp-path
          cmp-buffer
          luasnip
          lspkind-nvim
          nvim-lspconfig
        ];
      };
    });
  };
}
