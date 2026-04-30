# PmaxFrame

Browser-based mockup tool voor Google Performance Max-advertenties. Genereert realistische screenshots van hoe je PMax-campagnes eruit zien op Google Search, YouTube, Discover en Display Network — direct downloadbaar als PNG of als ZIP met alle varianten.

Brand kits worden gedeeld met [SocialFrame v2](https://github.com/erikotn/socialframe-v2) via dezelfde Supabase-backend, zodat één Cosis-merkprofiel werkt voor zowel social als Google.

## Placements (v1)

1. **Google Search (mobile)** — gesponsord resultaat met headlines, description en sitelinks
2. **YouTube in-feed (mobile)** — discovery-ad met videothumbnail
3. **Google Discover** — feed-card op mobiel
4. **Display banner** — IAB-formaten op witte achtergrond:
   - Medium Rectangle (300×250)
   - Large Rectangle (336×280)
   - Square (250×250)
   - Skyscraper (160×600)

## Setup

PmaxFrame deelt de Supabase-backend met SocialFrame v2. De **Edge Function**, **brand_kits-tabel** en **SHARED_PASSWORD** zijn al geset. Alleen de pmax-specifieke tabel hoef je éénmalig aan te maken — die staat in `supabase/migrations/20260430000001_pmax.sql` en is al gepusht naar de database.

Frontend is volledig zelfstandig draaiend — open `index.html` lokaal of deploy via GitHub Pages.

### GitHub Pages deploy

Settings → Pages → Source: `main` / `/ (root)` → Save → live op `https://erikotn.github.io/pmaxframe/`.

## Stack

- React 18 + Tailwind CSS + Babel-standalone (CDN, geen bundler)
- FileSaver.js voor PNG, JSZip voor batch-export
- Supabase Postgres (`pmax_designs` tabel, gedeelde `brand_kits` tabel)
- Edge Function `data` in SocialFrame v2 — uitgebreid met `pmax_designs` whitelist

## Architectuur-keuzes

- **Preview = canvas → image**: de preview rendert dezelfde canvas die de download produceert. Wat je ziet is wat je krijgt; geen losse JSX-kopieën die kunnen afwijken.
- **Telefoon-frame voor 3 placements** (Search/YouTube/Discover), **flat banner voor display**. Display krijgt een dunne grijze rand op een lichte achtergrond zodat het geen 'losse' indruk maakt.
- **Brand kits gedeeld**: zelfde `brand_kits`-tabel als SocialFrame. Sla Cosis één keer op, gebruik overal.

## Roadmap (v3)

- Gmail promotab placement (inbox-ad)
- Display banner in fake-website-context (krant-style greeking)
- 728×90 leaderboard layout (horizontaal, andere structuur)
- Animated headline-cycling preview
