#!/bin/bash

# Prompt user to install Flatpak resources or skip
echo -e "\033[34mEnter 1 to install Flatpak resources or 0 to skip:\033[0m"
read -p "Enter your choice (Default: 1): " install_choice

# Set default to 1 if no input is provided
install_choice=${install_choice:-1}

if [ "$install_choice" -eq 1 ]; then
    # Add the Flathub repository if it does not already exist
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    # Add the Launcher repository if it does not already exist
    flatpak remote-add --if-not-exists --user launcher.moe https://gol.launcher.moe/gol.launcher.moe.flatpakrepo

    # Install the Gnome platform
    flatpak install org.gnome.Platform//45
fi

# Prompt user to select launchers to install
echo -e "\033[34mSelect launchers to install (separate choices with spaces):\033[0m"
echo -e "\033[32m1) Honkers -Honkai\033[0m"
echo -e "\033[32m2) Honkers-Railway -Star Rail\033[0m"
echo -e "\033[32m3) Sleepy -ZZZ\033[0m"
echo -e "\033[32m4) Anime -Genshin\033[0m"
echo -e "\033[32m5) Wavey -Wuthering\033[0m"
echo -e "\033[31m6) Uninstall launchers\033[0m"
read -p "Enter your choices: " choices

for choice in $choices; do
    case $choice in
        1)
            flatpak install launcher.moe moe.launcher.honkers-launcher -y
            ;;
        2)
            flatpak install launcher.moe moe.launcher.the-honkers-railway-launcher -y
            ;;
        3)
            flatpak install launcher.moe moe.launcher.sleepy-launcher -y
            ;;
        4)
            flatpak install launcher.moe moe.launcher.an-anime-game-launcher -y
            ;;
        5)
            flatpak install launcher.moe moe.launcher.wavey-launcher -y
            ;;
        6)
            echo -e "\033[34mSelect launchers to uninstall (separate choices with spaces, add -d to delete data):\033[0m"
            echo -e "\033[31m1) Honkers\033[0m"
            echo -e "\033[31m2) Honkers-Railway\033[0m"
            echo -e "\033[31m3) Sleepy\033[0m"
            echo -e "\033[31m4) Anime\033[0m"
            echo -e "\033[31m5) Wavey\033[0m"
            read -p "Enter your choices: " uninstall_choices

            for uninstall_choice in $uninstall_choices; do
                delete_data=""
                if [[ $uninstall_choice == *"-d" ]]; then
                    delete_data="--delete-data"
                    uninstall_choice=${uninstall_choice%-d}
                fi

                case $uninstall_choice in
                    1)
                        flatpak uninstall $delete_data moe.launcher.honkers-launcher -y
                        ;;
                    2)
                        flatpak uninstall $delete_data moe.launcher.the-honkers-railway-launcher -y
                        ;;
                    3)
                        flatpak uninstall $delete_data moe.launcher.sleepy-launcher -y
                        ;;
                    4)
                        flatpak uninstall $delete_data moe.launcher.an-anime-game-launcher -y
                        ;;
                    5)
                        flatpak uninstall $delete_data moe.launcher.wavey-launcher -y
                        ;;
                    *)
                        echo "Invalid choice: $uninstall_choice"
                        ;;
                esac
            done
            ;;
        *)
            echo "Invalid choice: $choice"
            ;;
    esac
done

echo -e "\033[34mOperations are finished. Press Enter to exit.\033[0m"
read -p ""