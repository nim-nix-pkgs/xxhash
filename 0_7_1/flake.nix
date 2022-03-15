{
  description = ''xxhash wrapper for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-xxhash-0_7_1.flake = false;
  inputs.src-xxhash-0_7_1.owner = "OpenSystemsLab";
  inputs.src-xxhash-0_7_1.ref   = "refs/tags/0.7.1";
  inputs.src-xxhash-0_7_1.repo  = "xxhash.nim";
  inputs.src-xxhash-0_7_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-xxhash-0_7_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-xxhash-0_7_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}