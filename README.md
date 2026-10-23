# ioTimer – odpočet naživo (GitHub + Supabase)

Funguje úplne bez Claude. Potrebuješ dva bezplatné účty: **Supabase** (databáza) a **GitHub** (webová stránka).

- **Diváci** otvoria odkaz `https://iotimer.github.io/` a vidia časomieru a program. Nemusia sa prihlasovať.
- **Ty** ovládaš na `https://iotimer.github.io/#ovladanie` (s prihlásením).
- **Projektor:** `https://iotimer.github.io/#projektor` ukáže iba časomieru.

---

## 1. Supabase (databáza), asi 10 minút

1. Choď na **supabase.com** → *Start your project* a zaregistruj sa (stačí e-mail alebo GitHub účet).
2. **New project**: zadaj názov (napr. `odpocet`), vymysli heslo databázy (zapíš si ho) a ako región vyber **Frankfurt (Central EU)**. Potvrď a počkaj asi 2 minúty.
3. V ľavom menu otvor **SQL Editor** → **New query**. Vlož celý obsah súboru **supabase.sql** a stlač **Run**. Má sa ukázať *Success*.
4. **Vytvor si prihlasovací účet:** ľavé menu **Authentication** → **Users** → **Add user** → **Create new user**. Zadaj svoj e-mail a heslo a zaškrtni **Auto Confirm User**. Týmto e-mailom a heslom sa budeš prihlasovať do ovládania.
5. **Zakáž registráciu cudzím:** **Authentication** → nastavenia prihlasovania (*Sign In / Providers*) → vypni **Allow new users to sign up**. Ovládať tak budeš môcť iba ty.
6. **Skopíruj si údaje na pripojenie:** **Project Settings** (ozubené koliesko) → **API** (alebo *Data API* a *API Keys*):
   - **Project URL**, napr. `https://abcdefgh.supabase.co`
   - verejný kľúč **anon** alebo **publishable** (nie *service_role* / *secret*!)

## 2. Doplň údaje do index.html

Otvor **index.html** v textovom editore (na Macu TextEdit, ideálne cez *Formát → Vytvoriť obyčajný text*) a hneď na začiatku prepíš tieto dva riadky:

```
const SUPABASE_URL = "https://VAS-PROJEKT.supabase.co";
const SUPABASE_KEY = "SEM-VLOZ-ANON-ALEBO-PUBLISHABLE-KLUC";
```

Ulož súbor. Verejný kľúč môže byť v stránke viditeľný, je na to určený. Meniť údaje aj tak môže iba prihlásený používateľ.

## 3. GitHub (webová stránka), asi 5 minút

1. Zaregistruj sa na **github.com**.
2. Stránka beží v organizácii **iotimer**, v repozitári **iotimer.github.io** (verejný).
3. Na stránke repozitára klikni na **uploading an existing file** (alebo *Add file → Upload files*), pretiahni tam **index.html** a klikni **Commit changes**.
4. **Settings** → **Pages** → v časti *Build and deployment* nastav *Source: Deploy from a branch*, *Branch: main* a priečinok */ (root)*, potom **Save**.
5. O 1 až 2 minúty bude stránka na adrese `https://iotimer.github.io/`.

## 4. Používanie

1. Otvor `https://iotimer.github.io/#ovladanie` a prihlás sa.
2. Načítaj CSV alebo napíš mená, potom **ŠTART**.
3. V ovládaní sú hore odkazy pre divákov a pre projektor aj s tlačidlom **Kopírovať**.

Ovládanie je rovnaké ako v predchádzajúcich verziách: medzerník, Enter alebo šípka doprava = ďalej, šípka doľava = späť, šípka hore/dole = ±30 s, + / − = ±1 min. Prezentačný ovládač funguje tiež.

## Dôležité

- **Bezplatný projekt Supabase sa po týždni nečinnosti uspí.** Pár dní pred akciou otvor supabase.com a ak je projekt pozastavený (*Paused*), klikni **Restore project**. Odporúčam to skontrolovať aj ráno v deň akcie.
- Úpravy stránky robíš tak, že na GitHube nahráš nový **index.html** (*Add file → Upload files*), prepíše starý. Údaje v Supabase ostanú.
- Ak zabudneš heslo, nové nastavíš v Supabase: **Authentication → Users** → tvoj účet → *Send password recovery* alebo ho zmaž a vytvor znova.
- Diváci potrebujú internet. Bez internetu ostáva offline verzia **Odpocet.html**.
