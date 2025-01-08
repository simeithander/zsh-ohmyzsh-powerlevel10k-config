#!/bin/bash

echo "1: Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

echo "2: Instalando ZSH..."
sudo apt install -y zsh

echo "3: Instalando CURL..."
sudo apt install -y curl

echo "4: Instalando GIT..."
sudo apt install -y git

echo "5: Instalando Oh My ZSH..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --quiet

echo "6: Instalando PowerLevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "7: Configurando PowerLevel10k como tema..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo "8: Baixando e instalando a fonte MesloLGS NF Regular..."
wget -P ~/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
mkdir -p ~/.local/share/fonts
mv ~/Downloads/MesloLGS\ NF\ Regular.ttf ~/.local/share/fonts/
fc-cache -fv

echo "9: Instalando ZSH Syntax Highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "10: Instalando ZSH Auto Suggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "11: Configurando plugins no ~/.zshrc..."
sed -i 's/^plugins=(.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

echo "12: Recarregando o terminal para iniciar o wizard do PowerLevel10k..."
exec zsh
