const { execSync } = require("child_process");

const npmPackages = [
  "npm",            // Gestionnaire de paquets (inclus avec Node.js, mais s'assure de la dernière version)
  "@vue/cli",       // Vue.js CLI
  "@angular/cli",   // Angular CLI
  "create-react-app", // React.js
  "electron",       // Electron.js
  "express",        // Express.js (framework backend)
  "yarn",           // Yarn (alternative à npm)
  "@ionic/cli"           // Ionic (framework hybride pour apps mobiles)
];

// Fonction pour exécuter des commandes shell
const runCommand = (command) => {
  try {
    console.log(`Exécution : ${command}`);
    execSync(command, { stdio: "inherit" });
  } catch (error) {
    console.error(`Erreur lors de l'exécution de la commande : ${command}`);
    process.exit(1);
  }
};

// Installation des packages globalement
console.log("Installation des outils npm nécessaires...");
npmPackages.forEach((pkg) => {
  console.log(`Installation de ${pkg}...`);
  runCommand(`npm install -g ${pkg}`);
});

console.log("Tous les outils npm ont été installés avec succès !");
