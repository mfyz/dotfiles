#!/bin/bash
# ministow - A lightweight GNU stow replacement
# Usage: ministow.sh <package> [--adopt] [--delete]

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME"

usage() {
    echo "Usage: ministow <package> [--adopt] [--delete]"
    echo "       ministow --all [--adopt]"
    echo ""
    echo "Options:"
    echo "  --adopt   Move existing files into package before linking"
    echo "  --delete  Remove symlinks (unstow)"
    echo "  --all     Process all packages (dirs not starting with _)"
    exit 1
}

stow_package() {
    local pkg="$1"
    local adopt="$2"
    local delete="$3"
    local pkg_dir="$DOTFILES_DIR/$pkg"

    if [ ! -d "$pkg_dir" ]; then
        echo "Error: Package '$pkg' not found"
        return 1
    fi

    echo "Processing: $pkg"

    # Find all files in the package directory
    find "$pkg_dir" -type f | while read -r src; do
        # Get relative path from package dir
        rel_path="${src#$pkg_dir/}"
        dest="$TARGET_DIR/$rel_path"
        dest_dir="$(dirname "$dest")"

        if [ "$delete" = "true" ]; then
            # Unstow: remove symlink if it points to our file
            if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
                echo "  Removing: $rel_path"
                rm "$dest"
            fi
        else
            # Stow: create symlink
            if [ -L "$dest" ]; then
                # Already a symlink
                if [ "$(readlink "$dest")" = "$src" ]; then
                    echo "  Already linked: $rel_path"
                else
                    echo "  Conflict (symlink exists): $rel_path"
                fi
            elif [ -f "$dest" ]; then
                if [ "$adopt" = "true" ]; then
                    echo "  Adopting: $rel_path"
                    mv "$dest" "$src"
                    ln -s "$src" "$dest"
                else
                    echo "  Conflict (file exists): $rel_path"
                fi
            else
                # Create parent dirs if needed
                mkdir -p "$dest_dir"
                echo "  Linking: $rel_path"
                ln -s "$src" "$dest"
            fi
        fi
    done
}

# Parse arguments
ADOPT=false
DELETE=false
ALL=false
PACKAGES=()

while [[ $# -gt 0 ]]; do
    case "$1" in
        --adopt) ADOPT=true; shift ;;
        --delete) DELETE=true; shift ;;
        --all) ALL=true; shift ;;
        -*) usage ;;
        *) PACKAGES+=("$1"); shift ;;
    esac
done

if [ "$ALL" = "true" ]; then
    # Process all packages (directories not starting with _)
    for d in "$DOTFILES_DIR"/*/; do
        pkg="$(basename "$d")"
        [[ "$pkg" == _* ]] && continue
        stow_package "$pkg" "$ADOPT" "$DELETE"
    done
elif [ ${#PACKAGES[@]} -eq 0 ]; then
    usage
else
    for pkg in "${PACKAGES[@]}"; do
        stow_package "$pkg" "$ADOPT" "$DELETE"
    done
fi

echo "Done!"
