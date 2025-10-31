# Apache + OIDC (Entra ID) — Exemple

Projet d'exemple montrant l'intégration d'Apache HTTPD avec OpenID Connect (mod_auth_openidc) pour authentifier des utilisateurs via Microsoft Entra ID.

## Contenu important
- Configuration OIDC globale : [oidc.conf](oidc.conf) (`OIDCProviderMetadataURL`, `OIDCClientID`, `OIDCClientSecret`, `OIDCCryptoPassphrase`)  
- Virtual host Apache : [000-default.conf](000-default.conf)  
- Docker build : [Dockerfile](Dockerfile)  
- Docker-compose : [docker-compose.yml](docker-compose.yml)  
- Variables d'environnement exemples : [env-Exemple](env-Exemple) et fichier réel (sensible) : [.env](.env) — ne pas committer.

## Configuration

Les fichiers .htaccess permettent de définir l'authentification et les règles d'accès au niveau de chaque répertoire. Voici les directives principales utilisées pour gérer l'accès via Entra ID (mod_auth_openidc) :

- Activer l'authentification OIDC pour un répertoire ou une page :
```conf
AuthType openid-connect
```

- Autoriser tout utilisateur authentifié :
```conf
Require valid-user
```

- Restreindre l'accès à des groupes (claim "groups") :
```conf
Require claim groups:NomDuGroupe
```
Remarque : remplacer "NomDuGroupe" par la valeur exacte du claim de groupe tel qu'il apparaît dans le token.

- Autoriser des utilisateurs précis via leur uniqueid (ex. sciper) :
```conf
Require claim uniqueid:401596
```

Pages de test et règles par répertoire (exemples de `Require claim`), les fichier .htaccess:
- Racine : [website/.htaccess](website/.htaccess) et affichage des claims : [website/index.php](website/index.php)  
- Groupe : [website/groupe/.htaccess](website/groupe/.htaccess) et [website/groupe/index.php](website/groupe/index.php)  
- Sciper (uniqueid) : [website/sciper/.htaccess](website/sciper/.htaccess) et [website/sciper/index.php](website/sciper/index.php)  
- Unite (groups) : [website/unite/.htaccess](website/unite/.htaccess) et [website/unite/index.php](website/unite/index.php)


## Prérequis
- Docker et docker-compose installés.
- Un client OIDC (Entra ID) avec Client ID / Secret et metadata URL.

## Utilisation rapide
1. Mettre les variables OIDC dans `.env` (ou exporter en env). Exemples dans [env-Exemple](env-Exemple). Les variables utilisées : [`OIDC_CLIENT_ID`](.env), [`OIDC_CLIENT_SECRET`](.env), [`OIDC_PROVIDER_URL`](.env), [`OIDC_SECRET`](.env).
2. Construire l'image (nom attendu dans `docker-compose.yml`):
   ```sh
   docker build -t phpapachecustom:latest .