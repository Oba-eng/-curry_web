# Curry-web
<img src="app/assets/images/ogp.png">

# サービス概要  
Curry-webはカレー愛好家のためのカレーレシピ投稿アプリです。このアプリは、私自身がカレーが好きでありカレーは家庭ごとに独自の味や秘密のレシピが存在することから、自分好みのカレーを見つけたり共有したりすることができるカレー愛好家のためのwebアプリを開発しました。このアプリでは、ユーザーは自分のオリジナルカレーレシピを投稿したり、他のユーザーが投稿したレシピを閲覧したりすることができます。

# 機能紹介
| レシピ一覧 | レシピ投稿 |
----|---- 
| [![Image from Gyazo](https://i.gyazo.com/bb3d8459416fc23503cb644832b4b602.gif)](https://gyazo.com/bb3d8459416fc23503cb644832b4b602) | [![Image from Gyazo](https://i.gyazo.com/eaf0b7a754fe1f1ade4853089b92413c.gif)](https://gyazo.com/eaf0b7a754fe1f1ade4853089b92413c) |
| 辛さレベル、カレージャンルでの検索をできるようにし自分好みのカレーを見つけやすいようにしました。 | 材料・分量、作り方を任意の数フォームを作成できるように工夫しました。 |

| お気に入り機能 | ユーザー登録機能 |
----|---- 
| [![Image from Gyazo](https://i.gyazo.com/b96f11820fface86e06d9a903e5b8bb3.gif)](https://gyazo.com/b96f11820fface86e06d9a903e5b8bb3) | [![Image from Gyazo](https://i.gyazo.com/18f2bc7cd683ac688524eedb73c1964d.gif)](https://gyazo.com/18f2bc7cd683ac688524eedb73c1964d) |
| お気に入り機能でいつでもレシピを見返すことができます。 | 簡単にユーザー登録をできるようGoogleアカウントでログインできるようにしました。 |

# 使用時術
### バックエンド 
- Ruby 3.0.2
- Rails 6.1.4
- gem
  - googleauth
  - meta-tags
  - ransack
  - mini_magick
  - carrierwave
  - sorcery
### フロントエンド  
- bootstrap
- javascript
### インフラ
- Heroku

# 画面遷移図
https://www.figma.com/design/q7widoIwWjuefhxADEomfm/%E7%84%A1%E9%A1%8C?node-id=157-2&t=QsC6sznatmoafY0j-1

# ER図
[![Image from Gyazo](https://i.gyazo.com/68b6519dd870a7e1606f2f3337c80bae.png)](https://gyazo.com/68b6519dd870a7e1606f2f3337c80bae)
