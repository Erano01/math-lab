# topics/

Konu anlatımlarının tek kaynağı. Buradaki dosyalar tek başına derlenmez;
`exams/` ve `notes/` altındaki kitaplar bunları `\input` eder. Aynı tanım,
teorem ya da ispat yalnızca bir dosyada yazılır, gerekirse diğer dosyalar ona
`\cref` ile atıf yapar.

Klasörler sınava göre değil konuya göre düzenlenir ve en fazla iki seviye iner:
`<alan>/<alt-alan>/<konu>.tex`, ör. `number-theory/elementary/divisibility.tex`.
Seviye farkı klasörle değil dosyayla çözülür: `analysis/calculus/` hesaplamalı
anlatım (sınav ve üniversite calculus), `analysis/real/` ε-δ ile titiz anlatım.
Titiz dosya hesaplamalı olana atıf yapar, tanım ya da teorem kopyalamaz.

Alan klasörü yalnızca içine ilk içerik yazılırken açılır. Her alan klasöründe
MSC kodunu, kapsamını, alt alanlarını ve kaynak kitaplarını yazan kısa bir
README.md bulunur; kitaplar ayrıca `shared/refs.bib` içine eklenir.

Konu dosyalarında `\chapter` ya da `\section` kullanılmaz; `\topic`,
`\subtopic`, `\subsubtopic` kullanılır (`shared/lecture.sty`). Hangi seviyeye
eşleneceklerini kitap seçer. Başlıklar İngilizce, açıklamalar Türkçedir; bu
yüzden konu dosyalarını içeren kitaplar `\usepackage[mixed]{preamble}` ile
yüklenir.

## Alanlar ve etiket önekleri

Etiketler çakışmasın diye alan öneki taşır: `thm:nt:division-algorithm`,
`def:alg:group`, `eq:an:taylor`.

| Klasör                   | MSC 2020     | Önek   |
|--------------------------|--------------|--------|
| `foundations`            | 03, 18       | `fnd`  |
| `algebra`                | 08–20        | `alg`  |
| `number-theory`          | 11           | `nt`   |
| `analysis`               | 26–47        | `an`   |
| `differential-equations` | 34, 35       | `de`   |
| `geometry`               | 51–53, 14    | `geo`  |
| `topology`               | 54–57        | `top`  |
| `combinatorics`          | 05           | `comb` |
| `probability-statistics` | 60, 62       | `prob` |
| `numerical-analysis`     | 65           | `num`  |
| `optimization`           | 49, 90       | `opt`  |

Etiket türleri: `def`, `thm`, `lem`, `prop`, `cor`, `rem`, `ex` (örnek ve
alıştırma), `eq`, `sec`.
