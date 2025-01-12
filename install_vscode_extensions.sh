#!/bin/bash

# Liste des 150 extensions VS Code à installer
extensions=(
    # Gestion de versions et Git
    eamodio.gitlens
    mhutchie.git-graph
    donjayamanne.githistory
    waderyan.gitblame
    GitHub.vscode-pull-request-github

    # Python
    ms-python.python
    ms-toolsai.jupyter
    ms-python.vscode-pylance
    njpwerner.autodocstring
    ms-pyright.pyright

    # JavaScript/TypeScript
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode
    xabikos.javascriptsnippets
    WallabyJs.quokka-vscode
    ms-vscode.vscode-typescript-tslint-plugin

    # Java
    vscjava.vscode-java-pack
    vscjava.vscode-java-debug
    vscjava.vscode-maven
    vscjava.vscode-spring-boot
    shengchen.vscode-checkstyle

    # Go
    golang.go
    joedevivo.vscode-go-docs
    ethan-reesor.vscode-go-test-adapter
    golang.go-nightly
    mathiasfrohlich.Kotlin

    # Bases de données
    mtxr.sqltools
    cweijan.vscode-database-client2
    mongodb.mongodb-vscode
    ckolkman.vscode-postgres
    qwtel.sqlite-viewer

    # Analyse de données
    randomfractalsinc.vscode-data-preview
    GrapeCity.gc-excelviewer
    alexandre.ptk
    data-wrangler
    RandomFractalsInc.vscode-tabular-data-editor

    # Développement mobile
    dart-code.flutter
    msjsdiag.vscode-react-native
    msjsdiag.cordova-tools
    byCedric.vscode-expo
    dart-code.dart-code

    # DevOps
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    HashiCorp.terraform
    redhat.vscode-yaml
    redhat.ansible

    # Gestion de projet
    wayou.vscode-todo-highlight
    alefragnani.project-manager
    GitHub.vscode-pull-request-github
    actboy168.tasks
    shd101wyy.markdown-preview-enhanced

    # Diagramming
    jebbs.plantuml
    hediet.vscode-drawio
    bierner.markdown-mermaid
    lewnelson.vscode-diagram
    yzhang.markdown-all-in-one

    # Testing
    hbenl.vscode-test-explorer
    Orta.vscode-jest
    hbenl.vscode-mocha-test-adapter
    hbenl.vscode-test-adapter-converter
    littlefoxteam.vscode-python-test-adapter

    # AI Tools
    github.copilot
    gencay.vscode-chatgpt
    DanielAndrade.code-gpt
    VisualStudioExptTeam.vscodeintellicode
    TabNine.tabnine-vscode

    # Outils Frontend
    ritwickdey.liveserver
    bradlc.vscode-tailwindcss
    Zignd.html-css-class-completion
    formulahendry.auto-rename-tag
    formulahendry.auto-close-tag

    # Linters et formatteurs
    EditorConfig.EditorConfig
    stylelint.vscode-stylelint
    HookyQR.beautify
    timonwong.shellcheck
    bmewburn.vscode-intelephense-client

    # Outils de productivité
    CoenraadS.bracket-pair-colorizer-2
    aaron-bond.better-comments
    christian-kohler.path-intellisense
    humao.rest-client
    streetsidesoftware.code-spell-checker

    # Langages divers
    rust-lang.rust-analyzer
    ms-vscode.cpptools
    xdebug.php-debug
    rebornix.ruby
    ms-dotnettools.csharp

    # Sécurité
    SonarSource.sonarlint-vscode
    redhat.fabric8-analytics
    aquasecurity.trivy-vscode
    42Crunch.vscode-openapi
    timonwong.hashicorp-vault

    # Divers
    naumovs.color-highlight
    vincaslt.highlight-matching-tag
    idleberg.icon-fonts
    mechatroner.rainbow-csv
    wix.vscode-import-cost

    # Liste supplémentaire (ajouter vos extensions ici)
    oderwat.indent-rainbow
    flexagon.sql-snippets
    kisstkondoros.vscode-codemetrics
    bmalehorn.vscode-docker-linter
    alexkrechik.cucumberautocomplete
    # Ajoutez plus si nécessaire jusqu'à 150 extensions
)

# Installer chaque extension via code CLI
echo "Installation des extensions VS Code..."
for extension in "${extensions[@]}"; do
    echo "Installation de $extension..."
    code --install-extension "$extension" || {
        echo "Échec de l'installation de $extension"
        continue
    }
done

echo "Installation terminée pour toutes les extensions listées !"
