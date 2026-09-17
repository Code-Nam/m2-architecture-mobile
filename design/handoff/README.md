# Handoff: Tenpai — App mobile d'apprentissage du riichi (mahjong japonais)

## Overview
Tenpai est une app mobile qui enseigne le mahjong japonais (riichi) aux grands débutants, dans l'esprit de Duolingo. Cible : quelqu'un qui n'a jamais joué, intimidé par les 136 tuiles et le vocabulaire japonais. Objectif de sortie : pouvoir s'asseoir à une vraie table sans être perdu. Le cœur est un parcours de leçons courtes et progressives ; le reste (Yaku Dex, Scanner, Profil) est secondaire.

## About the Design Files
Les fichiers de ce bundle sont des **références de design créées en HTML** — des prototypes montrant l'apparence et le comportement voulus, pas du code de production. La tâche est de **recréer ces designs dans l'environnement du codebase cible** (React Native, Flutter, SwiftUI/Compose…) avec ses patterns et bibliothèques établis — ou, si aucun environnement n'existe encore, de choisir le framework mobile le plus adapté et d'y implémenter les designs.

## Fidelity
**High-fidelity (hifi)** : couleurs, typographie, espacements, rayons et états finaux. Recréer pixel-perfect. **Une exception** : les symboles des tuiles sont des **placeholders** (rectangle hachuré en pointillés). Ils seront remplacés par de vrais assets SVG fournis par le designer. Idem pour les logos OAuth (pastilles « G » /  ) : utiliser les vrais logos des fournisseurs.

## Direction visuelle
Calme, concentré, japonais moderne — l'ambiance d'une maison de thé, pas d'un casino. Pas de néon, pas de confettis, pas de mascotte. Récompenses satisfaisantes mais sobres. Microcopie en français, encourageante, brève, jamais condescendante.

## Design Tokens

### Couleurs — mode clair
- Fond : `#FAF7F0` (ivoire chaud)
- Surface : `#FFFFFF` (cartes, ombres douces, jamais de bordure dure)
- Primaire : `#1E6B52` (vert bambou — progression, validation, CTA, dos des tuiles) ; hover `#175A44`
- Accent : `#D64541` (vermillon — erreurs, tuiles rouges, streak ; parcimonie) ; texte d'erreur `#B93531`
- Texte : `#1C1A17` (charbon) ; secondaire `#8B8378` (gris chaud) ; tertiaire `#5C554A` ; désactivé `#B5AC9F` / `#C9C1B2`
- Pistes/inactifs : `#EFEAE0` ; teinté panneau sensei : `#F7F2E7`
- Fonds feedback : succès `#F2F8F4→#DFEDE5`, erreur `#F8E4E3` (panneau) / `#FCF1F0→#F5DFDD` (tuile), carte erreur `#FBEAE9`

### Couleurs — mode sombre (noir-brun chaleureux, jamais noir pur)
- Fond : `#171512` ; surface : `#24211C` ; piste : `#35312A`
- Texte : `#F2EDE3` ; secondaire : `#A89E8F` ; tertiaire : `#C9C0B2`
- Vert texte/liens : `#3FA37E` (le bouton primaire GARDE `#1E6B52` fond plein + texte blanc)
- Vermillon texte : `#E05A56`
- Panneau sensei : `#2A2620` ; feedback erreur : `#38211F` ; succès : `#1F2E27`
- Règle : **la tuile ne change pas en sombre** — face ivoire identique, seule l'ombre portée se renforce (rgba(0,0,0,…) plus marqué)

### Typographie
- Principale : **Outfit** (Google Fonts), géométrique sans-serif, poids 400–700
- Repères techniques : **IBM Plex Mono** 400/500 (numéros, tags, labels uppercase avec letter-spacing 0.1–0.14em)
- Échelle : Display 40/700 (ls −0.01em) · Titre écran 28/700 · Titre section 20/600 · Corps 17/400 (lh 1.6) · Secondaire 15/400 · Mono 12/500 uppercase
- Interlignage généreux partout, rien de compact

### Formes & espacement
- Rayons : 16px cartes/boutons (silhouette de tuile), 10px la tuile elle-même, 12px sous-panneaux. Jamais d'angle vif.
- Ombre surface au repos : `0 2px 12px rgba(28,26,23,0.06)` — ombres, pas de bordures
- Bouton primaire : ombre `0 4px 14px rgba(30,107,82,0.25)`
- Mobile : 390×844, une colonne, marges latérales 20px, espacements en multiples de 8, **une action principale par écran**
- Cadre device : radius 40px

## Le composant Tuile (élément central)
Face ivoire `linear-gradient(180deg,#FFFEFA,#F4EEE1)`, biseau : `inset 0 2px 0 rgba(255,255,255,0.95)` (haut clair) + `inset 0 -4px 0 rgba(28,26,23,0.09)` (assise sombre) + ombre portée `0 4px 10px rgba(28,26,23,0.12)`. Ratio ≈ 64×88 (échelles : 24×34 main de quiz, 48×66 propositions, 110×152 démo). Placeholder symbole : rectangle pointillé 1.5px dashed + hachures `repeating-linear-gradient(45deg, …)`.

États :
1. **Normale** — comme ci-dessus
2. **Sélectionnée** — se soulève (`translateY(-6px)`), ombre renforcée, anneau `0 0 0 3px #1E6B52`
3. **Correcte** — fond teinté vert `#F2F8F4→#DFEDE5`, anneau vert, badge coche ✓ cercle #1E6B52 en haut-droite
4. **Incorrecte** — fond teinté `#FCF1F0→#F5DFDD`, anneau `#D64541`, badge ✕
5. **Surlignée** — halo `0 0 0 6px rgba(30,107,82,0.15)` (guide l'attention en leçon)
6. **Face cachée** — dos vert `linear-gradient(180deg,#237A5E,#174F3D)`, cadre intérieur `rgba(255,255,255,0.18)`
7. **Tuile rouge** — placeholder en vermillon + point rouge 8px dans le coin haut-droit

Transitions : `all 0.25s cubic-bezier(0.2,0.8,0.3,1)`.

## Le Sensei (IA)
Deux points d'usage exacts : (1) explication contextualisée après une erreur de quiz, dépliée via le lien « Pourquoi ? » ; (2) contexte après un scan de tuile. Jamais un chatbot — un professeur discret qui intervient puis s'efface.

Identité visuelle : sceau hanko carré arrondi (22×22, radius 6) `#B93531` avec le caractère **先** blanc ; panneau `#F7F2E7` avec **liseré gauche 3px `#1E6B52`**, radius 12. Pas d'icône étincelle, pas de dégradé violet.

États obligatoires :
- **Chargement** (1–3 s) : trois petites tuiles vertes 11×15 qui pulsent en vague (keyframes : translateY(-5px) + opacity 0.4→1, 1.2s, délais 0/0.2/0.4s), label « Le sensei regarde votre main / la tuile ». Jamais de spinner générique.
- **Streaming** : le texte apparaît progressivement, curseur bloc vert 8×15 clignotant (steps(1), 0.9s) en fin de texte.
- **Échec** : sceau grisé `#B5AC9F`, liseré gris, message honnête (« L'explication n'est pas arrivée. Vous pouvez continuer sans elle. »), bouton « Réessayer » discret (blanc, texte vert). **Jamais bloquant** : le bouton Continuer reste actif.
- **Hors ligne** : le lien « Pourquoi ? » est atténué (`#C9C1B2`, non cliquable) — pas absent — avec la note « Hors ligne — les explications du sensei reviendront avec la connexion. »

Ton du texte : professeur patient. Il explique pourquoi le raisonnement de l'utilisateur était faux et pourquoi la bonne réponse est meilleure — contextualisé à SON erreur, pas générique.

## Structure & navigation
Onglets bas : **Apprendre · Yakus · Scanner · Profil** (barre fixe, icônes + labels, actif en vert). Mobile uniquement.

## Screens / Views (ordre du parcours utilisateur)
Chaque écran existe en clair et en sombre dans `Tenpai - Écrans.dc.html`.

1. **Onboarding 1 — accroche** : tuiles en éventail, titre display, CTA « Commencer ».
2. **Connexion / Inscription** : logo-tuile + wordmark ; segmenté Connexion/Inscription (piste `#EFEAE0`, segment actif blanc) ; champs email + mot de passe en cartes (label mono uppercase 11px, focus = anneau `0 0 0 2px #1E6B52` + label vert, lien « Afficher ») ; « Mot de passe oublié ? » aligné droite ; CTA « Se connecter » ; séparateur « ou » ; OAuth « Continuer avec Google » (carte blanche) et « Continuer avec Apple » (bouton charbon, inversé en sombre) ; mentions légales 12px centrées en bas.
3. **Onboarding 2 — « Vous connaissez déjà le mahjong ? »** : trois options en cartes.
4. **Onboarding 3 — objectif quotidien** : 5/10/15/20 min.
5. **Apprendre — parcours** : header streak (vermillon) + XP + réglages ; parcours vertical de 6 unités remonté du bas vers le haut : « Lire les tuiles », « Les briques d'une main », « La table », « Le déroulé d'une partie », « Gagner », « Le score ». Nœuds circulaires avec tuile : complétée (vert plein + coche), en cours (plus grande, anneau de progression, « 3/6 »), verrouillée (grisée + cadenas).
6. **Leçon — explication** : barre de progression fine + croix de fermeture en haut ; grande tuile isolée au centre ; titre court + 2–3 lignes ; « Continuer » pleine largeur en bas. Beaucoup d'air.
7. **Quiz — bonne réponse** : question, main de 13 tuiles en rangée, propositions 2×2 ; panneau vert remonte du bas (« Bien joué ! » + une ligne d'explication), CTA vert.
8. **Quiz — mauvaise réponse** : panneau vermillon (« Pas tout à fait » + bonne réponse indiquée), lien discret « Pourquoi ? » souligné, CTA `#D64541`.
9-11. **Sensei chargement / réponse / échec** : le panneau sensei déplié sous le feedback d'erreur (états ci-dessus).
12. **Quiz — hors ligne** : « Pourquoi ? » atténué + note.
13. **Yaku Dex** : recherche, chips filtres (Tous / Essentiels / Courants / Rares — active verte pleine), cartes yaku : **nom japonais en premier** (18/600) + surnom français en mono 12 dessous, aperçu 4–5 mini-tuiles, badge valeur (« 2 han »). Non débloqués : atténués + cadenas, tuiles face cachée.
14. **Scanner — viseur** : plein écran sombre, cadre aux proportions d'une tuile avec équerres vertes aux coins, « Cadrez une tuile », déclencheur rond en bas.
15-16. **Scanner — sensei chargement / réponse** : bottom sheet remonte avec la tuile identifiée en grand, son nom, puis panneau sensei (contexte streamé).
17. **Scanner — échec** : tuile grise « ? », « Tuile non reconnue », conseils courts, « Réessayer » (primaire) + « Parcourir le catalogue des tuiles » (texte).
18. **Profil** : avatar, pseudo, rang « Débutant · 3 kyu », 3 blocs stats (streak, XP, tuiles maîtrisées), graphe d'activité 7 jours, rangée de badges.

## Interactions & Behavior
- Sélection de tuile : lift + anneau, transition 0.25s cubic-bezier(0.2,0.8,0.3,1)
- Feedback quiz : panneau qui **remonte du bas** (bottom sheet), coins 24px en haut ; le CTA « Continuer » y vit
- Panneau sensei : se **déplie sous le feedback** au tap sur « Pourquoi ? » ; ne recouvre jamais l'écran
- Boutons : hover assombri, active `translateY(1px)`
- Erreur : signal net mais sobre — pas de secousse agressive, pas de confettis
- Barre de progression leçon : piste `#EFEAE0`, remplissage `#1E6B52`, hauteur 6px, radius 3px

## State Management
- Progression : unité courante, leçons complétées par unité (ex. 3/6), XP total, streak (jours)
- Quiz : tuile sélectionnée, réponse validée (correcte/incorrecte), état sensei (idle / loading / streaming / done / error / offline)
- Scanner : viseur / analyse / résultat / échec ; résultat = tuile identifiée + contexte sensei
- Yaku Dex : requête recherche, filtre actif, yakus débloqués
- Auth : mode (connexion/inscription), visibilité mot de passe, sessions OAuth (Google, Apple)
- Réseau : offline → dégrade le sensei sans bloquer le reste

## Assets
- Aucune image externe. Google Fonts : Outfit (400–700), IBM Plex Mono (400–500).
- **À fournir par le designer** : SVG des 34 faces de tuiles (+ variantes rouges), logos OAuth officiels, icônes d'onglets définitives.

## Files
- `Tenpai - Système de design.dc.html` — palette, échelle typo, composant Tuile (7 états), sensei, mode sombre, règles de forme
- `Tenpai - Écrans.dc.html` — les 18 écrans du parcours, chacun en clair + sombre (390×844)
- Les fichiers s'ouvrent directement dans un navigateur. Le balisage utile est dans la balise `<x-dc>` ; chaque écran est délimité par un commentaire (`<!-- AUTH -->`, `<!-- YAKU DEX -->`…) et un `data-screen-label`.
