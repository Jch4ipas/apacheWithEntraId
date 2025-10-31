<?php
// Affiche tous les claims envoyés par mod_auth_openidc
echo "<pre>";
foreach ($_SERVER as $key => $value) {
    if (str_starts_with($key, 'OIDC_CLAIM_')) {
        echo "$key = $value\n";
    }
}
echo "</pre>";

echo "<p>Nom : " . htmlspecialchars($_SERVER['OIDC_CLAIM_name'] ?? 'Inconnu') . "</p>";
echo "<p>Email : " . htmlspecialchars($_SERVER['OIDC_CLAIM_email'] ?? 'Inconnu') . "</p>";
?>