# Sensio.cz – Cursor Rules

Sdílená pravidla pro Cursor AI napříč projekty. Kolegové si je mohou nainstalovat do libovolného projektu a Cursor je bude při úpravách kódu respektovat.

**Repozitář:** [github.com/tobolik/cursor-rules](https://github.com/tobolik/cursor-rules)  
(Po vytvoření organizace **sensio-cz** na GitHubu lze repozitář do ní přenést: Settings → Danger zone → Transfer ownership.)

---

## Pro správce repozitáře (jednorázové vytvoření)

Pokud repo ještě neexistuje, vytvořte ho na GitHubu (organizace **sensio-cz**, název **cursor-rules**) a nahrajte sem obsah této složky. Podrobný návod je v souboru **SETUP-GITHUB.md**.

---

## Pro kolegy: jak si pravidla nainstalovat do projektu

### Možnost A: Instalační skript (doporučeno)

1. Naklonuj tento repozitář kamkoli (stačí jednou):
   ```bash
   git clone https://github.com/sensio-cz/cursor-rules.git
   ```
2. Ve svém **projektu** (tam, kde chceš pravidla používat) spusť:
   - **Windows (PowerShell):**
     ```powershell
     ..\cursor-rules\install.ps1
     ```
     nebo s cestou k repozitáři:
     ```powershell
     C:\cesta\k\cursor-rules\install.ps1 C:\cesta\k\tvuj-projekt
     ```
     (Nahraďte cestu za svůj klon repozitáře.)
   - **Linux / macOS:**
     ```bash
     ../cursor-rules/install.sh
     ```
     nebo:
     ```bash
     /cesta/k/cursor-rules/install.sh /cesta/k/tvuj-projekt
     ```
3. Skript zkopíruje soubory z `rules/*.mdc` do `TVŮJ_PROJEKT/.cursor/rules/` (složku vytvoří, existující soubory přepíše).

### Možnost B: Ruční zkopírování

1. Ve svém projektu vytvoř složku `.cursor/rules/` (pokud neexistuje).
2. Z tohoto repozitáře zkopíruj obsah složky **`rules/`** do `.cursor/rules/` ve svém projektu.

### Možnost C: Git submodul (pravidla se dají snadno aktualizovat)

Ve svém projektu:

```bash
git submodule add https://github.com/tobolik/cursor-rules.git .cursor/rules-upstream
```

Pak buď zkopíruj `rules-upstream/rules/*.mdc` do `.cursor/rules/`, nebo v projektu nastav symlink (na Windows může být potřeba admin). Jednodušší je skript:

```bash
.cursor/rules-upstream/install.sh .
```

Při aktualizaci pravidel v repu kolegové stačí:

```bash
git submodule update --remote .cursor/rules-upstream
.cursor/rules-upstream/install.sh .
```

---

## Co je v balíku

| Soubor | Popis |
|--------|--------|
| `version-increment.mdc` | Verze aplikace, cache busting (`?v=` u CSS/JS), závěrečná hláška (verze + push). Upravte cestu k souboru s verzí, pokud nemáte `index.html`. |
| `ux-ui-conventions.mdc` | Obecné UX/UI: poznámka (ořez + tooltip), scrollbary, tabulky, řazení, pruhování. |
| `soft-update-and-versioning.mdc` | Pro PHP projekty s soft-update: softInsert/softUpdate/softDelete, entity_id, valid_*. |
| `db-new-tables.mdc` | Pro nové DB tabulky (migrace) – sloupce, indexy, crud. |

Projekty bez PHP/DB soft-update mohou soubory `soft-update-and-versioning.mdc` a `db-new-tables.mdc` po instalaci smazat nebo nepoužívat.

---

## Jak aktualizovat pravidla u sebe

Když se v tomto repozitáři změní pravidla:

1. Stáhni změny: `git pull` v klonované složce `cursor-rules`.
2. Znovu spusť instalační skript ve svém projektu (viz Možnost A). Přepíše se `.cursor/rules/` aktuálními soubory.

---

## Úprava pravidel na míru projektu

Po instalaci můžeš v projektu upravit jednotlivé `.mdc` soubory (cesty v `globs`, odkazy na `index.html` atd.). Změny budou jen u vás. Pokud chcete úpravu sdílet, navrhněte úpravu v tomto repozitáři (PR nebo issue).
