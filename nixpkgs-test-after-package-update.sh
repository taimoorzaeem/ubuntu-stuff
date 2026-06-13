# Add swap memory first, using add-swap-memory.sh

# Say we updated the postgrest packages - to test this, use the following:

# build the package, this will also give the updated SHA for the package
nix-build . -A postgrest
nix-build . -A postgrest.tests
nix-build . -A postgrest.passthru.tests

# Review the change after committing:
nix-shell -p nixpkgs-review

nixpkgs-review rev HEAD --system x86_64-linux --num-parallel-evals 1

nixpkgs-review rev HEAD --system x86_64-linux --num-parallel-evals 1 --package-regex '^pkgsStatic\.'
