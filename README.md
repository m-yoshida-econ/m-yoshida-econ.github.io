# m-yoshida.com (Quarto)

個人サイトのソース。`quarto preview` でローカル確認、`main` に push すると
GitHub Actions が render して GitHub Pages に公開する（ワークフローは未検証）。

## ファイル構成

- `_quarto.yml` : サイト設定（ナビ・テーマ・フォント）
- `styles.scss` : 配色・余白・ナビバーの上書き
- `index.qmd` : Home（`talks.md` を include して Recent Talks を表示）
- `talks.md` : Recent Talks の正本。1 行 1 件、新しい順に書く
- `research.qmd` : Research（`papers.bib` を読んで自動描画）
- `cv.qmd`, `cv.pdf` : CV（PDF は `cv.pdf` の名前で上書き更新）
- `papers.bib` : 論文リストの正本
- `papers/` : 論文・スライド・記事の PDF（Wix から移管済み）
- `R/render_bib.R` : bib を読んで HTML にする関数（base R のみ）
- `scripts/strip_generator.sh` : render 後に generator メタタグを削除
- `img/photo.jpg` : 写真（900px に縮小済み）

## 日常更新

- 発表を追加: `talks.md` の先頭に 1 行足す → push。

1. `papers.bib` にエントリを 1 つ追加（`section` は必須。
   `wp_revision` / `wp` / `pub` / `nonref` / `wip` のどれか）。
2. `quarto preview` で確認。
3. `git add -A && git commit -m "..." && git push`。

## 注意

- 素材フォルダ `~/Dropbox/website:` はフォルダ名のコロンが Quarto の
  テーマコンパイルを壊すため、プロジェクトは `~/Dropbox/m-yoshida-econ.github.io`
  に置いている。
- 論文 PDF は `papers/` にある（ファイル名は bib のキー＋`_slides`/`_article`）。
  新しい版は同じファイル名で上書きすれば bib を触らずに済む。
- `CNAME` は DNS 切替の直前に追加する（先に置くと github.io での確認が
  リダイレクトされてしまう）。
