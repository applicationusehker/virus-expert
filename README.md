# Installation

==========Conda Env==============
conda create -n prolog-node -y
conda activate prolog-node

==========Install package==============
//Node in the env
conda install -c conda-forge nodejs -y    
//gives node & npm
//SWI-Prolog in the env (experimental labels on conda-forge)
conda install -c conda-forge/label/swi_prolog_experimental swi-prolog -y
swipl --version
node -v
npm -v

==========create node project==============
npm create vite@latest virus-expert -- --template react
cd virus-expert
npm i
npm i -D tailwindcss@3 postcss autoprefixer
npx tailwindcss init -p
npm i lucide-react
//npm i swipl
npm i swipl-wasm
npm run dev

=========install tailwind in css==========
1) Add Tailwind directives to your main CSS and import it
/* src/index.css */
@tailwind base;
@tailwind components;
@tailwind utilities;


2) Configure Tailwind’s content globs
(Important: include your JSX/TSX!)
// in tailwind.config.js
export default {
  content: ["./index.html", "./src/**/*.{js,jsx,ts,tsx}"],
  theme: { extend: {} },
  plugins: [],
}


=========== to generate SSH key in Linux =========
ssh-keygen -t ed25519 -C "github email account"
cat ~/.ssh/id_ed25519.pub
//add ssh key to github

//connect to github
git remote set-url origin githubRepositorySSHLink


===========for github deploy in my react js folder location terminal===========
npm install gh-pages
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin githubRepositorySSHLink
git push -u origin main

//To build github website to production
npm run deploy

//To update all file and changes
git commit -am "update prolog url"
git push
npm run deploy

//If you need to push git with delete file also
git add -A 
git commit -am "delete file"
git push
npm run deploy



=========== to use cplint in prolog, not in swipl-wasm==============
conda install -c conda-forge certifi
conda install -c conda-forge openssl ca-certificates certify
export SSL_CERT_FILE="$(python -c 'import certifi; print(certifi.where())')"
export SSL_CERT_DIR=""
swipl
?- pack_install(cplint).
use_module(library(prolog_pack)).
Ctrl+z to exit


==============cplint prolog dependency==============
git clone https://github.com/friguzzi/cplint.git
git clone https://github.com/friguzzi/bddem
git clone https://github.com/friguzzi/auc
git clone https://github.com/friguzzi/matrix
cd cplint
swipl
?- pack_install('.').
ctrl+z
cd ..
cd matrix
swipl
?- pack_install('.').
cd ..
cd bddem
swipl
?- pack_install('.').
cd ..
cd auc
swipl
?- pack_install('.').



## References

PedroTech (2024) How To Deploy A React Vite App To Github Pages (Simple). Available at: https://www.youtube.com/watch?v=hn1IkJk24ow (Accessed 5 Sep 2025).
Codemify (2022) How to setup SSH for GitHub repository. Available at: https://www.youtube.com/watch?v=snCP3c7wXw0 (Accessed 5 Sep 2025).
GitHub Docs (2025) Generating a new SSH key and adding it to the ssh-agent. Available at: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent (Accessed 5 Sep 2025).
Peter (2021) GitHub no longer uses password authentication, you have a better option - SSH Key. Available at: https://peterpowerfullife.com/blog/github-shut-down-password/ (Accessed 5 Sep 2025).
 

