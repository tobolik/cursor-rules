# Vytvoření repozitáře sensio-cz/cursor-rules na GitHubu

Tento návod slouží k **jednorázovému** vytvoření firemního repozitáře a nahrání obsahu.

---

## 1. Vytvořit repozitář na GitHubu

1. Přihlaste se na [github.com](https://github.com) a přepněte na organizaci **sensio-cz** (nebo vytvořte organizaci, pokud neexistuje).
2. Klikněte na **New repository**.
3. Nastavení:
   - **Repository name:** `cursor-rules`
   - **Description:** (volitelně) „Sdílená Cursor AI pravidla pro projekty Sensio.cz“
   - **Public** (nebo Private, podle firemní politiky).
   - **Nevybírejte** „Add a README“ ani jiné inicializační soubory – chcete prázdný repo.
4. Klikněte **Create repository**.

---

## 2. Nahrát obsah z tohoto projektu

Obsah složky `cursor-rules-firemni/` (z projektu nemovitosti) musí skončit v **kořeni** nového repozitáře.

### Varianta A: Přes Git (z počítače, kde máte tuto složku)

V terminálu (PowerShell nebo bash):

```powershell
cd c:\weby\nemovitosti.tobolik.cz\docs\cursor-rules-firemni
git init
git add -A
git commit -m "Initial: Cursor rules a instalační skripty"
git branch -M main
git remote add origin https://github.com/sensio-cz/cursor-rules.git
git push -u origin main
```

(Před tím je potřeba, aby na GitHubu už existoval prázdný repozitář `sensio-cz/cursor-rules` – viz krok 1.)

### Varianta B: Přes webové rozhraní GitHubu

1. Po vytvoření prázdného repo GitHub zobrazí návod „…or push an existing repository from the command line“. Můžete ho ignorovat.
2. V repozitáři klikněte **„uploading an existing file“** nebo **„Add file“ → „Upload files“**.
3. Přetáhněte sem **všechny** soubory a složky z `cursor-rules-firemni/`:
   - `README.md`
   - `SETUP-GITHUB.md`
   - `install.ps1`
   - `install.sh`
   - složka `rules/` (včetně všech čtyř souborů `.mdc`).
4. Commit message např.: „Initial: Cursor rules a instalační skripty“.
5. **Commit changes**.

---

## 3. Ověření

- Otevřete [https://github.com/sensio-cz/cursor-rules](https://github.com/sensio-cz/cursor-rules).
- V kořeni by měly být: `README.md`, `install.ps1`, `install.sh`, složka `rules/` s `*.mdc`.

Kolegové pak mohou klonovat a používat instalační skript podle hlavního README.
