# math-lab

Matematik notlarım ve araştırmalarım. LaTeX belgeleri `latex/`, Lean 4
formalizasyonları `lean/` altında. Üç tür içerik var: sınav odaklı konu
anlatımları (DGS, TYT, AYT), üniversite düzeyi öğrenme notları ve araştırma
projeleri.

LaTeX tarafında klasörler sınava göre değil matematik konusuna göre düzenlenir.
Bir konu `latex/topics/` altında tek bir kez yazılır, soruları
`latex/problems/` altında ayrı dosyalar olarak durur. Bunlar tek başına
derlenmez; `latex/exams/<sınav>/main.tex` gibi kitaplar onları `\input` eder.
Böylece bölünebilme gibi DGS, TYT ve AYT'de ortak olan bir konu üç kitapta da
aynı kaynaktan gelir. Üniversite notları `latex/notes/<konu>/main.tex`,
araştırma projeleri `latex/research/<proje>/main.tex` olarak kendi başına
derlenen belgelerdir. Ortak preamble, ders ortamları ve kaynakça
`latex/shared/` içindedir. Klasör kuralları, alan listesi ve etiket önekleri
`topics/README.md`, `problems/README.md` ve `research/README.md` dosyalarında.

Lean tarafı mathlib'e bağlı tek bir Lake projesidir (`MathLab`). Modüller
sınava göre değil alana göre `lean/MathLab/<Alan>/` altına yazılır (ör.
`NumberTheory/`) ve `lean/MathLab.lean` dosyasından import edilir.

## Kurulum ve derleme

```sh
sudo pacman -S --needed just texlive-binextra texlive-latex texlive-latexrecommended \
  texlive-latexextra texlive-fontsrecommended texlive-langeuropean texlive-luatex
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
```

```sh
just pdf     # exams, notes ve research altındaki main.tex dosyalarını derler
just lean    # mathlib önbelleğini indirir ve Lean projesini derler
just all     # ikisi birden
just clean   # LaTeX ara dosyalarını ve build/ klasörlerini siler
```

Tek bir belgeyi derlemek için `latex/` içinden
`latexmk -cd exams/dgs/main.tex` çalıştırılır; `.latexmkrc` yalnızca bu
dizinden okunur. `latex/` kökü TeX'in arama yolundadır, bu yüzden her belge
`\input{topics/...}` yazabilir; göreli `../../` yolları ve `\include`
kullanılmaz.

mathlib kaynaktan derlenmemeli, `lake build` öncesinde her zaman
`lake exe cache get` çalıştırılmalı (`just lean` bunu yapıyor). mathlib'i
güncellemek için `lake update && lake exe cache get`.

## Yeni içerik eklemek

**Konu.** `latex/topics/<alan>/<alt-alan>/<konu>.tex` dosyasını açın. Alan
klasörü yoksa oluşturup içine MSC kodu, kapsam, alt alanlar ve kaynak kitapları
yazan bir README.md koyun, kitapları `shared/refs.bib` dosyasına ekleyin.
Dosyada `\chapter`/`\section` yerine `\topic`, `\subtopic`, `\subsubtopic`
kullanın, etiketlere alan öneki verin (`thm:nt:...`). Konuyu ilgili kitapta
`\input` edin.

**Soru.** `latex/problems/<alan>/<alt-alan>/<konu>/<id>.tex` dosyasını açın,
başına metadata yorumlarını yazın, soruyu `example`, çözümü `solution` içine
koyun. Şablon `problems/README.md` içinde. Soruyu kitapta ilgili konunun
arkasından `\input` edin.

**Sınav kitabı.** `latex/exams/<sınav>/main.tex` oluşturun; `exams/dgs/main.tex`
örnek alınabilir. Kitap `\usepackage[mixed]{preamble}` ve
`\usepackage{lecture}` yükler, yalnızca önsöz ve `\input` satırları içerir.
`\topic` sınıfta `\chapter` varsa bölüme, yoksa `section`'a eşlenir;
değiştirmek için `\lecturelevel{section}`.

**Araştırma projesi.** `latex/research/<proje>/main.tex` ve yanına
`type`, `msc`, `status` etiketlerini taşıyan bir README.md açın; şablon
`research/README.md` içinde. Lean tarafı varsa `lean/MathLab/<Alan>/`
altına yazıp `lean/MathLab.lean` dosyasına import satırı ekleyin.

`just pdf` yeni `main.tex` dosyalarını kendisi bulur; CI da aynı klasörleri
derleyip PDF'leri artifact olarak yükler.
