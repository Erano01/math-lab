# problems/

Soru bankası. Her soru ayrı bir dosyadır ve tek başına derlenmez; kitaplar
`\input` eder. Klasörler `topics/` ile aynı hiyerarşiyi izler, konu dosyasının
adı burada klasör olur:

    problems/number-theory/elementary/divisibility/<id>.tex

`<id>` kısa ve kebab-case olur; ÖSYM soruları için `dgs-2024-07` gibi
sınav-yıl-numara, diğerleri için içeriği anlatan bir ad.

Dosyanın başında yorum satırı olarak metadata bulunur, ardından soru `example`
(ya da `exercise`) ortamında, çözüm `solution` ortamında yazılır:

```latex
% source: ÖSYM | original | <kitap>
% exam: DGS | TYT | AYT | none
% year: 2024
% topic: number-theory/elementary/divisibility
% answer: 11
\begin{example}\label{ex:nt:dgs-2024-07}
  ...
\end{example}
\begin{solution}
  ...
  \answer{11}
\end{solution}
```
