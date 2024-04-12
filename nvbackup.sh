#!/usr/bin/env bash

SOURCE_DIR_1=~/.config/nvim
SOURCE_DIR_2=~/.local/share/nvim
DEST_DIR=~/nvim_bk_$(date +"%Y-%m-%d_%H-%M-%S")

if [ ! -d "$SOURCE_DIR_1" ] || [ ! -d "$SOURCE_DIR_2" ]; then
    echo "Diretórios de configuração do Neovim não encontrados."
    exit 1
fi

perform_backup() {
    mkdir -p "$DEST_DIR/conf"
    mkdir -p "$DEST_DIR/local"

    cp -r "$SOURCE_DIR_1" "$DEST_DIR/conf"
    cp -r "$SOURCE_DIR_2" "$DEST_DIR/local"

    if [ -d "$DEST_DIR" ]; then
        echo "Backup da configuração do Neovim criado em $DEST_DIR"
    else
        echo "Erro ao criar o backup da configuração do Neovim."
    fi
}

restore_default() {
    echo "Deseja salvar um backup antes de restaurar a configuração padrão? (s/n)"
    read choice

    if [ "$choice" == "s" ]; then
        perform_backup
    fi

    rm -rf "$SOURCE_DIR_1"
    rm -rf "$SOURCE_DIR_2"

    echo "Configuração padrão do Neovim restaurada com sucesso."
}

echo "Escolha uma opção:"
echo "1. Salvar um backup"
echo "2. Salvar um backup e remover, restaurando a configuração padrão"
read option

case $option in
    1)
        perform_backup
        ;;
    2)
        restore_default
        ;;
    *)
        echo "Opção inválida."
        ;;
esac

