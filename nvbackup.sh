#!/usr/bin/env bash

SOURCE_DIR_1=~/.config/nvim
SOURCE_DIR_2=~/.local/share/nvim
DEST_DIR=~/nvim_bk_$(date +"%d-%m-%Y")

if [ ! -d "$SOURCE_DIR_1" ] || [ ! -d "$SOURCE_DIR_2" ]; then
    echo -e "\nDiretórios de configuração do Neovim não encontrados."
    exit 1
fi

perform_backup() {
    mkdir -p "$DEST_DIR/conf"
    mkdir -p "$DEST_DIR/local"

    cp -r "$SOURCE_DIR_1" "$DEST_DIR/conf"
    cp -r "$SOURCE_DIR_2" "$DEST_DIR/local"

    if [ -d "$DEST_DIR" ]; then
        echo -e "\nBackup da configuração do Neovim criado em $DEST_DIR"
    else
        echo -e "\nErro ao criar o backup da configuração do Neovim."
    fi
}

restore_default() {
    echo -e "\nDeseja salvar um backup antes de restaurar a configuração padrão? (s/n)"
    read choice

    if [ "$choice" == "s" ]; then
        perform_backup
    fi

    rm -rf "$SOURCE_DIR_1"
    rm -rf "$SOURCE_DIR_2"

    echo -e "\nConfiguração padrão do Neovim restaurada com sucesso."
}

echo "Escolha uma opção:"
echo "1. Salvar um backup"
echo "2. Restaurando a configuração padrão"
echo "q. Sair"
read -n 1 -p ">> " option

case $option in
    1)
        perform_backup
        ;;
    2)
        restore_default
        ;;
    q)
        echo -e "\nSaindo..."
        exit 0
        ;;
    *)
        echo "Opção inválida."
        ;;
esac

